import JapanTaxLaw.TaxFinance

/-!
# LoanBalanceRatioAtMost15 — 所得税法施行令 art.73（貸付金残額割合 15%以下）
Sources (pinned): law `340CO0000000096` / rev `340CO0000000096_20260522_508CO0000000093`.
原文: 「資産総額のうちに当該貸付金の残額の合計額の占める割合が常時百分の十五以下であること。」
Computation: atMost15(rate) = rate <= 15（「以下」なので境界値 15 を含む）。
Scope: 資産総額・残額の算定は NOT MODELLED。法的レビューを提供しない。
-/

namespace JapanTaxLaw.LoanBalanceRatioAtMost15

def thresholdNum : Nat := 15
def rateDen : Nat := 100

def atMost15 (rate : Nat) : Bool := rate <= thresholdNum

example : atMost15 14 = true := by decide
example : atMost15 15 = true := by decide
example : atMost15 16 = false := by decide

end JapanTaxLaw.LoanBalanceRatioAtMost15
