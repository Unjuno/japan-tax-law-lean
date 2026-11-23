import JapanTaxLaw.DisasterTaxReliefArt3ArticleRangeReading

/-!
# DisasterTaxReliefArt3ArticleRangeReadingSpec — independent spec

Law id: 322AC0000000175, revision from INVENTORY. Article 第三条(1) — READING 「この場合においては、同法第百十二条から第百十四条までの規定を準用する。」.
Normative unit: NORM|cc418cedeeb1fc09da3ff8faf6c482785b2381b98026b29f92bbfb80f53e3cf1

The implementation has a Prop `appliesViaReading` and two range constants. The
independent spec states them as one conjunction, representationally distinct.
Agreement is axiom-free by cases/rfl.

Not modelled: operative content of Articles 112..114, trigger establishment,
legal correctness.
-/

namespace JapanTaxLaw.DisasterTaxReliefArt3ArticleRangeReading

/-- Independent spec: the full reading fact as a proposition. -/
def SpecReading (c : TriggerCase) (lo hi : Nat) : Prop :=
  c = TriggerCase.thisCase ∧ lo = 112 ∧ hi = 114

/-- The implementation satisfies the independent spec. Axiom-free. -/
theorem implementation_satisfies_spec :
    SpecReading (TriggerCase.thisCase) sourceArticleLo sourceArticleHi := by
  unfold SpecReading sourceArticleLo sourceArticleHi
  exact ⟨rfl, rfl, rfl⟩

end JapanTaxLaw.DisasterTaxReliefArt3ArticleRangeReading
