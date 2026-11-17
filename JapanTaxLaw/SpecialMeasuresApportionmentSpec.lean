import JapanTaxLaw.SpecialMeasuresApportionment

/-!
# SpecialMeasuresApportionmentSpec — 租税特別措置法施行令 第二十五条の十八 / 第四十条の五の二 の独立定式

Sources (pinned; identical to SpecialMeasuresApportionment.lean):

  Law id: 332CO0000000043
  Revision: 332CO0000000043_20261101_507CO0000000127
  Amendment enforcement date: 2026-11-01

Independent restatements of the three modelled computations:

  * 按分共通
      impl: `apportion base numerator denominator = base * numerator / denominator`
      spec: `specApportion base numerator denominator = (numerator * base) / denominator`
    — 被乗数の順序を入れ替えた独立整数定式。
  * art. 25の18
      impl: `nonTaxablePortion propertyValue prescribedAmount =
               apportion propertyValue prescribedAmount propertyValue`
      spec: `specNonTaxablePortion propertyValue prescribedAmount =
               (prescribedAmount * propertyValue) / propertyValue`
  * art. 40の5の2
      impl: `perDonorDeduction taxablePrice total =
               apportion specifiedGiftBasicDeduction taxablePrice total`
      spec: `specPerDonorDeduction taxablePrice total = (taxablePrice * 1_100_000) / total`

各 `agree*` は有限サンプル上の `==` 一致確認であり、法的意味の等価証明ではない。
分母零は Nat 除算の定義で 0 を返す点もサンプルに含める。

Scope boundaries identical to the implementation. 金額の認定・給与者/贈与者の該当性・
その他の政令要件はすべて caller-established で NOT MODELLED（impl の doc-comment 参照）。
丸めは切り捨て（Nat 除算）。

-/

namespace JapanTaxLaw.SpecialMeasuresApportionment

open JapanTaxLaw.TaxFinance

-- ==== independent formulas ====

/-- Spec: 按分共通（被乗数を入れ替えた独立整数定式）。 -/
def specApportion (base numerator denominator : Money) : Money :=
  (numerator * base) / denominator

/-- Spec: art. 25の18 の非課税部分（独立整数定式）。 -/
def specNonTaxablePortion (propertyValue prescribedAmount : Money) : Money :=
  (prescribedAmount * propertyValue) / propertyValue

/-- Spec: art. 40の5の2 の特定贈与者ごとの控除額（独立整数定式）。 -/
def specPerDonorDeduction (taxablePrice totalTaxablePrice : Money) : Money :=
  (taxablePrice * 1_100_000) / totalTaxablePrice

-- ==== points (kernel-decided) ====

example : specApportion 100 100 100 = 100 := by decide
example : specApportion 10 7 3 = 23 := by decide
example : specApportion 10 7 0 = 0 := by decide
example : specApportion 1_000_000 250_000 1_000_000 = 250_000 := by decide

example : specNonTaxablePortion 10_000_000 2_000_000 = 2_000_000 := by decide
example : specNonTaxablePortion 100 7 = 7 := by decide
example : specNonTaxablePortion 0 7 = 0 := by decide

example : specPerDonorDeduction 4_000_000 10_000_000 = 440_000 := by decide
example : specPerDonorDeduction 1 3 = 366_666 := by decide
example : specPerDonorDeduction 10_000_000 10_000_000 = 1_100_000 := by decide
example : specPerDonorDeduction 5 0 = 0 := by decide

-- ==== agreement checks between implementation and Spec ====

/-- 按分共通: impl ≡ spec（有限サンプル上の `==` 一致、分母零・端数切り捨てを含む）。 -/
def agreeApportion : Bool :=
  [ (0, 0, 0), (10, 7, 0), (10, 0, 3), (10, 7, 3), (100, 100, 100),
    (1_000_000, 250_000, 1_000_000), (1_100_000, 1, 3),
    (5_000_000, 2_500_000, 9_000_000) ].all fun (b, n, d) =>
      apportion b n d == specApportion b n d

/-- art. 25の18: impl ≡ spec（有限サンプル上の `==` 一致）。 -/
def agreeNonTaxablePortion : Bool :=
  [ (0, 0), (0, 7), (100, 7), (10_000_000, 2_000_000),
    (1, 1), (3, 3), (999, 333) ].all fun (pv, pa) =>
      nonTaxablePortion pv pa == specNonTaxablePortion pv pa

/-- art. 40の5の2: impl ≡ spec（有限サンプル上の `==` 一致）。 -/
def agreePerDonorDeduction : Bool :=
  [ (0, 0), (5, 0), (1, 3), (10, 10), (4_000_000, 10_000_000),
    (3_000_000, 10_000_000), (1_000_000, 3_000_000),
    (10_000_000, 10_000_000) ].all fun (tp, total) =>
      perDonorDeduction tp total == specPerDonorDeduction tp total

example : agreeApportion = true := by decide
example : agreeNonTaxablePortion = true := by decide
example : agreePerDonorDeduction = true := by decide

end JapanTaxLaw.SpecialMeasuresApportionment
