import JapanTaxLaw.TaxFinance

/-!
# MedicalCorpCapitalOver50 — 租税特別措置法施行令 art.40の8（医療法人の出資総額50%超）
Sources (pinned): law `332CO0000000043` / rev `332CO0000000043_20261101_507CO0000000127`.
原文: 「当該医療法人の出資の総額の百分の五十を超える金額」
Computation: threshold(total) = total * 50 / 100; exceeds(a,total) = a > threshold(total)。
Scope: 出資額の算定・適用先は NOT MODELLED。法的レビューを提供しない。
-/

namespace JapanTaxLaw.MedicalCorpCapitalOver50

def percentNum : Nat := 50
def rateDen : Nat := 100

def threshold (total : Nat) : Nat := total * percentNum / rateDen

def exceeds (amount total : Nat) : Bool := amount > threshold total

example : threshold 100 = 50 := by decide
example : exceeds 51 100 = true := by decide
example : exceeds 50 100 = false := by decide

end JapanTaxLaw.MedicalCorpCapitalOver50
