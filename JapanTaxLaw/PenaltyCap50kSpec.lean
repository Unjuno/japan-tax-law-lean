import JapanTaxLaw.PenaltyCap50k

/-
# PenaltyCap50kSpec — independent spec for ＴＩＲ条約実施に伴う関税法等の特例に関する法律 第十八条

Pinned source:
  Law id: 346AC0000000065
  Revision: 346AC0000000065_20120401_424AC0000000019
  Raw snapshot: data/raw/346AC0000000065_20120401_424AC0000000019.law.json
  sha256: 82bef1179656ff64b2d1b118e065b6373071425a93d8dfbfcf2a43e195b6daf7
  Article: 第十八条 (raw JSON Article attr.Num = "18")
原文逐語: 「次の各号のいずれかに該当する者は、五万円以下の罰金に処する。」

INDEPENDENT FORMULATION. This module carries its OWN statutory constant
`specFineCap : Nat := 50_000` (五万円) and expresses 「五万円以下」 as
`decide (¬ specFineCap < amount)` — a STRICT `<` with negation, deliberately a
DIFFERENT operator from the implementation's non-strict `<=`.

The ONLY bridge is the universal, axiom-free theorem `agreeWithin`, proved by a
pure `simp [Nat.not_lt]` rewrite: the constructive theorem Nat.not_lt turns
`¬ 50000 < amount` into `amount <= 50000`. No `by_cases`, no `omega`, no
`Classical.choice` is used in the bridge. No implementation identifier
(`fineCap`, `withinFineCap`) appears in any independent `spec*` formula; the
agreement theorem is not an independent formula.

Variable contract: amount = 罰金の額 (Nat, 円, whole yen); 以下 is inclusive.
Not modelled (same as the implementation): 各号, the referenced treaties,
other articles and actual sentencing.
-/

namespace JapanTaxLaw.PenaltyCap50k

/-- Spec-local cap: 五万円 = 50,000 (円, Nat). Independent of the impl. -/
def specFineCap : Nat := 50_000

/-- Independent 「五万円以下」: NOT (specFineCap < amount). Strict `<` + negation. -/
def specWithin (amount : Nat) : Bool :=
  decide (¬ specFineCap < amount)

/-- Universal, kernel-checked correspondence for every Nat amount.
    Pure constructive bridge: `simp [Nat.not_lt]` rewrites `¬ 50000 < amount`
    to `amount <= 50000`; no `by_cases`, no `omega`, no `Classical.choice`. -/
theorem agreeWithin (amount : Nat) :
    withinFineCap amount = specWithin amount := by
  unfold withinFineCap specWithin fineCap specFineCap
  simp [Nat.not_lt]

-- Spec-local, kernel-decided spot-checks (independent of the implementation).
example : specWithin 0 = true := by decide
example : specWithin 1 = true := by decide
example : specWithin 49_999 = true := by decide
example : specWithin 50_000 = true := by decide
example : specWithin 50_001 = false := by decide

end JapanTaxLaw.PenaltyCap50k
