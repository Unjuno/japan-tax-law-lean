import JapanTaxLaw.DisasterTaxReliefOrderArt6PrecedingTwoReading

/-!
# DisasterTaxReliefOrderArt6PrecedingTwoReadingSpec — independent spec

Law id: 322CO0000000268 (政令), revision from INVENTORY. Article 第六条(1) — READING
「前二条の規定は、第三条の二第四項の場合について、これを準用する。」. Normative unit: NORM|d5894392c229474ffbca28c6632b178fecd3bfa7d5e949295bfb5945618024bf

The implementation has a Prop `appliesViaReading` and range constants. The
independent spec states them as one conjunction, representationally distinct.
Agreement is axiom-free by cases/rfl.

Not modelled: operative content, trigger establishment, legal correctness.
-/

namespace JapanTaxLaw.DisasterTaxReliefOrderArt6PrecedingTwoReading

/-- Independent spec: the full reading fact as a proposition. -/
def SpecReading (c : TriggerCase) (lo hi : Nat) : Prop :=
  c = TriggerCase.targetCase ∧ lo = 4 ∧ hi = 5

/-- The implementation satisfies the independent spec. Axiom-free. -/
theorem implementation_satisfies_spec :
    SpecReading TriggerCase.targetCase sourceArticleLo sourceArticleHi := by
  unfold SpecReading sourceArticleLo sourceArticleHi
  exact ⟨rfl, rfl, rfl⟩

end JapanTaxLaw.DisasterTaxReliefOrderArt6PrecedingTwoReading
