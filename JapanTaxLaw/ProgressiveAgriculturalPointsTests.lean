import JapanTaxLaw.ProgressiveAgriculturalPoints
import JapanTaxLaw.ProgressiveAgriculturalPointsSpec

/-!
# ProgressiveAgriculturalPointsTests — 式・境界連続性・単調性
-/
namespace JapanTaxLaw.ProgressiveAgriculturalPointsTests

open JapanTaxLaw.ProgressiveAgriculturalPoints

theorem spec_agree (i d : Nat) (hi : i < 3) :
    inBand i d = true ↔ JapanTaxLaw.ProgressiveAgriculturalPointsSpec.bandSpec i d := by
  cases i with
  | zero => simp [inBand, JapanTaxLaw.ProgressiveAgriculturalPointsSpec.bandSpec]
  | succ i1 =>
    cases i1 with
    | zero => simp [inBand, JapanTaxLaw.ProgressiveAgriculturalPointsSpec.bandSpec]
    | succ i2 => simp [inBand, JapanTaxLaw.ProgressiveAgriculturalPointsSpec.bandSpec]

theorem value_spec_agree (i d : Nat) (hi : i < 3) :
    hundredths i d = JapanTaxLaw.ProgressiveAgriculturalPointsSpec.valueHundredthsSpec i d := by
  cases i with
  | zero => simp [hundredths, JapanTaxLaw.ProgressiveAgriculturalPointsSpec.valueHundredthsSpec]
  | succ i1 =>
    cases i1 with
    | zero => simp [hundredths, JapanTaxLaw.ProgressiveAgriculturalPointsSpec.valueHundredthsSpec]
    | succ i2 => simp [hundredths, JapanTaxLaw.ProgressiveAgriculturalPointsSpec.valueHundredthsSpec]

-- 境界値と連続性
example : hundredths 0 2_000 = 6_000 := by decide
example : hundredths 1 2_000 = 6_000 := by decide
example : hundredths 1 7_000 = 46_000 := by decide
example : hundredths 2 7_000 = 46_000 := by decide
example (d : Nat) : inBand 0 d = true → hundredths 0 d = d * 3 := by
  intro h; simp [hundredths]
example (d : Nat) : 2_000 < d → d <= 7_000 → hundredths 1 d = (d - 2_000) * 8 + 6_000 := by
  intro h1 h2; simp [hundredths]
example (d : Nat) : 7_000 < d → hundredths 2 d = (d - 7_000) * 10 + 46_000 := by
  intro h; simp [hundredths]

-- 全称の性質
example (d : Nat) : ∃ i : Nat, inBand i d = true := exhaustive d
example (d : Nat) : pickVal d < 3 := pickVal_lt_three d
example : hundredths 0 2_000 = hundredths 1 2_000 := continuous_at_2000
example : hundredths 1 7_000 = hundredths 2 7_000 := continuous_at_7000
example (a b : Nat) (h : a <= b) (ha : inBand 0 a = true) (hb : inBand 0 b = true) :
    hundredths 0 a <= hundredths 0 b := band_monotone 0 (by decide) a b h ha hb

end JapanTaxLaw.ProgressiveAgriculturalPointsTests
