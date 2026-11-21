import JapanTaxLaw.TaxFinance

/-!
# OilGasGrantTax — 石油ガス譲与税法 art.1（譲与額 = 収入額の1/2）bounded L4 モデル

Sources (pinned):
  Law id: 340AC0000000157
  Revision: 340AC0000000157_20090401_421AC0000000009
  Raw snapshot: data/raw/data/raw/340AC0000000157_20090401_421AC0000000009.law.json
  Article Num 1, flat/normalized leaf text 136 chars, U+3000 count 0.

原文逐語:
  「石油ガス譲与税は、石油ガス税法…の規定による石油ガス税の収入額の二分の一に
   相当する額とし、都道府県及び…指定市に対して譲与するものとする。」

Computation（原文逐語から導出、割合スライスのみ）:
  grantYen(revenue) = revenue / 2（二分の一）

Scope / NOT MODELLED:
  - 収入額が奇数の場合の端数処理は本条文に明示なし → 未形式化、人間レビュー保留。
    実装は自然数除算（切捨て）を仮定するが法的確定ではない。
  - 指定市の認定、譲与の手続、石油ガス税法の収入額算定は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.OilGasGrantTax

open JapanTaxLaw.TaxFinance

/-- 石油ガス譲与税額 = 石油ガス税収入額の二分の一。 -/
def grantYen (revenue : Money) : Money :=
  revenue / 2

example : grantYen 0 = 0 := by decide
example : grantYen 1 = 0 := by decide
example : grantYen 100 = 50 := by decide
example : grantYen 1_000_000 = 500_000 := by decide

end JapanTaxLaw.OilGasGrantTax
