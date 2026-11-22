import JapanTaxLaw.TaxFinance

/-!
# TaxNoticeDeadline — 自動車税等の納税通知書の交付期限（法律 art.4 §2）bounded L4 モデル

Sources (pinned):
  Law id: 327AC0000000119
  Revision: 327AC0000000119_20260401_508AC0000000002
  Raw snapshot: data/raw/327AC0000000119_20260401_508AC0000000002.law.json
  Article Num 4, flat/normalized leaf text 1167 chars, U+3000 count 0.

原文逐語（§2）:
  「…納税通知書は、遅くとも、その納期限前十日までに納税者に交付しなければならない。」

Computation（原文逐語から導出、期限日数のみ）:
  noticeLeadDays = 10（納期限の 10 日前まで）
  meetsNoticeDeadline(daysBeforeDue) = daysBeforeDue >= 10

Scope / NOT MODELLED:
  - 地方団体の条例による普通徴収/証紙徴収の選択は NOT MODELLED。
  - 納期限の算出・日付算術・納税者の認定は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.TaxNoticeDeadline

open JapanTaxLaw.TaxFinance

/-- 通知の最低提前日数 = 10 日。 -/
def noticeLeadDays : Nat := 10

/-- 納期限まで残り daysBeforeDue 日で通知が間に合うか。 -/
def meetsNoticeDeadline (daysBeforeDue : Nat) : Bool :=
  daysBeforeDue >= noticeLeadDays

example : noticeLeadDays = 10 := by decide
example : meetsNoticeDeadline 9 = false := by decide
example : meetsNoticeDeadline 10 = true := by decide
example : meetsNoticeDeadline 11 = true := by decide

end JapanTaxLaw.TaxNoticeDeadline
