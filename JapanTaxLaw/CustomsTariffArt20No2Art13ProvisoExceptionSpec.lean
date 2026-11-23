import JapanTaxLaw.CustomsTariffArt20No2Art13ProvisoException

/-!
# CustomsTariffArt20No2Art13ProvisoExceptionSpec — independent spec 関税定率法 第二十条の二(3)

Law id: 143AC0000000054 (関税定率法, Act), revision 143AC0000000054_20260601_508AC0000000005
Article: 第二十条の二(3) — EXCEPTION 「この場合においては、第十三条第七項ただし書の規定を準用する。」: 第十三条第七項ただし書 read in for この場合.
Normative unit: NORM|04057a73ecf3e5e7f56460b7b280eee517956be5c9b69d8d845cfed58189c76f

The implementation is a Bool function `withinException : Trigger -> Bool`. The
independent spec states the same scope as a PROPOSITIONAL predicate
`SpecWithinException : Trigger -> Prop`, representationally distinct. Universal
agreement is proved by exhaustive cases with rfl/cases — no decide/simp/propext.

Not modelled: substantive content of 第十三条第七項ただし書 and この場合, other articles,
legal correctness.
-/

namespace JapanTaxLaw.CustomsTariffArt20No2Art13ProvisoException

/-- Independent spec: the exception scope as a propositional predicate. -/
def SpecWithinException (tr : Trigger) : Prop :=
  tr = Trigger.thisCase

/-- The Bool implementation agrees with the propositional spec. Axiom-free. -/
theorem agree_within_exception (tr : Trigger) :
    (withinException tr = true) ↔ SpecWithinException tr := by
  cases tr
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

end JapanTaxLaw.CustomsTariffArt20No2Art13ProvisoException
