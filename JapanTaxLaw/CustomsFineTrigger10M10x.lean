import JapanTaxLaw.TaxFinance

/-!
# CustomsFineTrigger10M10x — 関税法 art. 110（関税額の十倍が千万円超）

Sources (pinned):

  Law id: 329AC0000000061
  Revision: 329AC0000000061_20260601_508AC0000000005
  Raw snapshot: data/raw/329AC0000000061_20260601_508AC0000000005.law.json

Pinned 原文: 「前三項の犯罪に係る関税又は関税の払戻しの額の十倍が千万円を超える場合においては、情状により、前三項の罰金は、千万円を超え当該関税又は関税の払戻しの額の十倍に相当する金額以下とすることができる。」

Scoped claim: only the 関税額の十倍が千万円超 numeric condition; other conditions are caller-established.
-/

namespace JapanTaxLaw.CustomsFineTrigger10M10x

def multiplier : Nat := 10
def threshold : Nat := 10000000
def triggered (x : Nat) : Bool := decide (threshold < multiplier * x)

theorem constants : multiplier = 10 ∧ threshold = 10000000 := by
  constructor <;> rfl

end JapanTaxLaw.CustomsFineTrigger10M10x
