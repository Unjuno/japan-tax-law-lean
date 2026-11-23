import JapanTaxLaw.TaxFinance

/-!
# RealPropertyAcquisitionTaxRate — 不動産取得税の標準税率（地方税法 art.73の15）bounded L4 モデル

Sources (pinned):
  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Raw snapshot: data/raw/325AC0000000226_20261101_508AC0000000002.law.json
  Article Num 73_15, flat/normalized leaf text 40 chars, U+3000 count 0.

原文逐語:
  「不動産取得税の標準税率は、百分の四とする。」

Computation（原文逐語から導出、税率定数のみ）:
  standardRatePercent = 4（百分の四 = 4%）
  taxYen(base) = base * 4 / 100

Scope / NOT MODELLED:
  - 「標準税率」と実際の税率（条例で別税率の場合）の関係は NOT MODELLED。
  - 不動産取得税の課税標準・申告納付手続は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.RealPropertyAcquisitionTaxRate

open JapanTaxLaw.TaxFinance

/-- 標準税率 = 4%（百分の四）。 -/
def standardRatePercent : Nat := 4

/-- 税額 = 課税標準 × 4 / 100。 -/
def taxYen (base : Money) : Money := base * standardRatePercent / 100

example : standardRatePercent = 4 := by decide
example : taxYen 0 = 0 := by decide
example : taxYen 1000 = 40 := by decide
example : taxYen 10000 = 400 := by decide

end JapanTaxLaw.RealPropertyAcquisitionTaxRate
