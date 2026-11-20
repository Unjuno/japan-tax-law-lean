import JapanTaxLaw.TaxFinance

/-!
# RemittanceReportLimit — 国外送金等調書の提出を要しない上限額 bounded L4 モデル

Sources (pinned):
  Law id: 409CO0000000363
  Revision: 409CO0000000363_20250501_507CO0000000128
  Raw snapshot: data/raw/data/raw/409CO0000000363_20250501_507CO0000000128.law.json
  Article Num 8, flat/normalized leaf text 140 chars, U+3000 count 0.

原文逐語:
  「法第四条第一項に規定する政令で定める金額は、百万円とする。」

Computation（原文逐語から導出、金額定数のみ）:
  limitYen = 1,000,000（百万円）
  isAtOrBelowLimit(amount) = amount <= 1,000,000

Scope / NOT MODELLED:
  - §2 外国通貨の換算（財務省令で定める為替相場）は NOT MODELLED。
  - 国外送金等の定義、調書提出手続、法4条1項の他の要件は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.RemittanceReportLimit

open JapanTaxLaw.TaxFinance

/-- 提出を要しない上限額 = 百万円。 -/
def limitYen : Money := 1_000_000

/-- 上限額以下か（境界: 1,000,000 は含む）。 -/
def isAtOrBelowLimit (amount : Money) : Bool :=
  amount <= limitYen

example : limitYen = 1_000_000 := by decide
example : isAtOrBelowLimit 0 = true := by decide
example : isAtOrBelowLimit 999_999 = true := by decide
example : isAtOrBelowLimit 1_000_000 = true := by decide
example : isAtOrBelowLimit 1_000_001 = false := by decide

end JapanTaxLaw.RemittanceReportLimit
