import JapanTaxLaw.CustomsTariffArt6RetaliatoryDelegation

/-!
# CustomsTariffArt6RetaliatoryDelegationSpec — independent spec for 関税定率法 第六条(3)

Law id: 143AC0000000054 (関税定率法, Act), revision 143AC0000000054_20260601_508AC0000000005
Article: 第六条(3) — residual delegation: matters necessary for the application of
         these provisions are prescribed by 政令; in-Act matters are not delegated.
Normative unit: NORM|1a84e6b4b4acb58de9110434621a70c324c0533ac262ff85390749f0ed48a56e

The implementation is a function `determinedBy : Matter -> LegalSource`. The
independent spec states the delegation as a PROPOSITIONAL matter/source relation
(disjunction of equalities) and proves the function agrees for all matter classes
by exhaustive `cases`. This is representationally distinct from the function form.
Kernel checks are axiom-free (no BEq, no Classical.choice). Not modelled: actual
政令 content, the preceding two paragraphs' substance, legal correctness.
-/

namespace JapanTaxLaw.CustomsTariffArt6RetaliatoryDelegation

/-- Independent spec: delegation as a propositional matter/source relation. -/
def SpecDeterminedBy (m : Matter) (s : LegalSource) : Prop :=
  (m = Matter.inAct ∧ s = LegalSource.act) ∨
  (m = Matter.necessaryForApplication ∧ s = LegalSource.cabinetOrder)

/-- Universal agreement. Axiom-free by exhaustive cases with rfl (no simp/propext). -/
theorem agree_determined_by (m : Matter) : SpecDeterminedBy m (determinedBy m) := by
  cases m
  · unfold SpecDeterminedBy determinedBy
    exact Or.inl ⟨rfl, rfl⟩
  · unfold SpecDeterminedBy determinedBy
    exact Or.inr ⟨rfl, rfl⟩

/-- Residual ほか: in-Act matters are determined by the Act. -/
theorem in_act_by_act : SpecDeterminedBy Matter.inAct LegalSource.act := by
  unfold SpecDeterminedBy
  decide
/-- Necessary application matters are delegated to 政令. -/
theorem application_by_order :
    SpecDeterminedBy Matter.necessaryForApplication LegalSource.cabinetOrder := by
  unfold SpecDeterminedBy
  decide

end JapanTaxLaw.CustomsTariffArt6RetaliatoryDelegation
