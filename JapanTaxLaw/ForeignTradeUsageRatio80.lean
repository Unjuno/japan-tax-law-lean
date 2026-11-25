import JapanTaxLaw.TaxFinance

/-!
# ForeignTradeUsageRatio80 — 地方税法施行規則 art. 11_12（外国貿易日数の割合 八十パーセント超）

Sources (pinned):

  Law id: 329M50000002023
  Revision: 329M50000002023_20261101_508M60000008045
  Raw snapshot: data/raw/329M50000002023_20261101_508M60000008045.law.json

Pinned 原文: 「当該年度の初日の属する年の前年中における外国貿易のために使用された日数の全使用日数に対する割合が八十パーセントを超えるものであること。」

Scoped claim: only the 外国貿易日数の割合 八十パーセント超 numeric condition; other conditions are caller-established.
-/

namespace JapanTaxLaw.ForeignTradeUsageRatio80

def threshold : Nat := 80
def triggered (x : Nat) : Bool := decide (threshold < x)

theorem threshold_value : threshold = 80 := by rfl

end JapanTaxLaw.ForeignTradeUsageRatio80
