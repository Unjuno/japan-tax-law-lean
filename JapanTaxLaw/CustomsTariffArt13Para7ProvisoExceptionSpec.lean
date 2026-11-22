import JapanTaxLaw.CustomsTariffArt13Para7ProvisoException

/-!
# CustomsTariffArt13Para7ProvisoExceptionSpec — independent spec 関税定率法 第十七条(5)

Law id: 143AC0000000054 (関税定率法, Act), revision 143AC0000000054_20260601_508AC0000000005
Article: 第十七条(5) — EXCEPTION 「第十三条第七項ただし書の規定は、前項の規定により関税を徴収する場合について準用する。」: the 第十三条第七項ただし書 is read
         in for the preceding-paragraph duty-collection case.
Normative unit: NORM|13bac8bcfa07d6e3fcf0861aea41480df8ba7093311535bdf2e8e81a95a78304

The implementation is a Bool function `withinException : CollectionCase -> Bool`.
The independent spec states the same scope as a PROPOSITIONAL predicate
`SpecWithinException : CollectionCase -> Prop`, representationally distinct from
the Bool function. Agreement is proved by exhaustive cases with rfl/cases —
no `decide`, no `simp`, no `propext`, no `Classical.choice`.

Not modelled: substantive content of 第十三条第七項ただし書 and 前項, how duty is
collected, other articles, legal correctness.
-/

namespace JapanTaxLaw.CustomsTariffArt13Para7ProvisoException

/-- Independent spec: the exception scope as a propositional predicate. -/
def SpecWithinException (c : CollectionCase) : Prop :=
  c = CollectionCase.prevParaCollection

/-- The Bool implementation agrees with the propositional spec. Axiom-free
    by exhaustive cases with rfl/cases. -/
theorem agree_within_exception (c : CollectionCase) :
    (withinException c = true) ↔ SpecWithinException c := by
  cases c
  · constructor
    · intro _h
      rfl
    · intro _h
      rfl
  · constructor
    · intro h
      cases h
    · intro h
      cases h

end JapanTaxLaw.CustomsTariffArt13Para7ProvisoException
