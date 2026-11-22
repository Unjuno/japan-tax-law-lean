import JapanTaxLaw.CustomsTariffArt6RetaliatoryDelegationSpec

/-!
# CustomsTariffArt6RetaliatoryDelegationTests — kernel-checked checks for 関税定率法 第六条(3)

Verifies the residual delegation 「前二項に定めるもののほか、これらの規定の適用に
関し必要な事項は、政令で定める。」: in-Act matters stay with the Act, necessary
application matters are delegated to 政令, and universal agreement with the
independent propositional-relation spec.
-/

namespace JapanTaxLaw.CustomsTariffArt6RetaliatoryDelegation

-- In-Act matters are determined by the Act, not delegated.
example : determinedBy Matter.inAct = LegalSource.act := in_act_not_delegated

-- Necessary application matters are delegated to 政令 (Cabinet Order).
example : determinedBy Matter.necessaryForApplication = LegalSource.cabinetOrder :=
  application_delegated

-- The two matter classes are distinct (non-overlap encoded by the inductive).
example : Matter.inAct ≠ Matter.necessaryForApplication := by decide

-- The two legal sources are distinct.
example : (LegalSource.act : LegalSource) ≠ LegalSource.cabinetOrder := by decide

-- Universal agreement with the independent propositional-relation spec.
example (m : Matter) : SpecDeterminedBy m (determinedBy m) := agree_determined_by m

end JapanTaxLaw.CustomsTariffArt6RetaliatoryDelegation
