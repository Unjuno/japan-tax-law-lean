import JapanTaxLaw.CustomsTariffArt8_2DelegationSpec

/-!
# CustomsTariffArt8_2DelegationTests — kernel-checked checks for 関税定率法 第八条の二(17)

Verifies the residual DELEGATION 「前各項に定めるもののほか、第一項の規定による関税の適用に関し必要な事項は、政令で定める。」:
in-Act matters remain with the Act; necessary application matters are delegated to 政令.
-/

namespace JapanTaxLaw.CustomsTariffArt8_2Delegation

-- In-Act matters are determined by the Act, not delegated.
example : determinedBy Matter.inAct = LegalSource.act := in_act_not_delegated

-- Necessary application matters are delegated to Cabinet Order (政令).
example : determinedBy Matter.necessaryForApplication = LegalSource.cabinetOrder := application_delegated

-- Independent spec agreement (axiom-free).
example : SpecInActNotDelegated (determinedBy Matter.inAct) := agree_in_act_not_delegated
example : SpecApplicationDelegated (determinedBy Matter.necessaryForApplication) := agree_application_delegated

-- The two matter classes and two legal sources are distinct.
example : Matter.inAct ≠ Matter.necessaryForApplication := by decide
example : LegalSource.act ≠ LegalSource.cabinetOrder := by decide

end JapanTaxLaw.CustomsTariffArt8_2Delegation
