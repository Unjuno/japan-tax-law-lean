import JapanTaxLaw.TaxFinance

/-!
# PaymentDeadline — 国税納付期限（省令 art.18）bounded L4 モデル

Sources (pinned):
  Law id: 329M50000040039
  Revision: 329M50000040039_20260924_508M60000040059
  Raw snapshot: data/raw/329M50000040039_20260924_508M60000040059.law.json
  Article Num 18, flat/normalized leaf text 89 chars, U+3000 count 0.

原文逐語:
  「…国税等の納付期限を指定する場合には、法令その他の定がある場合を除く外、
   調査決定の日から二十日以内において適宜の納付期限を定めるものとする。」

Computation（原文逐語から導出、日数上限のみ）:
  maxDaysAfterDecision = 20（二十日以内）
  isWithinDeadline(days) = days <= 20

Scope / NOT MODELLED:
  - 「法令その他の定がある場合」の例外は NOT MODELLED。
  - 実際の納付期限の指定・日付算術・「適宜」の裁量は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.PaymentDeadline

open JapanTaxLaw.TaxFinance

/-- 調査決定の日からの上限日数 = 20 日。 -/
def maxDaysAfterDecision : Nat := 20

/-- 期限内か（境界: 20 日は含む）。 -/
def isWithinDeadline (days : Nat) : Bool := days <= maxDaysAfterDecision

example : maxDaysAfterDecision = 20 := by decide
example : isWithinDeadline 0 = true := by decide
example : isWithinDeadline 20 = true := by decide
example : isWithinDeadline 21 = false := by decide

end JapanTaxLaw.PaymentDeadline
