import JapanTaxLaw.DisasterTaxReliefOrderArt16ApplicationSubmissionDaySpec

/-!
# DisasterTaxReliefOrderArt16ApplicationSubmissionDayTests — kernel-checked checks

Verifies REFERENCE 「同項に規定する申請書の提出があつた日」: submission-day anchor selected; other not.
-/

namespace JapanTaxLaw.DisasterTaxReliefOrderArt16ApplicationSubmissionDay

example : timeAnchor = TimeAnchor.submissionDay := anchor_is_submission_day
example : timeAnchor ≠ TimeAnchor.other := other_not_selected
example : SpecTimeAnchor timeAnchor := implementation_satisfies_spec
example : ¬ SpecTimeAnchor TimeAnchor.other := other_not_satisfying

end JapanTaxLaw.DisasterTaxReliefOrderArt16ApplicationSubmissionDay
