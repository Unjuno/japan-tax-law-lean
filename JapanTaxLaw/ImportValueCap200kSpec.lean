import JapanTaxLaw.ImportValueCap200k

/-
# ImportValueCap200kSpec — independent spec for 関税定率法施行令 第十三条の六

Pinned source:
  Law id: 329CO0000000155
  Revision: 329CO0000000155_20260401_508CO0000000085
  Raw snapshot: data/raw/329CO0000000155_20260401_508CO0000000085.law.json
  sha256: 7f76960b6510a6bd086c236c7d7facf5e47cb276f24a3f4a705c0c0aa8e15d01
  Article: 第十三条の六 (raw JSON Article attr.Num = "13_6")
  原文逐語: 「輸入する者ごとに財務省令で定めるところにより計算した輸入する物品の額の総額が二十万円を超えない範囲内において財務省令で定める額以下である場合における当該輸入する物品以外のもの」

INDEPENDENT FORMULATION. This module carries its OWN statutory constant
`specCap : Nat := 200_000` (二十万円) and expresses 「二十万円を超えない」 as
`decide (¬ specCap < amount)` — a STRICT `<` with negation, deliberately a
DIFFERENT operator from the implementation's non-strict `<=`.

The ONLY bridge is the universal, axiom-free theorem `agreeWithin`, proved by a
pure `simp [Nat.not_lt]` rewrite: the constructive theorem Nat.not_lt turns
`¬ 200000 < amount` into `amount <= 200000`. No `by_cases`, no `omega`, no
`Classical.choice` is used in the bridge. No implementation identifier
(`valueCap`, `withinCap`) appears in any independent `spec*` formula; the
agreement theorem is not an independent formula.

Variable contract: amount = 輸入する物品の額の総額 (Nat, 円, whole yen);
二十万円 = 200,000 円; 超えない = <= INCLUSIVE (200,000 qualifies).
Not modelled (same as the implementation): the delegated 「財務省令で定める額以下」
condition, the calculation method, the goods classification and other articles.
spec_literals = {200000}: the source verifies 二十万 = 200,000 via the 万-aware
kanji converter.

No `sorry`, `admit`, `axiom`, `Classical.choice`, `Monotone`, or struct literals.
-/

namespace JapanTaxLaw.ImportValueCap200k

/-- Spec-local cap: 二十万円 = 200,000 (円, Nat). Independent of the impl. -/
def specCap : Nat := 200_000

/-- Independent 「二十万円を超えない」: NOT (specCap < amount). Strict `<` + negation. -/
def specWithin (amount : Nat) : Bool :=
  decide (¬ specCap < amount)

/-- Universal, kernel-checked correspondence for every Nat amount.
    Pure constructive bridge: `simp [Nat.not_lt]` rewrites `¬ 200000 < amount`
    to `amount <= 200000`; no `by_cases`, no `omega`, no `Classical.choice`. -/
theorem agreeWithin (amount : Nat) :
    withinCap amount = specWithin amount := by
  unfold withinCap specWithin valueCap specCap
  simp [Nat.not_lt]

-- Spec-local, kernel-decided spot-checks (independent of the implementation).
example : specWithin 0 = true := by decide
example : specWithin 1 = true := by decide
example : specWithin 199_999 = true := by decide
example : specWithin 200_000 = true := by decide
example : specWithin 200_001 = false := by decide

end JapanTaxLaw.ImportValueCap200k
