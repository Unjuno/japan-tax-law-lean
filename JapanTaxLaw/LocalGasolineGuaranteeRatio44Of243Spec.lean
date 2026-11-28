import JapanTaxLaw.LocalGasolineGuaranteeRatio44Of243

/-
# LocalGasolineGuaranteeRatio44Of243Spec — 地方揮発油税法施行令 1(1) の独立定式

Pinned: law 330CO0000000151, revision 330CO0000000151_20241001_506CO0000000148,
Article 1 Paragraph 1; needle 「…揮発油税額の二百四十三分の四十四に相当する
地方揮発油税額をあわせて担保しなければならない」.

Independent restatement: the local component is gasoline tax multiplied by the
proper fraction 44/243 (coprime). Represented by an independent numerator/
denominator pair with cross-multiplied kernel checks; agreement is a bridge.
-/

namespace JapanTaxLaw.LocalGasolineGuaranteeRatio44Of243

/-- 独立定式: 四十四 = 44。 -/
def specNum : Nat := 44

/-- 独立定式: 二百四十三 = 243。 -/
def specDen : Nat := 243

theorem agreeNum : ratioNumerator = specNum := by
  unfold ratioNumerator specNum
  rfl

theorem agreeDen : ratioDenominator = specDen := by
  unfold ratioDenominator specDen
  rfl

theorem agreeCoprime : Nat.gcd specNum specDen = 1 := by decide
theorem agreeProper : specNum < specDen := by decide
theorem agreeRelation : specDen * 44 = specNum * 243 := by decide

example : specDen * 44 = specNum * 243 := by decide

end JapanTaxLaw.LocalGasolineGuaranteeRatio44Of243
