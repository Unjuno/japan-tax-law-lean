import JapanTaxLaw.TaxFinance

/-!
# ForestRateAtLeast85 — 森林環境税施行規則 art.1の3（林野率85%以上）
Sources (pinned): law `431M60000008040` / rev `431M60000008040_20261021_508M60000008119`.
原文: 「林野率が百分の八十五以上であるもの」
Computation: atLeast85(rate) = rate >= 85（「以上」なので境界値 85 を含む）。
Scope: 林野率の算定・対象自治体の認定は NOT MODELLED。法的レビューを提供しない。
-/

namespace JapanTaxLaw.ForestRateAtLeast85

def thresholdNum : Nat := 85
def rateDen : Nat := 100

def atLeast85 (rate : Nat) : Bool := rate >= thresholdNum

example : atLeast85 84 = false := by decide
example : atLeast85 85 = true := by decide
example : atLeast85 86 = true := by decide

end JapanTaxLaw.ForestRateAtLeast85
