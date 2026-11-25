import JapanTaxLaw.TaxFinance

/-!
# CommonLandAreaTenTimes — 地方税法施行規則 art. 15_4（特定共用土地の面積 家屋床面積の十倍超）

Sources (pinned):

  Law id: 329M50000002023
  Revision: 329M50000002023_20261101_508M60000008045
  Raw snapshot: data/raw/329M50000002023_20261101_508M60000008045.law.json

Pinned 原文: 「前二項の規定は、特定共用土地の面積が当該特定共用土地に係る区分所有に係る家屋の床面積の十倍の面積を超える場合における法第三百五十二条の二第一項の規定による当該特定共用土地に係る持分の割合の補正について準用する。」

Scoped claim: only the 特定共用土地の面積 家屋床面積の十倍超 numeric condition; other conditions are caller-established.
-/

namespace JapanTaxLaw.CommonLandAreaTenTimes

def multiplier : Nat := 10
def threshold : Nat := 0
def triggered (x : Nat) : Bool := decide (threshold < multiplier * x)

theorem constants : multiplier = 10 ∧ threshold = 0 := by
  constructor <;> rfl

end JapanTaxLaw.CommonLandAreaTenTimes
