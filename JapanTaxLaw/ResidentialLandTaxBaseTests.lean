import JapanTaxLaw.ResidentialLandTaxBase
import JapanTaxLaw.ResidentialLandTaxBaseSpec

/-!
# ResidentialLandTaxBaseTests — 地方税法 第三百四十九条の三の二（実質的証明）
-/
namespace JapanTaxLaw.ResidentialLandTaxBaseTests
open JapanTaxLaw.ResidentialLandTaxBase

theorem small_spec (a d : Nat) : smallScale a d = JapanTaxLaw.ResidentialLandTaxBaseSpec.smallScaleSpec a d := by
  unfold smallScale JapanTaxLaw.ResidentialLandTaxBaseSpec.smallScaleSpec
  by_cases h : a <= 200 <;> simp [h]
theorem denom_spec (s : Bool) : taxBaseRateDenominator s = JapanTaxLaw.ResidentialLandTaxBaseSpec.taxBaseRateDenominatorSpec s := by rfl
theorem base_spec (p : Nat) (s : Bool) : taxBaseAmount p s = JapanTaxLaw.ResidentialLandTaxBaseSpec.taxBaseAmountSpec p s := by
  unfold taxBaseAmount JapanTaxLaw.ResidentialLandTaxBaseSpec.taxBaseAmountSpec
  rw [denom_spec]
example (a d : Nat) (h : a <= 200) : smallScale a d = true := small_if_le200 a d h
example (a : Nat) (h : 200 < a) : smallScale a 0 = false := not_small_if_over200_zero_dwellings a h
example (a d : Nat) (h1 : 200 < a) (hd : d > 0) (h2 : a / d <= 200) : smallScale a d = true := small_if_per_dwelling_le200 a d h1 hd h2
example : taxBaseRateDenominator true = 6 := small_denom
example : taxBaseRateDenominator false = 3 := normal_denom
example (p : Nat) : taxBaseAmount p true = p / 6 := small_base p
example (p : Nat) : taxBaseAmount p false = p / 3 := normal_base p
example : residentialLandTaxBaseDeclared = true := residential_land_tax_base_is_declaration

end JapanTaxLaw.ResidentialLandTaxBaseTests
