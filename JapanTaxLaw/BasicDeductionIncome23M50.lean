import JapanTaxLaw.TaxFinance

/-!
# BasicDeductionIncome23M50 — 所得税法 art. 86（合計所得金額 二千三百五十万円以下）

Sources (pinned):

  Law id: 340AC0000000033
  Revision: 340AC0000000033_20261001_507AC0000000070
  Raw snapshot: data/raw/340AC0000000033_20261001_507AC0000000070.law.json

Pinned 原文: 「その居住者の合計所得金額が二千三百五十万円以下である場合」

Scoped claim: only the 合計所得金額 二千三百五十万円以下 threshold; other conditions are caller-established.
-/

namespace JapanTaxLaw.BasicDeductionIncome23M50

def incomeCap23M50 : Nat := 23500000

def withinIncome23M50 (x : Nat) : Bool :=
  decide (x <= incomeCap23M50)

theorem threshold_value : incomeCap23M50 = 23500000 := rfl

end JapanTaxLaw.BasicDeductionIncome23M50
