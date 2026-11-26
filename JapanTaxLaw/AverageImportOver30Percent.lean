import JapanTaxLaw.TaxFinance

/-!
# AverageImportOver30Percent — 関税暫定措置法 art.7の3（平均輸入数量 > 平均国内消費量×30%）
Sources (pinned): law `335AC0000000036` / rev `335AC0000000036_20260401_508AC0000000005`.
原文: 「平均輸入数量が平均国内消費量に百分の三十を乗じて得た数量を超える場合」
Computation: threshold(c) = c * 30 / 100（Nat の下限切り捨て）; exceeds(i,c) = i > threshold(c)。
Scope: 数量の算定・手続は NOT MODELLED。法的レビューを提供しない。
-/

namespace JapanTaxLaw.AverageImportOver30Percent

def percentNum : Nat := 30
def rateDen : Nat := 100

def threshold (consumption : Nat) : Nat := consumption * percentNum / rateDen

def exceeds (importQty consumption : Nat) : Bool := importQty > threshold consumption

example : threshold 100 = 30 := by decide
example : exceeds 31 100 = true := by decide
example : exceeds 30 100 = false := by decide

end JapanTaxLaw.AverageImportOver30Percent
