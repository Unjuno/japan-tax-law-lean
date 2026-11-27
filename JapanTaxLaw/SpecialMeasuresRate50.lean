import JapanTaxLaw.TaxFinance

/-!
# SpecialMeasuresRate50 — 租税特別措置法施行規則 art.12（割合50%）
Sources (pinned): law `332M50000040015` / rev `332M50000040015_20261101_507M60000040026`.
原文: 「法第三十条第四項に規定する割合は、百分の五十とする。」
Computation: rate = 50（100分率の分子として固定）。
Scope: 根拠条文の適用判断は NOT MODELLED。法的レビューを提供しない。
-/

namespace JapanTaxLaw.SpecialMeasuresRate50

def rateNum : Nat := 50
def rateDen : Nat := 100

def statutoryRate : Nat := rateNum

example : statutoryRate = 50 := by decide

end JapanTaxLaw.SpecialMeasuresRate50
