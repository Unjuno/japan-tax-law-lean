import JapanTaxLaw.TaxFinance

/-!
# LiquorMix26Deg — 酒税法施行令 art. 50（混和後のアルコール分 二十六度以上）

Sources (pinned):

  Law id: 337CO0000000097
  Revision: 337CO0000000097_20250401_507CO0000000006
  Raw snapshot: data/raw/337CO0000000097_20250401_507CO0000000006.law.json

Pinned 原文: 「ただし、連続式蒸留焼酎又は単式蒸留焼酎と当該物品との混和をした酒類で、その混和後のアルコール分が二十六度以上のものその他財務省令で定めるものは、スピリッツとみなす。」

Scoped claim: only the 混和後のアルコール分 二十六度以上 threshold; other conditions are caller-established.
-/

namespace JapanTaxLaw.LiquorMix26Deg

def mixFloor26 : Nat := 26

def hasMix26Deg (x : Nat) : Bool :=
  decide (mixFloor26 <= x)

theorem threshold_value : mixFloor26 = 26 := rfl

end JapanTaxLaw.LiquorMix26Deg
