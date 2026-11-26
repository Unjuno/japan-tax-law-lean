import JapanTaxLaw.HouseholdCorrectionFloor07Spec

/-
# HouseholdCorrectionFloor07Tests — kernel-decided boundary examples

Every concrete assertion is closed by `decide` or `omega`; the general
impl/spec correspondence is the universal theorem `agreeCorrected`, not the
examples.
-/

namespace JapanTaxLaw.HouseholdCorrectionFloor07

-- (a) 差がちょうど千: 「千を超える」は厳密なので補正なし。
example : ¬ gapExceeds 0 1000 := by
  unfold gapExceeds gapThreshold
  omega
example : correctedScaled 0 1000 = 0 := by decide

-- (b) 差が千より一つ大きい: 補正が発動し 0.7 × 1001 = 700.7 (scaled 7007)。
example : gapExceeds 0 1001 := by
  unfold gapExceeds gapThreshold
  omega
example : correctedScaled 0 1001 = 7007 := by decide

-- (c) 〇・七境界未満だが差が千以下: 補正なし。
example : belowFloor 699 1000 := by
  unfold belowFloor scaledFloor scale factor
  omega
example : ¬ gapExceeds 699 1000 := by
  unfold gapExceeds gapThreshold
  omega
example : correctedScaled 699 1000 = 6990 := by decide

-- (d) 〇・七にちょうど等しい: 「に満たず」は厳密なので補正なし。
example : ¬ belowFloor 700 1000 := by
  unfold belowFloor scaledFloor scale factor
  omega
example : correctedScaled 700 1000 = 7000 := by decide

-- (e) 両条件を満たす: 100 < 0.7 × 2000 = 1400 かつ差 1900 > 千。
example : correctedScaled 100 2000 = 14000 := by decide

-- (f) 下限を超える世帯数では下限条件が偽。
example : correctedScaled 1500 2000 = 15000 := by decide

-- (g) 独立仕様との普遍一致（いくつかの具体点）。
example : specCorrected 0 1000 = correctedScaled 0 1000 := agreeCorrected 0 1000
example : specCorrected 0 1001 = correctedScaled 0 1001 := agreeCorrected 0 1001
example : specCorrected 699 1000 = correctedScaled 699 1000 := agreeCorrected 699 1000
example : specCorrected 100 2000 = correctedScaled 100 2000 := agreeCorrected 100 2000

-- (h) 条件成立時のみ補正が真に値を引き上げる（全称定理の具体点）。
example : specApplies 0 1001 → 10 * 0 < specCorrected 0 1001 := by
  intro h
  unfold specCorrected
  rw [if_pos h]
  omega

end JapanTaxLaw.HouseholdCorrectionFloor07
