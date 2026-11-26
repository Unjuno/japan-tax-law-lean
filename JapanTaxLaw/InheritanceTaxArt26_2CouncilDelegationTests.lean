import JapanTaxLaw.InheritanceTaxArt26_2CouncilDelegationSpec

/-!
# InheritanceTaxArt26_2CouncilDelegationTests — kernel-checked checks

Verifies DELEGATION 「前二項に定めるもののほか、土地評価審議会の組織及び運営に関し必要な事項は、政令で定める。」: Cabinet Order selected; statute not.
-/

namespace JapanTaxLaw.InheritanceTaxArt26_2CouncilDelegation

example : delegationTarget = DelegationTarget.cabinetOrder := target_is_cabinet_order
example : delegationTarget ≠ DelegationTarget.statute := statute_not_selected
example : SpecDelegationTarget delegationTarget := implementation_satisfies_spec
example : ¬ SpecDelegationTarget DelegationTarget.statute := statute_not_satisfying

end JapanTaxLaw.InheritanceTaxArt26_2CouncilDelegation
