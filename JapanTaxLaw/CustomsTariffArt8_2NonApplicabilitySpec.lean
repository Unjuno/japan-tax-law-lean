import JapanTaxLaw.CustomsTariffArt8_2NonApplicability

/-!
# CustomsTariffArt8_2NonApplicabilitySpec — independent spec for 関税定率法 第八条の二(2)

Law id: 143AC0000000054 (関税定率法, Act), revision 143AC0000000054_20260601_508AC0000000005
Article: 第八条の二(2) — CONDITION 「前項の規定は、次の各号のいずれかに該当する場合には、適用しない。」:
         the preceding paragraph does not apply when a case falls under any enumerated item.
Normative unit: NORM|3f6a79aacce7c6e225e32f8ee0c3a4f20ff56056b93d87ac347341b2ceee1ede

The implementation is `precedingParagraphApplies : Case -> Bool` (false on the
two enumerated items, true on the catch-all). The independent spec states the
same non-applicability as a propositional disjunction `c = item1 ∨ c = item2`
("listed case"), representationally distinct from the Bool function. They agree
for all three constructors: `¬ precedingParagraphApplies c = true ↔ ListedCase c`.
Axiom-free by exhaustive cases with rfl/cases — no `decide`/`simp`/`propext`.

Not modelled: item substance, the preceding paragraph, legal correctness.
-/

namespace JapanTaxLaw.CustomsTariffArt8_2NonApplicability

/-- Independent spec: the case is one of the enumerated items. -/
def SpecListedCase (c : Case) : Prop :=
  c = Case.item1 ∨ c = Case.item2

/-- Universal agreement (axiom-free): non-application iff the case is listed. -/
theorem agree_non_applicability (c : Case) :
    (precedingParagraphApplies c = false) ↔ SpecListedCase c := by
  cases c
  · constructor
    · intro _h
      left
      rfl
    · intro _h
      rfl
  · constructor
    · intro _h
      right
      rfl
    · intro _h
      rfl
  · constructor
    · intro h
      cases h
    · intro h
      cases h with
      | inl h1 => cases h1
      | inr h2 => cases h2

end JapanTaxLaw.CustomsTariffArt8_2NonApplicability
