import JapanTaxLaw.TaxFinance

/-!
# IncomeRegulationRate90 — 所得税法施行規則 art.90の2（割合90%）
Sources (pinned): law `340M50000040011` / rev `340M50000040011_20261001_507M60000040018`.
原文: 「令第三百五十二条の二第二項第四号に規定する財務省令で定める割合は、百分の九十とする。」
Computation: rate = 90（100分率の分子として固定）。
Scope: 根拠条文の適用判断は NOT MODELLED。法的レビューを提供しない。
-/

namespace JapanTaxLaw.IncomeRegulationRate90

def rateNum : Nat := 90
def rateDen : Nat := 100

def statutoryRate : Nat := rateNum

example : statutoryRate = 90 := by decide

end JapanTaxLaw.IncomeRegulationRate90
