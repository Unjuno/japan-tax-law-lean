import JapanTaxLaw.TaxFinance

/-!
# CityPlanningTaxRateCeiling03 — 地方税法 art.702の4（都市計画税 0.3%上限）
Sources (pinned): law `325AC0000000226` / rev `325AC0000000226_20261101_508AC0000000002`.
原文: 「都市計画税の税率は、百分の〇・三を超えることができない。」
Computation（入力は1000分率の分子。0.3% = 3/1000）:
  withinCeiling(rate) = rate <= 3（「超えることができない」なので境界値 3 を含む）
Scope: 標準税率・課税標準は NOT MODELLED。法的レビューを提供しない。
-/

namespace JapanTaxLaw.CityPlanningTaxRateCeiling03

def ceilingNum : Nat := 3
def rateDen : Nat := 1000

def withinCeiling (rate : Nat) : Bool := rate <= ceilingNum

example : withinCeiling 2 = true := by decide
example : withinCeiling 3 = true := by decide
example : withinCeiling 4 = false := by decide

end JapanTaxLaw.CityPlanningTaxRateCeiling03
