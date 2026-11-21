import JapanTaxLaw.CrossSection15mm
import JapanTaxLaw.CrossSection15mmSpec

/-
# CrossSection15mmTests — kernel-decided boundary checks for 不当廉売関税政令 第一条

All checks are closed Nat/Bool expressions decided by the kernel (`by decide`)
or applications of universal theorems. Coverage: zero, small positive inputs,
the 一・五ミリメートル (= 15 tenths) threshold neighbourhood, saturation/identity,
and impl/spec agreement on the boundary grid.

Pinned source: law 504CO0000000372, revision 504CO0000000372_20221208_000000000000000,
sha256 8a24107aeb9a8ae677da410191e847ff53d533744e39ea187e9e8a7f3bc0041a,
Article Num 1, needle「横断面の最大寸法が一・五ミリメートルを超えるもの」.
-/

namespace JapanTaxLaw.CrossSection15mm

-- (a) zero cross-section dimension does not exceed 一・五ミリメートル.
example : exceedsCrossSection 0 = false := by decide

-- (b) small positive inputs and the 一・五ミリメートル (= 15 tenths) threshold neighbourhood.
example : exceedsCrossSection 1 = false := by decide
example : exceedsCrossSection 2 = false := by decide
example : exceedsCrossSection 14 = false := by decide
example : exceedsCrossSection 15 = false := by decide  -- strict 超え: boundary excluded
example : exceedsCrossSection 16 = true := by decide
example : exceedsCrossSection 17 = true := by decide

-- (c) saturation / identity at the statutory threshold 一・五ミリメートル (= 15 tenths).
example : 15 - 15 = 0 := by decide
example : dimensionTenths = 15 := by decide
example : dimensionTenths < 16 := by decide

-- (d) the named impl theorems apply at the boundary points.
example : exceedsCrossSection 14 = false := below_false
example : exceedsCrossSection 15 = false := at_false
example : exceedsCrossSection 16 = true := above_true
example : exceedsCrossSection 0 = false := zero_false

-- direct-inequality form (no monotonicity typeclass), universal.
example {tenths tenths' : Nat} (h : exceedsCrossSection tenths = true)
    (hle : tenths <= tenths') : exceedsCrossSection tenths' = true :=
  exceedsCrossSection_of_lt h hle

-- (e) impl/spec agreement on the boundary grid (kernel-decided Bool).
example : exceedsCrossSection 0 = specExceeds 0 := by decide
example : exceedsCrossSection 14 = specExceeds 14 := by decide
example : exceedsCrossSection 15 = specExceeds 15 := by decide
example : exceedsCrossSection 16 = specExceeds 16 := by decide
example (x : Nat) : exceedsCrossSection x = specExceeds x := agreeExceeds x

end JapanTaxLaw.CrossSection15mm
