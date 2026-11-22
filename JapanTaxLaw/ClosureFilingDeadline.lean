import JapanTaxLaw.TaxFinance

/-!
# ClosureFilingDeadline — 業務廃止の届出期限（省令 art.3）bounded L4 モデル

Sources (pinned):
  Law id: 346M50000040057
  Revision: 346M50000040057_20120401_424M60000040035
  Raw snapshot: data/raw/346M50000040057_20120401_424M60000040035.law.json
  Article Num 3, flat/normalized leaf text 83 chars, U+3000 count 0.

原文逐語:
  「法第十条第七項の規定による届出は、業務を廃止しようとする日の一月以前に、
   業務の廃止の年月日及び理由を記載した書面でしなければならない。」

Computation（原文逐語から導出、期限のみ）:
  期限 = 廃止日の「一月以前」（廃止日の 1 か月前まで）
  daysBeforeClosure >= 30 で間に合うものとして表現（月の長さは NOT MODELLED、簡易形）
    meetsDeadline(daysBefore) = daysBefore >= 30

Scope / NOT MODELLED:
  - 法10条7項の届出の詳細・書面の記載事項は NOT MODELLED。
  - 「一月」の暦月計算（28/29/30/31 日の差）は NOT MODELLED（30 日で近似）。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.ClosureFilingDeadline

open JapanTaxLaw.TaxFinance

/-- 期限日数 = 30 日（一月の簡易表現）。 -/
def noticeDays : Nat := 30

/-- 廃止日まで残り daysBefore 日で届出が間に合うか。 -/
def meetsDeadline (daysBefore : Nat) : Bool :=
  daysBefore >= noticeDays

example : noticeDays = 30 := by decide
example : meetsDeadline 29 = false := by decide
example : meetsDeadline 30 = true := by decide
example : meetsDeadline 31 = true := by decide

end JapanTaxLaw.ClosureFilingDeadline
