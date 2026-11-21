import JapanTaxLaw.CustomsTariffArt4_9DelegationSpec

/-!
# CustomsTariffArt4_9DelegationTests — kernel-checked checks for 関税定率法 第四条の九(1)

Verifies the delegation structure: in-Act matters are determined by the Act,
delegated 課税価格 matters by 政令; the two sources are distinct and non-overlapping.
-/

namespace JapanTaxLaw.CustomsTariffArt4_9Delegation

-- Residual (in-Act) matters are determined by the Act.
example : determinedBy Matter.inAct = LegalSource.act := in_act_not_delegated

-- Delegated matters (課税価格 computation) are determined by 政令.
example : determinedBy Matter.necessaryForCustomsValue = LegalSource.cabinetOrder :=
  delegated_uses_cabinet_order

-- The two sources are distinct (non-overlap of the two classes).
example : LegalSource.act ≠ LegalSource.cabinetOrder := act_ne_cabinet_order

-- Universal agreement with the independent propositional spec.
example (m : Matter) : SpecDeterminedBy m (determinedBy m) := agree_determined_by m

end JapanTaxLaw.CustomsTariffArt4_9Delegation
