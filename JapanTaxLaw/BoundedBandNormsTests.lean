import JapanTaxLaw.BoundedBandNorms
import JapanTaxLaw.BoundedBandNormsSpec

/-!
# BoundedBandNormsTests — 区分帯
-/
namespace JapanTaxLaw.BoundedBandNormsTests
open JapanTaxLaw.BoundedBandNorms

theorem atMost_spec (v u : Nat) : atMost v u = JapanTaxLaw.BoundedBandNormsSpec.atMostSpec v u := by
  unfold atMost JapanTaxLaw.BoundedBandNormsSpec.atMostSpec
  by_cases h : v <= u <;> simp [h]
theorem band_spec (v lo hi : Nat) : inBand v lo hi = JapanTaxLaw.BoundedBandNormsSpec.inBandSpec v lo hi := by
  unfold inBand JapanTaxLaw.BoundedBandNormsSpec.inBandSpec
  by_cases h : lo < v && v <= hi <;> simp [h]
example (v u : Nat) (h : v <= u) : atMost v u = true := atMost_true v u h
example (v u : Nat) (h : u < v) : atMost v u = false := atMost_false v u h
example (v lo hi : Nat) (h1 : lo < v) (h2 : v <= hi) : inBand v lo hi = true := band_hit v lo hi h1 h2
example (v lo hi : Nat) (h : v <= lo) : inBand v lo hi = false := band_below v lo hi h
example (v lo hi : Nat) (h : hi < v) : inBand v lo hi = false := band_above v lo hi h
example (v hi : Nat) : inBand v hi hi = false := band_empty v hi
example : boundedBandDeclared = true := bounded_band_is_declaration

end JapanTaxLaw.BoundedBandNormsTests
