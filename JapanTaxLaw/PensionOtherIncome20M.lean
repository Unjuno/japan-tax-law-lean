import JapanTaxLaw.TaxFinance

/-!
# PensionOtherIncome20M — 所得税法 art. 35（雑所得以外の合計所得金額 二千万円超）

Sources (pinned):

  Law id: 340AC0000000033
  Revision: 340AC0000000033_20261001_507AC0000000070
  Raw snapshot: data/raw/340AC0000000033_20261001_507AC0000000070.law.json

Pinned 原文: 「その年中の公的年金等に係る雑所得以外の合計所得金額が二千万円を超える場合」

Scoped claim: only the 雑所得以外の合計所得金額 二千万円超 threshold; other conditions are caller-established.
-/

namespace JapanTaxLaw.PensionOtherIncome20M

def otherIncomeFloor20M : Nat := 20000000

def exceedsOtherIncome20M (x : Nat) : Bool :=
  decide (otherIncomeFloor20M < x)

theorem threshold_value : otherIncomeFloor20M = 20000000 := rfl

end JapanTaxLaw.PensionOtherIncome20M
