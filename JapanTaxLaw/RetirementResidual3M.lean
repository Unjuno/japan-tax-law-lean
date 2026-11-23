import JapanTaxLaw.TaxFinance

/-!
# RetirementResidual3M — 所得税法 art. 201（退職手当等 残額 三百万円以下）

Sources (pinned):

  Law id: 340AC0000000033
  Revision: 340AC0000000033_20261001_507AC0000000070
  Raw snapshot: data/raw/340AC0000000033_20261001_507AC0000000070.law.json

Pinned 原文: 「その支払う退職手当等の金額から退職所得控除額を控除した残額が三百万円以下である場合」

Scoped claim: only the 退職手当等 残額 三百万円以下 threshold; other conditions are caller-established.
-/

namespace JapanTaxLaw.RetirementResidual3M

def residualCap3M : Nat := 3000000

def withinResidual3M (x : Nat) : Bool :=
  decide (x <= residualCap3M)

theorem threshold_value : residualCap3M = 3000000 := rfl

end JapanTaxLaw.RetirementResidual3M
