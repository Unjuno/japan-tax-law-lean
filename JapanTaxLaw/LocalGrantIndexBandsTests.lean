import JapanTaxLaw.LocalGrantIndexBands
import JapanTaxLaw.LocalGrantIndexBandsSpec

/-!
# LocalGrantIndexBandsTests — 境界例・仕様一致・全称の排他性/網羅性
-/
namespace JapanTaxLaw.LocalGrantIndexBandsTests

open JapanTaxLaw.LocalGrantIndexBands

-- C 区分: 仕様一致（全称 d, i<4）
theorem c_spec (i d : Nat) (hi : i < 4) :
    C.inBand i d = true ↔ JapanTaxLaw.LocalGrantIndexBandsSpec.C.bandSpec i d := by
  cases i with
  | zero => simp [C.inBand, JapanTaxLaw.LocalGrantIndexBandsSpec.C.bandSpec]
  | succ i1 =>
    cases i1 with
    | zero => simp [C.inBand, JapanTaxLaw.LocalGrantIndexBandsSpec.C.bandSpec]
    | succ i2 =>
      cases i2 with
      | zero => simp [C.inBand, JapanTaxLaw.LocalGrantIndexBandsSpec.C.bandSpec]
      | succ i3 => simp [C.inBand, JapanTaxLaw.LocalGrantIndexBandsSpec.C.bandSpec]

-- E 区分: 仕様一致（全称 d, i<5）
theorem e_spec (i d : Nat) (hi : i < 5) :
    E.inBand i d = true ↔ JapanTaxLaw.LocalGrantIndexBandsSpec.E.bandSpec i d := by
  cases i with
  | zero => simp [E.inBand, JapanTaxLaw.LocalGrantIndexBandsSpec.E.bandSpec]
  | succ i1 =>
    cases i1 with
    | zero => simp [E.inBand, JapanTaxLaw.LocalGrantIndexBandsSpec.E.bandSpec]
    | succ i2 =>
      cases i2 with
      | zero => simp [E.inBand, JapanTaxLaw.LocalGrantIndexBandsSpec.E.bandSpec]
      | succ i3 =>
        cases i3 with
        | zero => simp [E.inBand, JapanTaxLaw.LocalGrantIndexBandsSpec.E.bandSpec]
        | succ i4 => simp [E.inBand, JapanTaxLaw.LocalGrantIndexBandsSpec.E.bandSpec]

-- C 境界
example : C.inBand 0 99 = true := by decide
example : C.inBand 1 100 = true := by decide
example : C.inBand 0 100 = false := by decide
example : C.inBand 2 299 = true := by decide
example : C.inBand 3 300 = true := by decide
example : C.inBand 2 300 = false := by decide

-- E 境界
example : E.inBand 0 9 = true := by decide
example : E.inBand 1 10 = true := by decide
example : E.inBand 0 10 = false := by decide
example : E.inBand 3 329 = true := by decide
example : E.inBand 4 330 = true := by decide
example : E.inBand 3 330 = false := by decide

-- 全称 d について
example (d : Nat) : C.pickVal d < 4 := C.pickVal_lt_four d
example (d : Nat) : ∃ i : Nat, C.inBand i d = true := C.exhaustive d
example (d i j : Nat) (hil : i < 4) (hjl : j < 4) (hne : i ≠ j)
    (hi : C.inBand i d = true) (hj : C.inBand j d = true) : False :=
  C.pairwise_exclusive d i j hil hjl hne hi hj
example (d : Nat) : E.pickVal d < 5 := E.pickVal_lt_five d
example (d : Nat) : ∃ i : Nat, E.inBand i d = true := E.exhaustive d
example (d i j : Nat) (hil : i < 5) (hjl : j < 5) (hne : i ≠ j)
    (hi : E.inBand i d = true) (hj : E.inBand j d = true) : False :=
  E.pairwise_exclusive d i j hil hjl hne hi hj

end JapanTaxLaw.LocalGrantIndexBandsTests
