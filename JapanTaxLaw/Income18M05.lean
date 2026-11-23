import JapanTaxLaw.TaxFinance

/-!
# Income18M05 — 租税特別措置法 art. 41_3_8（合計所得金額の見積額 千八百五万円超）

Sources (pinned):

  Law id: 332AC0000000026
  Revision: 332AC0000000026_20261101_507AC0000000013
  Raw snapshot: data/raw/332AC0000000026_20261101_507AC0000000013.law.json

Pinned 原文: 「ただし、その者のその年分の所得税に係るその年の合計所得金額の見積額が千八百五万円を超える場合については、この限りでない。」

Scoped claim: only the 合計所得金額の見積額 千八百五万円超 threshold; other conditions are caller-established.
-/

namespace JapanTaxLaw.Income18M05

def incomeFloor18M05 : Nat := 18050000

def exceedsIncome18M05 (x : Nat) : Bool :=
  decide (incomeFloor18M05 < x)

theorem threshold_value : incomeFloor18M05 = 18050000 := rfl

end JapanTaxLaw.Income18M05
