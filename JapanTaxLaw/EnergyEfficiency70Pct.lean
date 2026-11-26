import JapanTaxLaw.TaxFinance

/-!
# EnergyEfficiency70Pct — 租税特別措置法 art.90の12（基準×70%以上）
Sources (pinned): law `332AC0000000026` / rev `332AC0000000026_20261101_507AC0000000013`.
原文: 「エネルギー消費効率が令和十二年度基準エネルギー消費効率に百分の七十を乗じて得た数値以上であること。」
Computation: threshold(base) = base * 70 / 100; meets(eff,base) = eff >= threshold(base)。
Scope: 基準効率の算定・認定は NOT MODELLED。法的レビューを提供しない。
-/

namespace JapanTaxLaw.EnergyEfficiency70Pct

def percentNum : Nat := 70
def rateDen : Nat := 100

def threshold (base : Nat) : Nat := base * percentNum / rateDen

def meets (eff base : Nat) : Bool := eff >= threshold base

example : meets 70 100 = true := by decide
example : meets 69 100 = false := by decide

end JapanTaxLaw.EnergyEfficiency70Pct
