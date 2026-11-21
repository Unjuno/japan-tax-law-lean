import JapanTaxLaw.AviationFuelTaxAmountFloor

/-
# AviationFuelTaxAmountFloorSpec — independent spec for 国税局課税部等所掌事務範囲省令 第二条

Pinned source:
  Law id: 352M50000040032
  Revision: 352M50000040032_20220710_504M60000040044
  Raw snapshot: data/raw/352M50000040032_20220710_504M60000040044.law.json
  sha256: d626cf16d9fed1f7c4c51c463edd7e23b40bd66063cbbd79f3fe3055324610ed
  Article: 第二条 (raw JSON Article attr.Num = "2")
  Original needle:
  「当該積込みの場所において一年中に航空機に積み込まれた航空機燃料に係る航空機燃料税の額に相当する金額が五千万円以上であること」

INDEPENDENT FORMULATION. This module carries its OWN statutory constant
`specFloor : Nat := 50_000_000` (五千万円 = 50,000,000 円) and expresses
「五千万円以上」 as `decide (¬ amount < specFloor)` — a STRICT `<` under
negation, deliberately a DIFFERENT operator from the implementation's
non-strict `>=`.

The ONLY bridge is the universal, axiom-free theorem `agreeFloor`, proved by a
pure `simp [Nat.not_lt]` rewrite: the constructive theorem Nat.not_lt turns
`¬ amount < 50000000` into `50000000 <= amount`. No `by_cases`, no `omega`,
no `Classical.choice` is used in the bridge. No implementation identifier
(`amountFloor`, `meetsFloor`) appears in any independent `spec*` formula; the
agreement theorem is not an independent formula.

Variable contract: amount = 航空機燃料税の額に相当する金額 (Nat, 円), over 一年;
以上 is inclusive. Not modelled (same as the implementation): the loading-place
condition, the one-year window, the actor/office competencies, and other articles.
spec_literals = {50000000}: the source verifies 五千万 = 50,000,000 via the
万/億-aware kanji converter.

No `sorry`, `admit`, `axiom`, `Classical.choice`, `Monotone`, or struct literals.
-/

namespace JapanTaxLaw.AviationFuelTaxAmountFloor

/-- Spec-local floor: 五千万円 = 50_000_000 (円, Nat). Independent of the impl. -/
def specFloor : Nat := 50_000_000

/-- Independent 「五千万円以上」: NOT (amount < specFloor). Strict `<` + negation. -/
def specMeets (amount : Nat) : Bool :=
  decide (¬ amount < specFloor)

/-- Universal, kernel-checked correspondence for every Nat amount.
    Pure constructive bridge: `simp [Nat.not_lt]` rewrites
    `¬ amount < 50000000` to `50000000 <= amount`; no `by_cases`, no `omega`,
    no `Classical.choice`. -/
theorem agreeFloor (amount : Nat) :
    meetsFloor amount = specMeets amount := by
  unfold meetsFloor specMeets amountFloor specFloor
  simp [Nat.not_lt]

-- Spec-local, kernel-decided spot-checks (independent of the implementation).
example : specMeets 0 = false := by decide
example : specMeets 1 = false := by decide
example : specMeets 49_999_999 = false := by decide
example : specMeets 50_000_000 = true := by decide
example : specMeets 50_000_001 = true := by decide

end JapanTaxLaw.AviationFuelTaxAmountFloor
