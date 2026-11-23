import JapanTaxLaw.TaxFinance

/-!
# Stay183Days — 外国居住者等の所得に対する相互主義による所得税等の非課税等に関する法律 art. 23（滞在期間 百八十三日を超えない）

Sources (pinned):

  Law id: 337AC0000000144
  Revision: 337AC0000000144_20260401_508AC0000000002
  Raw snapshot: data/raw/337AC0000000144_20260401_508AC0000000002.law.json

Pinned 原文: 「判定期間の全てにおいて当該外国居住者等の国内における滞在期間が百八十三日を超えないこと。」

Scoped claim: only the 滞在期間 百八十三日を超えない threshold; other conditions are caller-established.
-/

namespace JapanTaxLaw.Stay183Days

def stayCap183 : Nat := 183

def withinStay183 (x : Nat) : Bool :=
  decide (x <= stayCap183)

theorem threshold_value : stayCap183 = 183 := rfl

end JapanTaxLaw.Stay183Days
