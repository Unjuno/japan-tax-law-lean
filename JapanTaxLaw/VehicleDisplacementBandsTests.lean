import JapanTaxLaw.VehicleDisplacementBands
import JapanTaxLaw.VehicleDisplacementBandsSpec

/-!
# VehicleDisplacementBandsTests — kernel-decided boundary examples + spec agreement
-/
namespace JapanTaxLaw.VehicleDisplacementBandsTests

open JapanTaxLaw.VehicleDisplacementBands
open JapanTaxLaw.VehicleDisplacementBandsSpec

-- 実装と独立仕様の一致（全称 d, i < 10）
theorem impl_spec_agree (i d : Nat) (hi : i < 10) :
    inBand i d = true ↔ bandSpec i d := by
  cases i with
  | zero => simp [inBand, bandSpec]
  | succ i1 =>
    cases i1 with
    | zero => simp [inBand, bandSpec]
    | succ i2 =>
      cases i2 with
      | zero => simp [inBand, bandSpec]
      | succ i3 =>
        cases i3 with
        | zero => simp [inBand, bandSpec]
        | succ i4 =>
          cases i4 with
          | zero => simp [inBand, bandSpec]
          | succ i5 =>
            cases i5 with
            | zero => simp [inBand, bandSpec]
            | succ i6 =>
              cases i6 with
              | zero => simp [inBand, bandSpec]
              | succ i7 =>
                cases i7 with
                | zero => simp [inBand, bandSpec]
                | succ i8 =>
                  cases i8 with
                  | zero => simp [inBand, bandSpec]
                  | succ i9 =>
                    cases i9 with
                    | zero => simp [inBand, bandSpec]
                    | succ i10 =>
                      simp [inBand, bandSpec]

-- 各境界（デシリットル）
example : inBand 0 10 = true := by decide
example : inBand 0 11 = false := by decide
example : inBand 1 10 = false := by decide
example : inBand 1 15 = true := by decide
example : inBand 2 16 = true := by decide
example : inBand 8 60 = true := by decide
example : inBand 9 60 = false := by decide
example : inBand 9 61 = true := by decide

-- 全称 d についてちょうど一つの区分（有限領域の検査ではない）
example (d : Nat) : ∃ i : Nat, inBand i d = true := exhaustive d
example (d : Nat) : pickVal d < 10 := pickVal_lt_ten d
example (d i j : Nat) (hil : i < 10) (hjl : j < 10) (hne : i ≠ j)
    (hi : inBand i d = true) (hj : inBand j d = true) : False :=
  pairwise_exclusive d i j hil hjl hne hi hj

end JapanTaxLaw.VehicleDisplacementBandsTests
