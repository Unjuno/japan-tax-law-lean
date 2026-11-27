import JapanTaxLaw.TaxFinance

/-!
# ReciprocityRate85PerMille — 相互主義非課税法施行令 art.14（8.5%）
Sources (pinned): law `337CO0000000227` / rev `337CO0000000227_20260401_508CO0000000083`.
原文: 「法第十五条第十九項第二号に規定する政令で定める税率は、百分の八・五とする。」
Computation: 「百分の八・五」= 8.5% = 85/1000（1000分率の分子）。
Scope: 根拠条文の適用判断は NOT MODELLED。法的レビューを提供しない。
-/

namespace JapanTaxLaw.ReciprocityRate85PerMille

def rateNum : Nat := 85
def rateDen : Nat := 1000

def statutoryRate : Nat := rateNum

example : statutoryRate = 85 := by decide

end JapanTaxLaw.ReciprocityRate85PerMille
