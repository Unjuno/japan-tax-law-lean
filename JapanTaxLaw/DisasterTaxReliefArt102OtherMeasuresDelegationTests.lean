import JapanTaxLaw.DisasterTaxReliefArt102OtherMeasuresDelegationSpec

/-!
# DisasterTaxReliefArt102OtherMeasuresDelegationTests — kernel-checked checks

Verifies DELEGATION 「（その他の経過措置の政令への委任）」: Cabinet Order selected; statute not.
-/

namespace JapanTaxLaw.DisasterTaxReliefArt102OtherMeasuresDelegation

example : delegationTarget = DelegationTarget.cabinetOrder := target_is_cabinet_order
example : delegationTarget ≠ DelegationTarget.statute := statute_not_selected
example : SpecDelegationTarget delegationTarget := implementation_satisfies_spec
example : ¬ SpecDelegationTarget DelegationTarget.statute := statute_not_satisfying

end JapanTaxLaw.DisasterTaxReliefArt102OtherMeasuresDelegation
