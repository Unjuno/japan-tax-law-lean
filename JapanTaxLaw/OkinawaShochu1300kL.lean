import JapanTaxLaw.TaxFinance

/-!
# OkinawaShochu1300kL — 沖縄の復帰に伴う国税関係法令の適用の特別措置等に関する政令 art. 72（移出数量 千三百キロリットル超）

Sources (pinned):

  Law id: 347CO0000000151
  Revision: 347CO0000000151_20251231_507CO0000000426
  Raw snapshot: data/raw/347CO0000000151_20251231_507CO0000000426.law.json

Pinned 原文: 「前年度特例適用単式蒸留焼酎の移出数量が千三百キロリットルを超える場合」

Scoped claim: only the 移出数量 千三百キロリットル超 threshold; other conditions are caller-established.
-/

namespace JapanTaxLaw.OkinawaShochu1300kL

def shochuFloor1300 : Nat := 1300

def exceedsShochu1300 (x : Nat) : Bool :=
  decide (shochuFloor1300 < x)

theorem threshold_value : shochuFloor1300 = 1300 := rfl

end JapanTaxLaw.OkinawaShochu1300kL
