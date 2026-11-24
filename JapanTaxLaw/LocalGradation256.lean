import JapanTaxLaw.TaxFinance

/-!
# LocalGradation256 — 地方税法施行規則 art. 25（階調 二百五十六階調以上）

Sources (pinned):

  Law id: 329M50000002023
  Revision: 329M50000002023_20261101_508M60000008045
  Raw snapshot: data/raw/329M50000002023_20261101_508M60000008045.law.json

Pinned 原文: 「赤色、緑色及び青色の階調がそれぞれ二百五十六階調以上で読み取るものであること。」

Scoped claim: only the 階調 二百五十六階調以上 threshold; other conditions are caller-established.
-/

namespace JapanTaxLaw.LocalGradation256

def gradationFloor256 : Nat := 256

def hasGradation256 (x : Nat) : Bool :=
  decide (gradationFloor256 <= x)

theorem threshold_value : gradationFloor256 = 256 := rfl

end JapanTaxLaw.LocalGradation256
