import JapanTaxLaw.TaxFinance

/-!
# RetirementIncome3M — 所得税法 art. 30（退職所得 残額 三百万円以下）

Sources (pinned):

  Law id: 340AC0000000033
  Revision: 340AC0000000033_20261001_507AC0000000070
  Raw snapshot: data/raw/340AC0000000033_20261001_507AC0000000070.law.json

Pinned 原文: 「当該退職手当等の収入金額から退職所得控除額を控除した残額が三百万円以下である場合」

Scoped claim: only the 退職所得 残額 三百万円以下 threshold; other conditions are caller-established.
-/

namespace JapanTaxLaw.RetirementIncome3M

def retirementCap3M : Nat := 3000000

def withinRetirement3M (x : Nat) : Bool :=
  decide (x <= retirementCap3M)

theorem threshold_value : retirementCap3M = 3000000 := rfl

end JapanTaxLaw.RetirementIncome3M
