import JapanTaxLaw.TaxFinance

/-!
# NetPremium50Percent — 租税特別措置法施行令 art.33の3（正味収入保険料×50%）
Sources (pinned): law `332CO0000000043` / rev `332CO0000000043_20261101_507CO0000000127`.
原文: 「…正味収入保険料の百分の五十に相当する金額」
Computation: amount(base) = base * 50 / 100（Nat の下限切り捨て）。
Scope: 保険料の算定・適用は NOT MODELLED。法的レビューを提供しない。
-/

namespace JapanTaxLaw.NetPremium50Percent

def percentNum : Nat := 50
def rateDen : Nat := 100

def amount (base : Nat) : Nat := base * percentNum / rateDen

example : amount 100 = 50 := by decide
example : amount 1_000 = 500 := by decide

end JapanTaxLaw.NetPremium50Percent
