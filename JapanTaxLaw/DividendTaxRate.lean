import JapanTaxLaw.TaxFinance

/-!
# DividendTaxRate — 配当割の税率（地方税法 art.71の28）bounded L4 モデル

Sources (pinned):
  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Raw snapshot: data/raw/325AC0000000226_20261101_508AC0000000002.law.json
  Article Num 71_28, flat/normalized leaf text 33 chars, U+3000 count 0.

原文逐語:
  「配当割の税率は、百分の五とする。」

Computation（原文逐語から導出、税率定数のみ）:
  ratePerHundred = 5（百分の五 = 5%）
  taxYen(base) = base * 5 / 100

Scope / NOT MODELLED:
  - 配当割の課税標準・申告納付手続は NOT MODELLED。
  - 本スライスは税率定数のみを扱う。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.DividendTaxRate

open JapanTaxLaw.TaxFinance

/-- 税率 = 5%（百分の五）。 -/
def ratePercent : Nat := 5

/-- 税額 = 課税標準 × 5 / 100。 -/
def taxYen (base : Money) : Money := base * ratePercent / 100

example : ratePercent = 5 := by decide
example : taxYen 0 = 0 := by decide
example : taxYen 1000 = 50 := by decide
example : taxYen 10000 = 500 := by decide

end JapanTaxLaw.DividendTaxRate
