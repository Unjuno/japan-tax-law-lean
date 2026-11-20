import JapanTaxLaw.TaxFinance

/-!
# DisasterIncomeTaxRelief — 災害被害者に対する租税の減免、徴収猶予等に関する法律 第二条

Sources (pinned):

  Law id: 322AC0000000175
  Revision: 322AC0000000175_20220101_503AC0000000011
  Amendment enforcement date: 2022-01-01
  Raw snapshot: data/raw/322AC0000000175_20220101_503AC0000000011.law.json
  （revision CurrentEnforced per data/INVENTORY.json）

Pinned 原文 (verbatim needles from the scoped article):

  合計所得金額が五百万円以下であるとき → 当該所得税の額の全部
  合計所得金額が七百五十万円以下であるとき → 当該所得税の額の十分の五
  合計所得金額が七百五十万円を超えるとき → 当該所得税の額の十分の二・五

This module models ONLY the reduction-fraction selection of art. 2.
Eligibility (甚大な被害, 総所得金額が千万円以下, 第七十二条の適用を受けない),
the tax base and the actual rounding of the reduced tax are caller-established
and are NOT claimed here.
-/

namespace JapanTaxLaw.DisasterIncomeTaxRelief

def fullReliefThreshold : Nat := 5_000_000
def halfReliefThreshold : Nat := 7_500_000

/-- Reduction as (numerator, denominator), using only statute literals:
    十分の十 = 1, 十分の五 = 1/2, 十分の二・五 = 5/20 = 1/4. -/
def reliefFraction (totalIncome : Nat) : Nat × Nat :=
  if totalIncome <= fullReliefThreshold then (10, 10)
  else if totalIncome <= halfReliefThreshold then (5, 10)
  else (5, 10 * 2)

theorem relief_full (h : totalIncome <= fullReliefThreshold) :
    reliefFraction totalIncome = (10, 10) := by
  simp [reliefFraction, h]

theorem relief_half (h1 : fullReliefThreshold < totalIncome)
    (h2 : totalIncome <= halfReliefThreshold) :
    reliefFraction totalIncome = (5, 10) := by
  simp [reliefFraction, h1, h2]

theorem relief_quarter (h : halfReliefThreshold < totalIncome) :
    reliefFraction totalIncome = (5, 10 * 2) := by
  have hnf : ¬ totalIncome <= fullReliefThreshold := by
    unfold fullReliefThreshold halfReliefThreshold at *
    omega
  have hnh : ¬ totalIncome <= halfReliefThreshold := by
    omega
  simp [reliefFraction, hnf, hnh]

theorem reliefFraction_nonincreasing_numerator :
    (reliefFraction 0).1 >= (reliefFraction 5_000_001).1 ∧
    (reliefFraction 5_000_001).1 >= (reliefFraction 7_500_001).1 := by
  simp [reliefFraction, fullReliefThreshold, halfReliefThreshold]

end JapanTaxLaw.DisasterIncomeTaxRelief
