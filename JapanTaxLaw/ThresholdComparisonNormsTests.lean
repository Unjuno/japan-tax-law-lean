import JapanTaxLaw.ThresholdComparisonNorms
import JapanTaxLaw.ThresholdComparisonNormsSpec

/-!
# ThresholdComparisonNormsTests — 閾値比較
-/
namespace JapanTaxLaw.ThresholdComparisonNormsTests

open JapanTaxLaw.ThresholdComparisonNorms

theorem exceeds_spec (v t : Nat) :
    exceeds v t = true ↔ JapanTaxLaw.ThresholdComparisonNormsSpec.exceedsSpec v t := by
  simp [exceeds, JapanTaxLaw.ThresholdComparisonNormsSpec.exceedsSpec]

theorem excess_spec (v t : Nat) :
    excessPart v t = JapanTaxLaw.ThresholdComparisonNormsSpec.excessSpec v t := by rfl

theorem band_spec (v lo hi : Nat) :
    inBand v lo hi = true ↔ JapanTaxLaw.ThresholdComparisonNormsSpec.bandSpec v lo hi := by
  simp [inBand, JapanTaxLaw.ThresholdComparisonNormsSpec.bandSpec]

example (t : Nat) : exceeds t t = false := exceeds_at_threshold t
example (v t : Nat) (h : t < v) : exceeds v t = true := exceeds_above v t h
example (v t : Nat) (h : v <= t) : excessPart v t = 0 := excess_zero v t h
example (lo hi : Nat) (h : lo < hi) : inBand lo lo hi = false := band_lower lo hi h
example (lo hi : Nat) (h : lo < hi) : inBand hi lo hi = true := band_upper lo hi h
example (v lo hi : Nat) (h : hi < v) : inBand v lo hi = false := band_outside v lo hi h
example (t : Nat) : atMost t t = true := atMost_boundary t
example (t : Nat) : atLeast t t = true := atLeast_boundary t
example (t : Nat) : below t t = false := below_boundary t

end JapanTaxLaw.ThresholdComparisonNormsTests
