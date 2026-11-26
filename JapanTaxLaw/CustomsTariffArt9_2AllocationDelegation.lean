import JapanTaxLaw.TaxFinance

/-!
# CustomsTariffArt9_2AllocationDelegation — DELEGATION

Pinned source:
  Law id: 143AC0000000054
  Official title: 関税定率法
  Law number: 明治四十三年法律第五十四号
  Law type: Act (法律)
  Raw snapshot: data/raw/143AC0000000054_*.law.json
  sha256: 924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c
  Normative unit id: NORM|394bf11a8e17fa0cc29bcf58c0b9cfbc097d3c85ea48474966bcde22e685466e
  Source path: LawBody[1]/MainProvision/MainProvision[20]/Article:9_2/Article#9_2/Paragraph#2/ParagraphSentence/Sentence#1

原文逐語（pinned, 一字一句改変なし）:
  「前項の割当ての方法、割当てを受ける手続その他同項の規定の適用に関して必要な事項は、政令で定める。」

Norm kind: DELEGATION — the matters necessary for applying the preceding
paragraph's allocation method, procedures for receiving an allocation, and
other necessary matters are delegated to Cabinet Order. The computable slice
models exactly the delegation-target selection. The statutory quote above is
byte-verbatim from the pinned source; English prose here is descriptive only.

Variable contract (meaning / domain / type):
  DelegationTarget : Type — cabinetOrder, statute, other.
  delegationTarget : DelegationTarget — the selected target of the delegation.
  No numeric amount/unit applies (structural target selection). The content of
  the delegated Cabinet Order and legal correctness are NOT MODELLED.
  Human legal review pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.CustomsTariffArt9_2AllocationDelegation

/-- The possible targets of the delegation. -/
inductive DelegationTarget : Type
  | cabinetOrder : DelegationTarget
  | statute : DelegationTarget
  | other : DelegationTarget

/-- The delegation is to Cabinet Order. -/
def delegationTarget : DelegationTarget := DelegationTarget.cabinetOrder

/-- The selected target is Cabinet Order. -/
theorem target_is_cabinet_order : delegationTarget = DelegationTarget.cabinetOrder := rfl

/-- Statute is not the selected target. -/
theorem statute_not_selected : delegationTarget ≠ DelegationTarget.statute := by
  unfold delegationTarget
  intro h
  cases h

/-- An unspecified target is not selected. -/
theorem other_not_selected : delegationTarget ≠ DelegationTarget.other := by
  unfold delegationTarget
  intro h
  cases h

end JapanTaxLaw.CustomsTariffArt9_2AllocationDelegation
