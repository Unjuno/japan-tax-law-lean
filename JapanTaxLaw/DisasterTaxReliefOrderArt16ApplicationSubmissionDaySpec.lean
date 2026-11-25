import JapanTaxLaw.DisasterTaxReliefOrderArt16ApplicationSubmissionDay

/-!
# DisasterTaxReliefOrderArt16ApplicationSubmissionDaySpec — independent spec

Law id: 322CO0000000268 (災害被害者租税減免法施行政令), revision from INVENTORY.
Article 16(1) item2 REFERENCE 「同項に規定する申請書の提出があつた日」.
Normative unit: NORM|cbfd2fefa6e563861d9c68c577bdb9a62bb972f4231212d735d31790229829ee

The implementation is an inductive value; the spec states the anchor as a Prop
equality, representationally distinct. Axiom-free by rfl/cases.

Not modelled: actual date value, application substance, legal correctness.
-/

namespace JapanTaxLaw.DisasterTaxReliefOrderArt16ApplicationSubmissionDay

/-- Independent spec: the selected anchor is the submission day. -/
def SpecTimeAnchor (a : TimeAnchor) : Prop :=
  a = TimeAnchor.submissionDay

/-- The implementation satisfies the spec. -/
theorem implementation_satisfies_spec : SpecTimeAnchor timeAnchor := rfl

/-- The other anchor does not satisfy the spec. -/
theorem other_not_satisfying : ¬ SpecTimeAnchor TimeAnchor.other := by
  intro h
  cases h

end JapanTaxLaw.DisasterTaxReliefOrderArt16ApplicationSubmissionDay
