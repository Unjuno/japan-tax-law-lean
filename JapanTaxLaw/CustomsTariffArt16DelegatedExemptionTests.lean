import JapanTaxLaw.CustomsTariffArt16DelegatedExemptionSpec

/-!
# CustomsTariffArt16DelegatedExemptionTests — kernel-checked checks

Verifies DELEGATION 「左の各号に掲げる貨物で輸入されるものについては、政令で定めるところにより、その関税を免除する。」: Cabinet Order target, exemption effect.
-/

namespace JapanTaxLaw.CustomsTariffArt16DelegatedExemption

example : delegationTarget = DelegationTarget.cabinetOrder := target_is_cabinet_order
example : delegationTarget ≠ DelegationTarget.statute := statute_not_selected
example : dutyEffect = DutyEffect.exemption := effect_is_exemption
example : dutyEffect ≠ DutyEffect.reduction := reduction_not_selected
example : SpecTarget delegationTarget := target_satisfies_spec
example : SpecEffect dutyEffect := effect_satisfies_spec
example : ¬ SpecTarget DelegationTarget.statute := statute_not_satisfying
example : ¬ SpecEffect DutyEffect.reduction := reduction_not_satisfying

end JapanTaxLaw.CustomsTariffArt16DelegatedExemption
