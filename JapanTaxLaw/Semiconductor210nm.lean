import JapanTaxLaw.TaxFinance

/-!
# Semiconductor210nm — 租税特別措置法施行令 art. 27_12_6（導線の中心間隔 二百十ナノメートル超）

Sources (pinned):

  Law id: 332CO0000000043
  Revision: 332CO0000000043_20261101_507CO0000000127
  Raw snapshot: data/raw/332CO0000000043_20261101_507CO0000000127.law.json

Pinned 原文: 「トランジスター上に配置される導線の中心の間隔が最も短い箇所において二百十ナノメートルを超える特定演算半導体」

Scoped claim: only the 導線の中心間隔 二百十ナノメートル超 threshold; other conditions are caller-established.
-/

namespace JapanTaxLaw.Semiconductor210nm

def pitchFloor210 : Nat := 210

def exceedsPitch210 (x : Nat) : Bool :=
  decide (pitchFloor210 < x)

theorem threshold_value : pitchFloor210 = 210 := rfl

end JapanTaxLaw.Semiconductor210nm
