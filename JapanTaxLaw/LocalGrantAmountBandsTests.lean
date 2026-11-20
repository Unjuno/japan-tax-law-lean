import JapanTaxLaw.LocalGrantAmountBands
import JapanTaxLaw.LocalGrantAmountBandsSpec

/-!
# LocalGrantAmountBandsTests — 境界例・仕様一致・全称の排他性/網羅性
-/
namespace JapanTaxLaw.LocalGrantAmountBandsTests

open JapanTaxLaw.LocalGrantAmountBands
open JapanTaxLaw.LocalGrantAmountBandsSpec

theorem impl_spec_agree (i d : Nat) (hi : i < 6) :
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
            | succ i6 => simp [inBand, bandSpec]

-- 境界（円）
example : inBand 0 3_000 = true := by decide
example : inBand 0 2_999 = false := by decide
example : inBand 0 24_999 = true := by decide
example : inBand 1 25_000 = true := by decide
example : inBand 1 24_999 = false := by decide
example : inBand 4 899_999 = true := by decide
example : inBand 5 900_000 = true := by decide
example : inBand 4 900_000 = false := by decide

-- 全称 d について
example (d : Nat) : pickVal d < 6 := pickVal_lt_six d
example (d : Nat) (hd : 3_000 <= d) : ∃ i : Nat, inBand i d = true := exhaustive d hd
example (d i j : Nat) (hil : i < 6) (hjl : j < 6) (hne : i ≠ j)
    (hi : inBand i d = true) (hj : inBand j d = true) : False :=
  pairwise_exclusive d i j hil hjl hne hi hj

end JapanTaxLaw.LocalGrantAmountBandsTests
