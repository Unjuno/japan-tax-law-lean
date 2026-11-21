import JapanTaxLaw.CustomsTariffArt4_9Delegation

/-!
# CustomsTariffArt4_9DelegationSpec — independent spec for 関税定率法 第四条の九(1)

Law id: 143AC0000000054 (関税定率法, Act), revision 143AC0000000054_20260601_508AC0000000005
Article: 第四条の九(1)（政令への委任）— besides matters in the Act, matters
         necessary for computing 課税価格 of imported goods are prescribed by 政令.
Normative unit: NORM|183467aae196b171afed87ed9853b9060bb48487f6da8c909d3dbe4f896bc1d4

The implementation is a function `determinedBy : Matter -> LegalSource`. The
independent spec states the delegation as a PROPOSITIONAL relation between each
matter class and its determining source, and proves the function agrees for all
matter classes. Kernel checks axiom-free by exhaustive `cases` over the two
finite inductive types (no BEq, no Classical.choice).

The residual structure (ほか) is captured: in-Act matters are determined by the
Act, delegated matters by 政令 — the two classes do not overlap.

Not modelled: the actual Cabinet Order content, other articles, legal correctness.
-/

namespace JapanTaxLaw.CustomsTariffArt4_9Delegation

/-- Independent spec: delegation as a propositional matter/source relation. -/
def SpecDeterminedBy (m : Matter) (s : LegalSource) : Prop :=
  (m = Matter.inAct ∧ s = LegalSource.act) ∨
  (m = Matter.necessaryForCustomsValue ∧ s = LegalSource.cabinetOrder)

/-- The implementation agrees with the spec, for all matter classes. Axiom-free. -/
theorem agree_determined_by (m : Matter) : SpecDeterminedBy m (determinedBy m) := by
  cases m <;> simp [determinedBy, SpecDeterminedBy]

/-- Delegated matters (課税価格 computation) are determined by 政令. -/
theorem delegated_uses_cabinet_order :
    determinedBy Matter.necessaryForCustomsValue = LegalSource.cabinetOrder := rfl

/-- In-Act matters are determined by the Act, not delegated (residual ほか). -/
theorem in_act_not_delegated :
    determinedBy Matter.inAct = LegalSource.act := rfl

/-- The two determining sources are distinct. -/
theorem act_ne_cabinet_order : LegalSource.act ≠ LegalSource.cabinetOrder := by
  decide

end JapanTaxLaw.CustomsTariffArt4_9Delegation
