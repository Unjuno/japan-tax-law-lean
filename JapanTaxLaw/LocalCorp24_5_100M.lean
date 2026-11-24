import JapanTaxLaw.TaxFinance

/-!
# LocalCorp24_5_100M — 地方法人税法 art. 24_5（資本金等の額 一億円超）

Sources (pinned):

  Law id: 426AC0000000011
  Revision: 426AC0000000011_20260401_507AC0000000013
  Raw snapshot: data/raw/426AC0000000011_20260401_507AC0000000013.law.json

Pinned 原文: 「当該課税対象会計年度開始の時における資本金の額、出資金の額その他これらに類するものとして政令で定める金額が一億円を超える法人」

Scoped claim: only the 資本金等の額 一億円超 threshold; other conditions are caller-established.
-/

namespace JapanTaxLaw.LocalCorp24_5_100M

def localCapitalFloor24_5 : Nat := 100000000

def exceedsLocalCapital24_5 (x : Nat) : Bool :=
  decide (localCapitalFloor24_5 < x)

theorem threshold_value : localCapitalFloor24_5 = 100000000 := rfl

end JapanTaxLaw.LocalCorp24_5_100M
