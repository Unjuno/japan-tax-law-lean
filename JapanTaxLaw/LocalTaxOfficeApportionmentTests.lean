import JapanTaxLaw.LocalTaxOfficeApportionment

/-!
# LocalTaxOfficeApportionmentTests — 地方税法施行令 第五十六条の五十 の smoke checks

Decidable kernel-decided smoke tests, pinned to

  Law id: 325CO0000000245
  Revision: 325CO0000000245_20261101_508CO0000000083
  Amendment enforcement date: 2026-11-01

按分共通・指定都市等所在部分の割合ペア・事業所床面積の読み替え・従業者給与総額の按分の
算定式と境界（分母零、按分 1:1、端数切り捨て）を確認する。

NOT MODELLED: 事業所床面積・指定都市等所在部分の事業所床面積・従業者給与総額の認定、
区域判定・該当性、法第七百一条の四十第一項及び第二項への読み替えて適用する手続
（すべて caller-established、impl の doc-comment 参照）。

-/

namespace JapanTaxLaw.LocalTaxOfficeApportionment

open JapanTaxLaw.TaxFinance

-- ==== apportion ====
-- 分母零 → 0（安全版）
example : apportion 10 3 0 = 0 := by decide
example : apportion 0 0 0 = 0 := by decide
-- 按分 1:1
example : apportion 100 100 100 = 100 := by decide
example : apportion 1_000_000 1_000_000 1_000_000 = 1_000_000 := by decide
-- 端数切り捨て
example : apportion 10 7 3 = 23 := by decide
example : apportion 1_000_000 1 3 = 333_333 := by decide
example : apportion 1_000_000 2 3 = 666_666 := by decide
-- 分子零
example : apportion 100 0 100 = 0 := by decide

-- ==== designatedCityAreaRatio / designatedCityFloorArea ====
example : designatedCityAreaRatio 3_000 10_000 = (3_000, 10_000) := by decide
example : designatedCityAreaRatio 0 0 = (0, 0) := by decide
example : designatedCityFloorArea 3_000 = 3_000 := by decide
example : designatedCityFloorArea 0 = 0 := by decide

-- ==== apportionedEmployeeSalary ====
example : designatedCityAreaRatio 3_000 10_000 = (3_000, 10_000) := by decide
-- 按分: 総給与額 × (指定都市等所在部分床面積 / 全事業所床面積)
example : apportionedEmployeeSalary 10_000_000 3_000 10_000 = 3_000_000 := by decide
example : apportionedEmployeeSalary 10_000_000 2_500 10_000 = 2_500_000 := by decide
example : apportionedEmployeeSalary 100_000 3_000 10_000 = 30_000 := by decide
-- 按分 1:1 → 総給与額
example : apportionedEmployeeSalary 10_000_000 10_000 10_000 = 10_000_000 := by decide
-- 指定都市等所在部分 0 → 0
example : apportionedEmployeeSalary 10_000_000 0 10_000 = 0 := by decide
-- 全事業所床面積 0 → 0
example : apportionedEmployeeSalary 5 3 0 = 0 := by decide
-- 端数切り捨て
example : apportionedEmployeeSalary 10_000_000 1 3 = 3_333_333 := by decide
example : apportionedEmployeeSalary 123_456 7 9 = 96_021 := by decide

end JapanTaxLaw.LocalTaxOfficeApportionment
