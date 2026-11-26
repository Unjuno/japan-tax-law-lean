import JapanTaxLaw.TaxFinance

/-!
# CustomsTariffArt16DelegatedExemption — DELEGATION

Pinned source:
  Law id: 143AC0000000054
  Official title: 関税定率法
  Law number: 明治四十三年法律第五十四号
  Law type: Act (法律)
  Raw snapshot: data/raw/143AC0000000054_*.law.json
  sha256: 924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c
  Normative unit id: NORM|6868ae3dc5dbd0c5012476e69b40a267ebccf7ed6abc90c7a3a695b3cec23df8
  Source path: LawBody[1]/MainProvision/MainProvision[29]/Article:16/Article#16/Paragraph#1/ParagraphSentence/Sentence#1

原文逐語（pinned, 一字一句改変なし）:
  「左の各号に掲げる貨物で輸入されるものについては、政令で定めるところにより、その関税を免除する。」

Norm kind: DELEGATION — for goods listed in the left columns, the customs duty
is exempted to the extent prescribed by Cabinet Order. The computable slice
models the delegation-target selection and the exemption-effect selection.
The statutory quote above is byte-verbatim from the pinned source; English
prose here is descriptive only.

Variable contract (meaning / domain / type):
  DelegationTarget : Type — cabinetOrder, statute, other.
  DutyEffect : Type — exemption, reduction, other.
  delegationTarget : DelegationTarget — Cabinet Order.
  dutyEffect : DutyEffect — exemption.
  No numeric amount/rate applies (structural selection). The listed goods,
  Cabinet Order content, and legal correctness are NOT MODELLED.
  Human legal review pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.CustomsTariffArt16DelegatedExemption

/-- Possible targets of the delegation. -/
inductive DelegationTarget : Type
  | cabinetOrder : DelegationTarget
  | statute : DelegationTarget
  | other : DelegationTarget

/-- Possible duty effects. -/
inductive DutyEffect : Type
  | exemption : DutyEffect
  | reduction : DutyEffect
  | other : DutyEffect

/-- The delegation is to Cabinet Order. -/
def delegationTarget : DelegationTarget := DelegationTarget.cabinetOrder

/-- The prescribed effect is exemption. -/
def dutyEffect : DutyEffect := DutyEffect.exemption

/-- The target is Cabinet Order. -/
theorem target_is_cabinet_order : delegationTarget = DelegationTarget.cabinetOrder := rfl

/-- Statute is not the target. -/
theorem statute_not_selected : delegationTarget ≠ DelegationTarget.statute := by
  unfold delegationTarget
  intro h
  cases h

/-- The effect is exemption. -/
theorem effect_is_exemption : dutyEffect = DutyEffect.exemption := rfl

/-- Reduction is not the selected effect. -/
theorem reduction_not_selected : dutyEffect ≠ DutyEffect.reduction := by
  unfold dutyEffect
  intro h
  cases h

end JapanTaxLaw.CustomsTariffArt16DelegatedExemption
