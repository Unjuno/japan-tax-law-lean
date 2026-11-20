import JapanTaxLaw.PopulationDensityBands
import JapanTaxLaw.PopulationDensityBandsSpec

/-!
# PopulationDensityBandsTests — 境界・仕様一致・九群同一性
-/
namespace JapanTaxLaw.PopulationDensityBandsTests

open JapanTaxLaw.PopulationDensityBands

theorem spec_agree (i d : Nat) (hi : i < 4) :
    inBand i d = true ↔ JapanTaxLaw.PopulationDensityBandsSpec.bandSpec i d := by
  cases i with
  | zero => simp [inBand, JapanTaxLaw.PopulationDensityBandsSpec.bandSpec]
  | succ i1 => cases i1 with
    | zero => simp [inBand, JapanTaxLaw.PopulationDensityBandsSpec.bandSpec]
    | succ i2 => cases i2 with
      | zero => simp [inBand, JapanTaxLaw.PopulationDensityBandsSpec.bandSpec]
      | succ i3 => simp [inBand, JapanTaxLaw.PopulationDensityBandsSpec.bandSpec]

example : inBand 0 25 = true := by decide
example : inBand 0 24 = false := by decide
example : inBand 1 50 = true := by decide
example : inBand 2 99 = true := by decide
example : inBand 3 100 = true := by decide
example : inBand 2 100 = false := by decide

example (d : Nat) : pickVal d < 4 := pickVal_lt_four d
example (d : Nat) (hd : 25 <= d) : ∃ i : Nat, inBand i d = true := exhaustive d hd
example (d i j : Nat) (hil : i < 4) (hjl : j < 4) (hne : i ≠ j)
    (hi : inBand i d = true) (hj : inBand j d = true) : False :=
  pairwise_exclusive d i j hil hjl hne hi hj
example (i d : Nat) : G505_3.inBand i d = G508_45.inBand i d := by
  rw [cross_group_505_507, cross_group_507_508]
  -- G507_3 = G508_3; need G508_45 = G508_3
  exact (all_nine_groups_agree i d).2.2.2.2.2.2.2.symm

end JapanTaxLaw.PopulationDensityBandsTests
