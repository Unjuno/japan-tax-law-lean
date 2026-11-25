import JapanTaxLaw.TaxFinance

/-!
# CohabitantSpecialDisabilityDeduction — 同居特別障害者控除（地方税法 art.37 §1）bounded L4 モデル

Sources (pinned):
  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Raw snapshot: data/raw/data/raw/325AC0000000226_20261101_508AC0000000002.law.json
  Article Num 37 §1, flat/normalized leaf text 1746 chars. Needles contain no U+3000.

原文逐語:
  「当該同居特別障害者一人につき二十二万円」

Computation（原文逐語から導出、定額控除額のみ、単位: 円）:
  deduction(count) = 220000 * count（一人につき 22 万円）

Scope / NOT MODELLED:
  - 「同居特別障害者」の定義・認定・他の障害者区分（特別障害者10万円、障害者1万円）は NOT MODELLED。
  - 合計課税所得金額による制限・他の所得控除との通算は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.CohabitantSpecialDisabilityDeduction

open JapanTaxLaw.TaxFinance

/-- 同居特別障害者 1 人につき 22 万円の控除。 -/
def deduction (count : Nat) : Money := 220000 * count

example : deduction 0 = 0 := by decide
example : deduction 1 = 220000 := by decide
example : deduction 2 = 440000 := by decide

end JapanTaxLaw.CohabitantSpecialDisabilityDeduction
