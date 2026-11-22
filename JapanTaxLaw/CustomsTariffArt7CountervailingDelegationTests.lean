import JapanTaxLaw.CustomsTariffArt7CountervailingDelegationSpec

/-!
# CustomsTariffArt7CountervailingDelegationTests — kernel-checked checks for 関税定率法 第七条(33)

Verifies the residual delegation: in-Act matters are determined by the Act
(not delegated); matters necessary for 相殺関税 application are delegated to 政令.
-/

namespace JapanTaxLaw.CustomsTariffArt7CountervailingDelegation

-- Residual ほか: in-Act matters determined by the Act; application matters by 政令.
example : determinedBy Matter.inAct = LegalSource.act := in_act_not_delegated
example : determinedBy Matter.necessaryForApplication = LegalSource.cabinetOrder := application_delegated

-- Independent spec agrees.
example : SpecDeterminedBy Matter.inAct LegalSource.act := in_act_by_act
example : SpecDeterminedBy Matter.necessaryForApplication LegalSource.cabinetOrder := application_by_order

-- Universal agreement with the independent spec.
example (m : Matter) : SpecDeterminedBy m (determinedBy m) := agree_determined_by m

end JapanTaxLaw.CustomsTariffArt7CountervailingDelegation
