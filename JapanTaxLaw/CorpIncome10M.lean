import JapanTaxLaw.TaxFinance

/-!
# CorpIncome10M — 法人税法 art. 142_3（政令計算の収益の額 千万円以下）

Sources (pinned):

  Law id: 340AC0000000034
  Revision: 340AC0000000034_20261001_508AC0000000012
  Raw snapshot: data/raw/340AC0000000034_20261001_508AC0000000012.law.json

Pinned 原文: 「前項に規定する満たない部分に相当する金額に係る収益の額として政令で定めるところにより計算した金額が千万円以下であるとき。」

Scoped claim: only the 政令計算の収益の額 千万円以下 threshold; other conditions are caller-established.
-/

namespace JapanTaxLaw.CorpIncome10M

def corpIncomeCap10M : Nat := 10000000

def withinCorpIncome10M (x : Nat) : Bool :=
  decide (x <= corpIncomeCap10M)

theorem threshold_value : corpIncomeCap10M = 10000000 := rfl

end JapanTaxLaw.CorpIncome10M
