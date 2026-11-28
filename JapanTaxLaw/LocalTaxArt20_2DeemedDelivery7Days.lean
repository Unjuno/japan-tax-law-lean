import JapanTaxLaw.TaxFinance

/-!
# LocalTaxArt20_2DeemedDelivery7Days — 地方税法 art.20の2(3) (七日経過で送達とみなす)

Pinned source:
  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Enforcement: 2026-11-01

Normative unit: NORM|94b107b492843483af55a7f2fa65c4f7eec3b29d6d814a936c21da0541e542aa
Source path: LawBody[2]/MainProvision/MainProvision[0]/Article:20_2/Article#20_2/Paragraph#3/ParagraphSentence/Sentence#1
Verbatim unit: 「前項の場合において、同項の規定による措置を開始した日から起算して七日を経過したときは、書類の送達があつたものとみなす。」

Reading (verbatim): in the preceding paragraph's case, once seven days have
elapsed from the day the measure was started, delivery of the document is
deemed to have occurred. `elapsedDays` is caller-established; boundary is
inclusive at 7.

Scope: only the seven-day deemed-delivery predicate and its boundary. The
underlying measure, the preceding paragraph's conditions, and all other
paragraphs are NOT MODELLED. One computable slice, not an article- or
law-level completion claim.
-/

namespace JapanTaxLaw.LocalTaxArt20_2DeemedDelivery7Days

/-- 「七日」. Unit: days; domain: Nat. -/
def deemedDays : Nat := 7

/-- 七日を経過したとき (inclusive at 7). -/
def isDeemedDelivered (elapsedDays : Nat) : Bool :=
  elapsedDays >= deemedDays

example : deemedDays = 7 := by decide
example : isDeemedDelivered 0 = false := by decide
example : isDeemedDelivered 6 = false := by decide
example : isDeemedDelivered 7 = true := by decide
example : isDeemedDelivered 8 = true := by decide
example : isDeemedDelivered 14 = true := by decide

end JapanTaxLaw.LocalTaxArt20_2DeemedDelivery7Days
