import JapanTaxLaw.TaxFinance

/-!
# ResidualPeriod10To15 — 相続税法 art.23（残存期間10年超15年以下）
Sources (pinned): law `325AC0000000073` / rev `325AC0000000073_20260401_506AC0000000008`.
原文: 「残存期間が十年を超え十五年以下のもの」
Computation: inRange(y) = y > 10 && y <= 15（下限「超え」は除外、上限「以下」は包含）。
Scope: 残存期間の算定・適用は NOT MODELLED。法的レビューを提供しない。
-/

namespace JapanTaxLaw.ResidualPeriod10To15

def lowerYears : Nat := 10
def upperYears : Nat := 15

def inRange (years : Nat) : Bool := years > lowerYears && years <= upperYears

example : inRange 10 = false := by decide
example : inRange 11 = true := by decide
example : inRange 15 = true := by decide
example : inRange 16 = false := by decide

end JapanTaxLaw.ResidualPeriod10To15
