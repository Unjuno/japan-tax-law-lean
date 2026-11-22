import JapanTaxLaw.TonnageExpansionRatioCap

/-
# TonnageExpansionRatioCapSpec — independent spec for 登録免許税法施行令 第二十一条

Pinned source: law 342CO0000000146, revision 342CO0000000146_20261001_507CO0000000124,
  data/raw/342CO0000000146_20261001_507CO0000000124.law.json,
  sha256 0fc3f9ca8c85fa0dbafec4de836a9c1cbf7153c01e58f01b25995aa29ec9aa2b.
  原文逐語 (Item 一):
  「当該設備における最大トン数（製造又は修繕をすることができる船舶の総トン数の最大値をいう。以下この号において同じ。）が、拡張許可前の当該設備における最大トン数の一・六倍を超えることとならないものであること。」

INDEPENDENT FORMULATION. This module owns its own statutory constants
`specScaledRatio : Nat := 16` and `specScaleBase : Nat := 10` (一・六 = 16/10)
and its own relation `specWithin (before : Nat) (after : Nat) : Bool :=
decide (specScaleBase * after <= specScaledRatio * before)`.
No implementation identifier (scaledRatio / scaleBase / withinCap) occurs in
any independent spec* definition. The only bridges are the universal,
axiom-free theorems below, proved by pure `unfold ... ; rfl` (no by_cases,
no omega, no Classical.choice, no quotient). Out of scope: the sibling
Item 二 (最大船長 一・一五倍), 拡張許可の定義・手続, all other provisions.
-/

namespace JapanTaxLaw.TonnageExpansionRatioCap

/-- Independent 一・六 numerator = 16 tenths. -/
def specScaledRatio : Nat := 16

/-- Independent 一・六 denominator = 10. -/
def specScaleBase : Nat := 10

/-- Independent exact relation: 10 * after <= 16 * before. -/
def specWithin (before : Nat) (after : Nat) : Bool :=
  decide (specScaleBase * after <= specScaledRatio * before)

/-- Universal, axiom-free bridges: pure unfold + rfl. -/
theorem agreeRatio : scaledRatio = specScaledRatio := by
  unfold scaledRatio specScaledRatio
  rfl

theorem agreeBase : scaleBase = specScaleBase := by
  unfold scaleBase specScaleBase
  rfl

theorem agreeWithin (before : Nat) (after : Nat) :
    withinCap before after = specWithin before after := by
  unfold withinCap specWithin scaledRatio specScaledRatio scaleBase specScaleBase
  rfl

end JapanTaxLaw.TonnageExpansionRatioCap
