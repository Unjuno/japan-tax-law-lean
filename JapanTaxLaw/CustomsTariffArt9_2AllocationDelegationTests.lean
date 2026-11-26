import JapanTaxLaw.CustomsTariffArt9_2AllocationDelegationSpec

/-!
# CustomsTariffArt9_2AllocationDelegationTests — kernel-checked checks

Verifies DELEGATION 「前項の割当ての方法、割当てを受ける手続その他同項の規定の適用に関して必要な事項は、政令で定める。」: Cabinet Order selected; statute/other not.
-/

namespace JapanTaxLaw.CustomsTariffArt9_2AllocationDelegation

example : delegationTarget = DelegationTarget.cabinetOrder := target_is_cabinet_order
example : delegationTarget ≠ DelegationTarget.statute := statute_not_selected
example : delegationTarget ≠ DelegationTarget.other := other_not_selected
example : SpecDelegationTarget delegationTarget := implementation_satisfies_spec
example : ¬ SpecDelegationTarget DelegationTarget.statute := statute_not_satisfying
example : ¬ SpecDelegationTarget DelegationTarget.other := other_not_satisfying

end JapanTaxLaw.CustomsTariffArt9_2AllocationDelegation
