import JapanTaxLaw.JointSignatureHeirThreshold

/-
# JointSignatureHeirThresholdSpec — independent spec for 印紙税法施行令 第十条

Pinned source:
  Law id: 342CO0000000108
  Revision: 342CO0000000108_20250401_507CO0000000006
  Raw snapshot: data/raw/342CO0000000108_20250401_507CO0000000006.law.json
  sha256: fcd1097f54737de069b8289eda6e6326e566926b2a03375cb16ad9cc69ace8d1
  Article: 第十条 (raw JSON Article attr.Num = "10")
  Original needle: 「相続人が二人以上ある場合には、前項の申告書は、各相続人が連署して提出するものとする。」

INDEPENDENT FORMULATION. This module carries its OWN statutory constant
`specThreshold : Nat := 2` (二人) and expresses 「二人以上」 as
`decide (¬ heirs < specThreshold)` — a STRICT `<` with negation, deliberately a
DIFFERENT operator from the implementation's non-strict `>=`. No implementation
identifier (`heirThreshold`, `jointSignatureRequired`) appears in any
independent `spec*` formula; the agreement theorem is not an independent formula.

The ONLY bridge is the universal, axiom-free theorem `agreeRequired`, proved by a
pure `simp [Nat.not_lt]` rewrite: the constructive theorem Nat.not_lt turns
`¬ heirs < 2` into `2 <= heirs`. No `by_cases`, no `omega`, no
`Classical.choice` is used in the bridge.

Variable contract: heirs = 相続人の数 (Nat, unit 人); 二人以上 = >=2 inclusive
(2 heirs qualifies). Not modelled (same as the implementation): 前項の申告書,
各相続人, the act of 連署して提出する, procedural details, other paragraphs and
other articles.
-/

namespace JapanTaxLaw.JointSignatureHeirThreshold

/-- Spec-local threshold: 二人 = 2 (人, Nat). Independent of the impl. -/
def specThreshold : Nat := 2

/-- Independent 「二人以上」: NOT (heirs < specThreshold). Strict `<` + negation. -/
def specRequired (heirs : Nat) : Bool :=
  decide (¬ heirs < specThreshold)

/-- Universal, kernel-checked correspondence for every Nat count.
    Pure constructive bridge: `simp [Nat.not_lt]` rewrites `¬ heirs < 2`
    to `2 <= heirs`; no `by_cases`, no `omega`, no `Classical.choice`. -/
theorem agreeRequired (heirs : Nat) :
    jointSignatureRequired heirs = specRequired heirs := by
  unfold jointSignatureRequired specRequired heirThreshold specThreshold
  simp [Nat.not_lt]

-- Spec-local, kernel-decided spot-checks (independent of the implementation).
example : specRequired 0 = false := by decide
example : specRequired 1 = false := by decide
example : specRequired 2 = true := by decide
example : specRequired 3 = true := by decide

end JapanTaxLaw.JointSignatureHeirThreshold
