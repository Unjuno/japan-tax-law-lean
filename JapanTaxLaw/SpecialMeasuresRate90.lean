import JapanTaxLaw.TaxFinance

/-!
# SpecialMeasuresRate90 — 租税特別措置法施行規則 art.19の5（割合90%）
Sources (pinned): law `332M50000040015` / rev `332M50000040015_20261101_507M60000040026`.
原文: 「法第四十一条の十二の二第六項第一号ニに規定する財務省令で定める割合は、百分の九十とする。」
Computation: rate = 90（100分率の分子として固定）。
Scope: 根拠条文の適用判断は NOT MODELLED。法的レビューを提供しない。
-/

namespace JapanTaxLaw.SpecialMeasuresRate90

def rateNum : Nat := 90
def rateDen : Nat := 100

def statutoryRate : Nat := rateNum

example : statutoryRate = 90 := by decide

end JapanTaxLaw.SpecialMeasuresRate90
