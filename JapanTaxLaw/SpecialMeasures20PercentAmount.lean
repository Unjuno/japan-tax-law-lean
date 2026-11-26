import JapanTaxLaw.TaxFinance

/-!
# SpecialMeasures20PercentAmount — 租税特別措置法 art.42の14（20%相当額）
Sources (pinned): law `332AC0000000026` / rev `332AC0000000026_20261101_507AC0000000013`.
原文: 「同条第一項又は第二項に規定する百分の二十に相当する金額」
Computation: amount(base) = base * 20 / 100（Nat の下限切り捨て）。
Scope: 根拠となる金額の算定・適用は NOT MODELLED。法的レビューを提供しない。
-/

namespace JapanTaxLaw.SpecialMeasures20PercentAmount

def percentNum : Nat := 20
def rateDen : Nat := 100

def amount (base : Nat) : Nat := base * percentNum / rateDen

example : amount 100 = 20 := by decide
example : amount 1_000 = 200 := by decide

end JapanTaxLaw.SpecialMeasures20PercentAmount
