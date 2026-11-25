import JapanTaxLaw.TaxFinance

/-!
# DisasterTaxReliefOrderArt16ApplicationSubmissionDay — REFERENCE

Pinned source:
  Law id: 322CO0000000268
  Official title: 昭和二十二年政令第二百六十八号（災害被害者に対する租税の減免、徴収猶予等に関する法律の施行に関する政令）
  Law number: 昭和二十二年政令第二百六十八号
  Law type: CabinetOrder (政令)
  Raw snapshot: data/raw/322CO0000000268_*.law.json
  sha256: f6fe1c9380cd7659d682d0b6d294c920f364045905a23f624f372c419a66a21c
  Normative unit id: NORM|cbfd2fefa6e563861d9c68c577bdb9a62bb972f4231212d735d31790229829ee
  Source path: LawBody[1]/MainProvision/MainProvision[22]/Article:16/Article#16/Paragraph#1/Item#2/ItemSentence/Column#2/Sentence#1

原文逐語（pinned, 一字一句改変なし）:
  「同項に規定する申請書の提出があつた日」

Norm kind: REFERENCE — a temporal anchor: the day on which the application form
prescribed in the same paragraph was submitted (the source uses the old kana
spelling, preserved verbatim in the quote above). The computable slice models the
anchor selection: the submission day, not another reference date. All statutory
terms in the quote are byte-verbatim from the pinned source; the English prose
here is descriptive only.

Variable contract (meaning / domain / type):
  TimeAnchor : Type — submissionDay or other.
  timeAnchor : TimeAnchor — the selected anchor.
  No numeric date/unit applies (structural anchor selection); the actual date is
  caller-established.

Scope: only the anchor selection. The actual date value, the application form's
substance, and legal correctness are NOT MODELLED. Human legal review pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.DisasterTaxReliefOrderArt16ApplicationSubmissionDay

/-- The candidate temporal anchors. -/
inductive TimeAnchor : Type
  | submissionDay : TimeAnchor
  | other : TimeAnchor

/-- The anchor is the application submission day. -/
def timeAnchor : TimeAnchor := TimeAnchor.submissionDay

/-- The selected anchor is the submission day. -/
theorem anchor_is_submission_day : timeAnchor = TimeAnchor.submissionDay := rfl

/-- The other anchor is not selected. -/
theorem other_not_selected : timeAnchor ≠ TimeAnchor.other := by
  unfold timeAnchor
  intro h
  cases h

end JapanTaxLaw.DisasterTaxReliefOrderArt16ApplicationSubmissionDay
