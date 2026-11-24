import JapanTaxLaw.TaxFinance

/-!
# ForeignCorpDeduction10M — 法人税法施行令 art. 141_6（国外事業所等の金額 千万円以下）

Sources (pinned):

  Law id: 340CO0000000097
  Revision: 340CO0000000097_20261001_507CO0000000121
  Raw snapshot: data/raw/340CO0000000097_20261001_507CO0000000121.law.json

Pinned 原文: 「当該国外事業所等に係る前項の規定により計算した金額が千万円以下であるとき。」

Scoped claim: only the 国外事業所等の金額 千万円以下 threshold; other conditions are caller-established.
-/

namespace JapanTaxLaw.ForeignCorpDeduction10M

def foreignDeductionCap10M : Nat := 10000000

def withinForeignDeduction10M (x : Nat) : Bool :=
  decide (x <= foreignDeductionCap10M)

theorem threshold_value : foreignDeductionCap10M = 10000000 := rfl

end JapanTaxLaw.ForeignCorpDeduction10M
