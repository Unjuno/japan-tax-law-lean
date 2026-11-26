import JapanTaxLaw.TaxFinance

/-!
# CohabitElderlyDependentDeduction — 同居直系尊属の老人扶養親族控除（地方税法 art.37 §1）bounded L4 モデル

Sources (pinned):
  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Raw snapshot: data/raw/data/raw/325AC0000000226_20261101_508AC0000000002.law.json
  Article Num 37 §1, flat/normalized leaf text 1746 chars. Needles contain no U+3000.

原文逐語:
  「（９）同居直系尊属である老人扶養親族を有する所得割の納税義務者
    当該老人扶養親族一人につき十三万円」

Computation（原文逐語から導出、定額控除額のみ、単位: 円）:
  deduction(count) = 130000 * count（一人につき 13 万円）

Scope / NOT MODELLED:
  - 「同居直系尊属」「老人扶養親族」の定義・認定・他の扶養親族区分（一般5万/特定18万/老人10万）は NOT MODELLED。
  - 合計課税所得金額による制限・他の所得控除との通算は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.CohabitElderlyDependentDeduction

open JapanTaxLaw.TaxFinance

/-- 同居直系尊属の老人扶養親族 1 人につき 13 万円の控除。 -/
def deduction (count : Nat) : Money := 130000 * count

example : deduction 0 = 0 := by decide
example : deduction 1 = 130000 := by decide
example : deduction 2 = 260000 := by decide

end JapanTaxLaw.CohabitElderlyDependentDeduction
