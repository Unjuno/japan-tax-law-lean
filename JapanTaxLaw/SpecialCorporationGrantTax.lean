import JapanTaxLaw.TaxFinance

/-!
# SpecialCorporationGrantTax — 地方税法 art.29（特別法人事業譲与税）bounded L4 モデル

Sources (pinned):
  Law id: 431AC0000000004
  Revision: 431AC0000000004_20260401_508AC0000000002
  Raw snapshot: data/raw/431AC0000000004_20260401_508AC0000000002.law.json
  Article Num 29, flat/normalized leaf text 65 chars, U+3000 count 0.

原文逐語:
  「特別法人事業譲与税は、特別法人事業税の収入額に相当する額とし、都道府県に対して
   譲与するものとする。」

Computation（原文逐語から導出、対応関係スライスのみ）:
  grantYen(revenue) = revenue（「収入額に相当する額」= 同一額、定数関数ではない）

Scope / NOT MODELLED:
  - 特別法人事業税の収入額の算定、都道府県への配分・譲与手続は NOT MODELLED。
  - 本スライスは「譲与額 = 収入額」の対応関係のみを扱う。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.SpecialCorporationGrantTax

open JapanTaxLaw.TaxFinance

/-- 特別法人事業譲与税額 = 特別法人事業税の収入額（同一額）。 -/
def grantYen (revenue : Money) : Money :=
  revenue

example : grantYen 0 = 0 := by decide
example : grantYen 1 = 1 := by decide
example : grantYen 1_000_000 = 1_000_000 := by decide

end JapanTaxLaw.SpecialCorporationGrantTax
