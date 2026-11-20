import JapanTaxLaw.MeshPopulationBands
import JapanTaxLaw.MeshPopulationBandsSpec

/-!
# MeshPopulationBandsTests — 境界例・仕様一致・全称の排他性/網羅性
-/
namespace JapanTaxLaw.MeshPopulationBandsTests

open JapanTaxLaw.MeshPopulationBands

theorem spec_agree (i d : Nat) (hi : i < 7) :
    inBand i d = true ↔ JapanTaxLaw.MeshPopulationBandsSpec.bandSpec i d := by
  cases i with
  | zero => simp [inBand, JapanTaxLaw.MeshPopulationBandsSpec.bandSpec]
  | succ i1 => cases i1 with
    | zero => simp [inBand, JapanTaxLaw.MeshPopulationBandsSpec.bandSpec]
    | succ i2 => cases i2 with
      | zero => simp [inBand, JapanTaxLaw.MeshPopulationBandsSpec.bandSpec]
      | succ i3 => cases i3 with
        | zero => simp [inBand, JapanTaxLaw.MeshPopulationBandsSpec.bandSpec]
        | succ i4 => cases i4 with
          | zero => simp [inBand, JapanTaxLaw.MeshPopulationBandsSpec.bandSpec]
          | succ i5 => cases i5 with
            | zero => simp [inBand, JapanTaxLaw.MeshPopulationBandsSpec.bandSpec]
            | succ i6 => cases i6 with
              | zero => simp [inBand, JapanTaxLaw.MeshPopulationBandsSpec.bandSpec]
              | succ i7 => simp [inBand, JapanTaxLaw.MeshPopulationBandsSpec.bandSpec]

example : inBand 0 100 = true := by decide
example : inBand 0 99 = false := by decide
example : inBand 0 199 = true := by decide
example : inBand 1 200 = true := by decide
example : inBand 5 1999 = true := by decide
example : inBand 6 2000 = true := by decide
example : inBand 6 3999 = true := by decide

example (d : Nat) : pickVal d < 7 := pickVal_lt_seven d
example (d : Nat) (hd : 100 <= d) (hd2 : d < 4000) : ∃ i : Nat, inBand i d = true :=
  exhaustive d hd hd2
example (d i j : Nat) (hil : i < 7) (hjl : j < 7) (hne : i ≠ j)
    (hi : inBand i d = true) (hj : inBand j d = true) : False :=
  pairwise_exclusive d i j hil hjl hne hi hj
example (i d : Nat) : P.inBand i d = M.inBand i d := cross_scope_inBand i d
example (d : Nat) : P.pickVal d = M.pickVal d := cross_scope_pickVal d

end JapanTaxLaw.MeshPopulationBandsTests
