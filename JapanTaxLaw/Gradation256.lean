import JapanTaxLaw.TaxFinance

/-!
# Gradation256 — 税理士法施行規則 art. 27（二百五十六階調以上）

Sources (pinned):

  Law id: 326M50000040055
  Revision: 326M50000040055_20260901_506M60000040025
  Raw snapshot: data/raw/326M50000040055_20260901_506M60000040025.law.json

Pinned 原文: 「赤色、緑色及び青色の階調がそれぞれ二百五十六階調以上であること。」

Scoped claim: only the 二百五十六階調以上 threshold; other conditions are caller-established.
-/

namespace JapanTaxLaw.Gradation256

def gradationFloor : Nat := 256

def hasGradation256 (x : Nat) : Bool :=
  decide (gradationFloor <= x)

theorem threshold_value : gradationFloor = 256 := rfl

end JapanTaxLaw.Gradation256
