import JapanTaxLaw.LocalTaxOfficeApportionment

/-!
# LocalTaxOfficeApportionmentSpec — 地方税法施行令 第五十六条の五十 の独立定式

Sources (pinned; identical to LocalTaxOfficeApportionment.lean):

  Law id: 325CO0000000245
  Revision: 325CO0000000245_20261101_508CO0000000083
  Amendment enforcement date: 2026-11-01

Independent restatements of the modelled computations:

  * 按分共通
      impl: `apportion base numerator denominator = base * numerator / denominator`
      spec: `specApportion base numerator denominator = (numerator * base) / denominator`
    — 被乗数の順序を入れ替えた独立整数定式。
  * 指定都市等所在部分の割合ペア
      impl: `designatedCityAreaRatio designatedCityArea totalArea = (designatedCityArea, totalArea)`
      spec: `specDesignatedCityAreaRatio designatedCityArea totalArea = (designatedCityArea, totalArea)`
  * 事業所床面積の読み替え（同一値）
      impl: `designatedCityFloorArea designatedCityArea = designatedCityArea`
      spec: `specDesignatedCityFloorArea designatedCityArea = designatedCityArea`
  * 従業者給与総額の按分
      impl: `apportionedEmployeeSalary totalSalary designatedCityArea totalArea =
               apportion totalSalary designatedCityArea totalArea`
      spec: `specApportionedEmployeeSalary totalSalary designatedCityArea totalArea =
               (designatedCityArea * totalSalary) / totalArea`

各 `agree*` は有限サンプル上の `==` 一致確認であり、法的意味の等価証明ではない。
分母零は Nat 除算の定義で 0 を返す点もサンプルに含める。

Scope boundaries identical to the implementation. 事業所床面積・指定都市等所在部分の事業所床面積・
従業者給与総額の認定、区域判定・該当性、法第七百一条の四十への読み替えて適用する手続は
すべて caller-established で NOT MODELLED（impl の doc-comment 参照）。
丸めは切り捨て（Nat 除算）。

-/

namespace JapanTaxLaw.LocalTaxOfficeApportionment

open JapanTaxLaw.TaxFinance

-- ==== independent formulas ====

/-- Spec: 按分共通（被乗数を入れ替えた独立整数定式）。 -/
def specApportion (base numerator denominator : Money) : Money :=
  (numerator * base) / denominator

/-- Spec: 指定都市等所在部分の割合ペア（独立定式）。 -/
def specDesignatedCityAreaRatio (designatedCityArea totalArea : Money) : Money × Money :=
  (designatedCityArea, totalArea)

/-- Spec: 事業所床面積の読み替え（独立定式、同一値）。 -/
def specDesignatedCityFloorArea (designatedCityArea : Money) : Money :=
  designatedCityArea

/-- Spec: 従業者給与総額の按分（独立整数定式）。 -/
def specApportionedEmployeeSalary
    (totalSalary designatedCityArea totalArea : Money) : Money :=
  (designatedCityArea * totalSalary) / totalArea

-- ==== points (kernel-decided) ====

example : specApportion 100 100 100 = 100 := by decide
example : specApportion 10 7 3 = 23 := by decide
example : specApportion 10 7 0 = 0 := by decide
example : specApportion 1_000_000 250_000 1_000_000 = 250_000 := by decide

example : specDesignatedCityAreaRatio 3_000 10_000 = (3_000, 10_000) := by decide
example : specDesignatedCityFloorArea 3_000 = 3_000 := by decide

example : specApportionedEmployeeSalary 10_000_000 3_000 10_000 = 3_000_000 := by decide
example : specApportionedEmployeeSalary 10_000_000 1 3 = 3_333_333 := by decide
example : specApportionedEmployeeSalary 10_000_000 10_000 10_000 = 10_000_000 := by decide
example : specApportionedEmployeeSalary 10_000_000 0 10_000 = 0 := by decide
example : specApportionedEmployeeSalary 5 3 0 = 0 := by decide

-- ==== agreement checks between implementation and Spec ====

/-- 按分共通: impl ≡ spec（有限サンプル上の `==` 一致、分母零・端数切り捨てを含む）。 -/
def agreeApportion : Bool :=
  [ (0, 0, 0), (10, 7, 0), (10, 0, 3), (10, 7, 3), (100, 100, 100),
    (1_000_000, 250_000, 1_000_000), (10_000_000, 1, 3),
    (5_000_000, 2_500_000, 9_000_000) ].all fun (b, n, d) =>
      apportion b n d == specApportion b n d

/-- 割合ペア: impl ≡ spec（有限サンプル上の `==` 一致）。 -/
def agreeDesignatedCityAreaRatio : Bool :=
  [ (0, 0), (0, 10_000), (3_000, 10_000), (10_000, 10_000), (999, 1_000) ].all
    fun (a, t) => designatedCityAreaRatio a t == specDesignatedCityAreaRatio a t

/-- 床面積の読み替え: impl ≡ spec（有限サンプル上の `==` 一致）。 -/
def agreeDesignatedCityFloorArea : Bool :=
  [0, 1, 3_000, 10_000, 999_999].all fun a =>
    designatedCityFloorArea a == specDesignatedCityFloorArea a

/-- 従業者給与総額の按分: impl ≡ spec（有限サンプル上の `==` 一致）。 -/
def agreeApportionedEmployeeSalary : Bool :=
  [ (0, 0, 0), (5, 3, 0), (10_000_000, 0, 10_000), (10_000_000, 1, 3),
    (10_000_000, 3_000, 10_000), (10_000_000, 2_500, 10_000),
    (10_000_000, 10_000, 10_000), (123_456, 7, 9) ].all fun (s, a, t) =>
      apportionedEmployeeSalary s a t == specApportionedEmployeeSalary s a t

example : agreeApportion = true := by decide
example : agreeDesignatedCityAreaRatio = true := by decide
example : agreeDesignatedCityFloorArea = true := by decide
example : agreeApportionedEmployeeSalary = true := by decide

end JapanTaxLaw.LocalTaxOfficeApportionment
