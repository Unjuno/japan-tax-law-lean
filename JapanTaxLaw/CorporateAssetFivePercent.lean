import JapanTaxLaw.TaxFinance

/-!
# CorporateAssetFivePercent — 法人税法施行令 art.155の8（資産額×5%）
Sources (pinned): law `340CO0000000097` / rev `340CO0000000097_20261001_507CO0000000121`.
原文: 「…有形固定資産その他の資産の額として財務省令で定める金額の百分の五に相当する金額」
Computation: amount(base) = base * 5 / 100（Nat の下限切り捨て）。
Scope: 資産額の算定・認定は NOT MODELLED。法的レビューを提供しない。
-/

namespace JapanTaxLaw.CorporateAssetFivePercent

def percentNum : Nat := 5
def rateDen : Nat := 100

def amount (base : Nat) : Nat := base * percentNum / rateDen

example : amount 100 = 5 := by decide
example : amount 1_000 = 50 := by decide

end JapanTaxLaw.CorporateAssetFivePercent
