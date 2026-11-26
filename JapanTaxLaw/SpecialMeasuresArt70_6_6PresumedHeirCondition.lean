import JapanTaxLaw.TaxFinance

/-!
# SpecialMeasuresArt70_6_6PresumedHeirCondition — PRESUMPTION

Pinned source:
  Law id: 332AC0000000026
  Official title: 租税特別措置法
  Law number: 昭和三十二年法律第二十六号
  Law type: Act (法律)
  Raw snapshot: data/raw/332AC0000000026_*.law.json
  sha256: e6e6013bbc0608c6b48dea01d50ac847c3e5d094f0420223171ffe1b5cf8d5ee
  Normative unit id: NORM|293a349f6f7d21dda09ef6ffecee55039fbaab8d4060af0cf337703a58b76a3a
  Source path: LawBody[3]/MainProvision/MainProvision[3]/Article:70_6_6/Article#70_6_6/Paragraph#2/Item#4/Subitem1#1/Subitem1Sentence/Sentence#1

原文逐語（pinned, 一字一句改変なし）:
  「当該個人が、当該相続の開始の直前において、当該被相続人の推定相続人であること。」

Norm kind: PRESUMPTION — the person was the presumed heir of the decedent
immediately before the inheritance opened. The computable slice models the
case-selection flag only. The statutory quote above is byte-verbatim from the
pinned source; English prose here is descriptive only.

Variable contract (meaning / domain / type):
  wasPresumedHeir : Bool — caller-established status immediately before opening.
  qualifies : Bool -> Prop — the condition is met when the flag is true.
  No numeric amount/unit applies (structural case selection). The determination
  of heir status and legal correctness are NOT MODELLED.
  Human legal review pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.SpecialMeasuresArt70_6_6PresumedHeirCondition

/-- The presumption condition. -/
def qualifies (wasPresumedHeir : Bool) : Prop :=
  wasPresumedHeir = true

/-- A presumed heir satisfies the condition. -/
theorem presumed_heir_qualifies : qualifies true := rfl

/-- A non-presumed heir does not satisfy the condition. -/
theorem non_heir_rejected : ¬ qualifies false := by
  intro h
  cases h

end JapanTaxLaw.SpecialMeasuresArt70_6_6PresumedHeirCondition
