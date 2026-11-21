import JapanTaxLaw.TaxFinance

/-!
# PowerDevelopmentTaxRate — 電源開発促進税の税率（art.6）bounded L4 モデル

Sources (pinned):
  Law id: 349AC0000000079
  Revision: 349AC0000000079_20250601_504AC0000000068
  Raw snapshot: data/raw/349AC0000000079_20250601_504AC0000000068.law.json
  Article Num 6, flat/normalized leaf text 44 chars, U+3000 count 0.

原文逐語:
  「電源開発促進税の税率は、販売電気千キロワット時につき、三百七十五円とする。」

Computation（原文逐語から導出、税率定数のみ）:
  ratePerThousandKWh = 375（三百七十五円 / 千キロワット時）
  taxYen(thousandKWh) = 375 * thousandKWh

Scope / NOT MODELLED:
  - 販売電気の定義、課税標準、申告・納付手続は NOT MODELLED。
  - 本スライスは税率定数のみを扱う。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.PowerDevelopmentTaxRate

open JapanTaxLaw.TaxFinance

/-- 税率 = 375 円/千kWh。 -/
def ratePerThousandKWh : Money := 375

/-- 税額 = 375 × 千キロワット時数。 -/
def taxYen (thousandKWh : Nat) : Money := ratePerThousandKWh * thousandKWh

example : ratePerThousandKWh = 375 := by decide
example : taxYen 0 = 0 := by decide
example : taxYen 1 = 375 := by decide
example : taxYen 100 = 37_500 := by decide

end JapanTaxLaw.PowerDevelopmentTaxRate
