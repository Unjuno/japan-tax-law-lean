import JapanTaxLaw.InheritanceTaxDecisionException

/-!
# InheritanceTaxDecisionExceptionSpec — independent spec

Law id: 325AC0000000073 (相続税法), revision from INVENTORY. Article 1_2 Item 6 — EXCEPTION
「第三十三条の二の場合を除き、国税通則法第二十五条（決定）の規定による決定をいう。」. Normative unit: NORM|a272ba5227e609d49ff344bf1f6a7aee167ba66f8fba72b65dc48fca6e30bb39

The implementation uses a Bool function plus article-number constants. The spec
states the carve-out as a Prop conjunction, representationally distinct. Agreement
is axiom-free by cases/rfl.

Cross-law dependencies: 国税通則法 art. 25 and art. 33-2, resolved by name
with enforcement version (per the queue). Not modelled: substantive content of
those articles, legal correctness.
-/

namespace JapanTaxLaw.InheritanceTaxDecisionException

/-- Independent spec: the carve-out as a Prop. -/
def SpecDecision (c : CaseKind) (sa ea : Nat) : Prop :=
  (c = CaseKind.exceptedCase → False) ∧ sa = 25 ∧ ea = 33

/-- The implementation satisfies the spec. Axiom-free. -/
theorem implementation_satisfies_spec (c : CaseKind) :
    (isDecision c = true) → SpecDecision c referencedArticle exceptedArticle := by
  cases c
  · intro h
    cases h
  · intro _h
    unfold SpecDecision referencedArticle exceptedArticle
    exact And.intro (fun h => by cases h) (And.intro rfl rfl)

end JapanTaxLaw.InheritanceTaxDecisionException
