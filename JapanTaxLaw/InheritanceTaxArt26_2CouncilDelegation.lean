import JapanTaxLaw.TaxFinance

/-!
# InheritanceTaxArt26_2CouncilDelegation — DELEGATION

Pinned source:
  Law id: 325AC0000000073
  Official title: 相続税法
  Law number: 昭和二十五年法律第七十三号
  Law type: Act (法律)
  Raw snapshot: data/raw/325AC0000000073_*.law.json
  sha256: c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7
  Normative unit id: NORM|71d63adebe639fdaa8b15a6c233f2b4f772ce393e183c33416e482e41a551e57
  Source path: LawBody[3]/MainProvision/MainProvision[2]/Article:26_2/Article#26_2/Paragraph#5/ParagraphSentence/Sentence#1

原文逐語（pinned, 一字一句改変なし）:
  「前二項に定めるもののほか、土地評価審議会の組織及び運営に関し必要な事項は、政令で定める。」

Norm kind: DELEGATION — beyond the preceding two paragraphs, matters necessary
for the organisation and operation of the land valuation council are prescribed
by Cabinet Order. The computable slice models the delegation-target selection.
The statutory quote above is byte-verbatim from the pinned source; English
prose here is descriptive only.

Variable contract (meaning / domain / type):
  DelegationTarget : Type — cabinetOrder, statute, other.
  delegationTarget : DelegationTarget — the selected target.
  No numeric amount/unit applies (structural selection). The content of the
  delegated Cabinet Order and legal correctness are NOT MODELLED.
  Human legal review pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.InheritanceTaxArt26_2CouncilDelegation

/-- Possible targets of the delegation. -/
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

end JapanTaxLaw.InheritanceTaxArt26_2CouncilDelegation
