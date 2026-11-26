import JapanTaxLaw.TaxFinance

/-!
# CityPlanningTaxBase5Percent — 地方税法施行令 art.15（都市計画税 課税標準×5%）
Sources (pinned): law `325CO0000000245` / rev `325CO0000000245_20261101_508CO0000000083`.
原文: 「都市計画税の課税標準となるべき価格に、百分の五を乗じて得た額」
Computation: amount(base) = base * 5 / 100（Nat の下限切り捨て）。
Scope: 価格の算定・適用年限は NOT MODELLED。法的レビューを提供しない。
-/

namespace JapanTaxLaw.CityPlanningTaxBase5Percent

def percentNum : Nat := 5
def rateDen : Nat := 100

def amount (base : Nat) : Nat := base * percentNum / rateDen

example : amount 100 = 5 := by decide
example : amount 1_000 = 50 := by decide

end JapanTaxLaw.CityPlanningTaxBase5Percent
