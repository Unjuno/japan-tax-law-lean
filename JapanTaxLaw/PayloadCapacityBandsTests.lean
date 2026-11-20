import JapanTaxLaw.PayloadCapacityBands
import JapanTaxLaw.PayloadCapacityBandsSpec

/-!
# PayloadCapacityBandsTests — 境界例・仕様一致・全称の排他性/網羅性
-/
namespace JapanTaxLaw.PayloadCapacityBandsTests

open JapanTaxLaw.PayloadCapacityBands

theorem spec_agree (i d : Nat) (hi : i < 9) :
    inBand i d = true ↔ JapanTaxLaw.PayloadCapacityBandsSpec.bandSpec i d := by
  cases i with
  | zero => simp [inBand, JapanTaxLaw.PayloadCapacityBandsSpec.bandSpec]
  | succ i1 => cases i1 with
    | zero => simp [inBand, JapanTaxLaw.PayloadCapacityBandsSpec.bandSpec]
    | succ i2 => cases i2 with
      | zero => simp [inBand, JapanTaxLaw.PayloadCapacityBandsSpec.bandSpec]
      | succ i3 => cases i3 with
        | zero => simp [inBand, JapanTaxLaw.PayloadCapacityBandsSpec.bandSpec]
        | succ i4 => cases i4 with
          | zero => simp [inBand, JapanTaxLaw.PayloadCapacityBandsSpec.bandSpec]
          | succ i5 => cases i5 with
            | zero => simp [inBand, JapanTaxLaw.PayloadCapacityBandsSpec.bandSpec]
            | succ i6 => cases i6 with
              | zero => simp [inBand, JapanTaxLaw.PayloadCapacityBandsSpec.bandSpec]
              | succ i7 => cases i7 with
                | zero => simp [inBand, JapanTaxLaw.PayloadCapacityBandsSpec.bandSpec]
                | succ i8 => simp [inBand, JapanTaxLaw.PayloadCapacityBandsSpec.bandSpec]

example : inBand 0 1 = true := by decide
example : inBand 0 2 = false := by decide
example : inBand 1 2 = true := by decide
example : inBand 7 8 = true := by decide
example : inBand 8 8 = false := by decide
example : inBand 8 9 = true := by decide

example (d : Nat) : pickVal d < 9 := pickVal_lt_nine d
example (d : Nat) : ∃ i : Nat, inBand i d = true := exhaustive d
example (d i j : Nat) (hil : i < 9) (hjl : j < 9) (hne : i ≠ j)
    (hi : inBand i d = true) (hj : inBand j d = true) : False :=
  pairwise_exclusive d i j hil hjl hne hi hj

end JapanTaxLaw.PayloadCapacityBandsTests
