import JapanTaxLaw.TaxFinance

/-!
# EnergyEfficiency116Pct — 租税特別措置法施行令 art.51の2（基準×116%以上）
Sources (pinned): law `332CO0000000043` / rev `332CO0000000043_20261101_507CO0000000127`.
原文: 「エネルギー消費効率が令和二年度基準エネルギー消費効率に百分の百十六を乗じて得た数値以上であること。」
Computation: threshold(base) = base * 116 / 100; meets(eff,base) = eff >= threshold(base)。
Scope: 基準効率の算定・認定は NOT MODELLED。法的レビューを提供しない。
-/

namespace JapanTaxLaw.EnergyEfficiency116Pct

def percentNum : Nat := 116
def rateDen : Nat := 100

def threshold (base : Nat) : Nat := base * percentNum / rateDen

def meets (eff base : Nat) : Bool := eff >= threshold base

example : meets 116 100 = true := by decide
example : meets 115 100 = false := by decide

end JapanTaxLaw.EnergyEfficiency116Pct
