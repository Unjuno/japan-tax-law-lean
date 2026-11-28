import JapanTaxLaw.TaxFinance

/-!
# CustomsTariffArt8Reading7_8_23 — 関税定率法 art.8(28) (第七項、第八項及び第二十三項の規定は…準用する)

Pinned source:
  Law id: 143AC0000000054
  Revision: 143AC0000000054_20260601_508AC0000000005
  Enforcement: 2026-06-01

Normative unit: NORM|0eddc7c518823f0a15df18f78b861199b1187a2ecf3bf037a5045417ca0e8cbe
Source path: LawBody[1]/MainProvision/MainProvision[17]/Article:8/Article#8/Paragraph#28/ParagraphSentence/Sentence#1
Verbatim unit: 「第七項、第八項及び第二十三項の規定は、前項の調査が開始された場合について準用する。」

Reading (verbatim): the provisions of paragraph 7, paragraph 8 and paragraph 23
are incorporated (準用) only when the investigation referred to in the preceding
paragraph has been started. `paragraph` is a Nat paragraph number;
`investigationStarted` is a caller-established Bool.

Scope: only the set of incorporated paragraph numbers and the activation
condition. The substantive content of paragraphs 7, 8 and 23, the investigation
procedure, and all other paragraphs are NOT MODELLED. One computable slice, not
an article- or law-level completion claim.
-/

namespace JapanTaxLaw.CustomsTariffArt8Reading7_8_23

/-- art.8(28): 第七項・第八項・第二十三項. -/
def incorporated (paragraph : Nat) : Bool :=
  match paragraph with
  | 7 => true
  | 8 => true
  | 23 => true
  | _ => false

/-- 準用 applies only after 前項の調査が開始された場合. -/
def applies (investigationStarted : Bool) (paragraph : Nat) : Bool :=
  investigationStarted && incorporated paragraph

example : incorporated 7 = true := by decide
example : incorporated 8 = true := by decide
example : incorporated 23 = true := by decide
example : incorporated 6 = false := by decide
example : incorporated 9 = false := by decide
example : incorporated 22 = false := by decide
example : incorporated 24 = false := by decide
example : applies false 7 = false := by decide
example : applies true 7 = true := by decide
example : applies true 23 = true := by decide
example : applies true 9 = false := by decide

end JapanTaxLaw.CustomsTariffArt8Reading7_8_23
