import JapanTaxLaw.LocalGrantRemainingBands
import JapanTaxLaw.LocalGrantRemainingBandsSpec

/-!
# LocalGrantRemainingBandsTests — 境界例・仕様一致・全称の排他性/網羅性
-/
namespace JapanTaxLaw.LocalGrantRemainingBandsTests

open JapanTaxLaw.LocalGrantRemainingBands

-- A 区分 仕様一致
theorem a_spec (i d : Nat) (hi : i < 5) :
    A.inBand i d = true ↔ JapanTaxLaw.LocalGrantRemainingBandsSpec.A.bandSpec i d := by
  cases i with
  | zero => simp [A.inBand, JapanTaxLaw.LocalGrantRemainingBandsSpec.A.bandSpec]
  | succ i1 =>
    cases i1 with
    | zero => simp [A.inBand, JapanTaxLaw.LocalGrantRemainingBandsSpec.A.bandSpec]
    | succ i2 =>
      cases i2 with
      | zero => simp [A.inBand, JapanTaxLaw.LocalGrantRemainingBandsSpec.A.bandSpec]
      | succ i3 =>
        cases i3 with
        | zero => simp [A.inBand, JapanTaxLaw.LocalGrantRemainingBandsSpec.A.bandSpec]
        | succ i4 => simp [A.inBand, JapanTaxLaw.LocalGrantRemainingBandsSpec.A.bandSpec]

-- B 区分 仕様一致
theorem b_spec (i d : Nat) (hi : i < 2) :
    B.inBand i d = true ↔ JapanTaxLaw.LocalGrantRemainingBandsSpec.B.bandSpec i d := by
  cases i with
  | zero => simp [B.inBand, JapanTaxLaw.LocalGrantRemainingBandsSpec.B.bandSpec]
  | succ i1 => simp [B.inBand, JapanTaxLaw.LocalGrantRemainingBandsSpec.B.bandSpec]

-- A 境界
example : A.inBand 0 200 = true := by decide
example : A.inBand 0 199 = false := by decide
example : A.inBand 3 989 = true := by decide
example : A.inBand 4 990 = true := by decide
example : A.inBand 3 990 = false := by decide

-- B 境界
example : B.inBand 0 95 = true := by decide
example : B.inBand 1 96 = true := by decide
example : B.inBand 0 96 = false := by decide

-- 全称 d について
example (d : Nat) : A.pickVal d < 5 := A.pickVal_lt_five d
example (d : Nat) (hd : 200 <= d) : ∃ i : Nat, A.inBand i d = true := A.exhaustive d hd
example (d i j : Nat) (hil : i < 5) (hjl : j < 5) (hne : i ≠ j)
    (hi : A.inBand i d = true) (hj : A.inBand j d = true) : False :=
  A.pairwise_exclusive d i j hil hjl hne hi hj
example (d : Nat) : B.pickVal d < 2 := B.pickVal_lt_two d
example (d : Nat) : ∃ i : Nat, B.inBand i d = true := B.exhaustive d
example (d i j : Nat) (hil : i < 2) (hjl : j < 2) (hne : i ≠ j)
    (hi : B.inBand i d = true) (hj : B.inBand j d = true) : False :=
  B.pairwise_exclusive d i j hil hjl hne hi hj

end JapanTaxLaw.LocalGrantRemainingBandsTests
