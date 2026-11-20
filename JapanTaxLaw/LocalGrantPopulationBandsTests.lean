import JapanTaxLaw.LocalGrantPopulationBands
import JapanTaxLaw.LocalGrantPopulationBandsSpec

/-!
# LocalGrantPopulationBandsTests — 境界例・仕様一致・全称の排他性/網羅性
-/
namespace JapanTaxLaw.LocalGrantPopulationBandsTests

open JapanTaxLaw.LocalGrantPopulationBands

theorem impl_spec_agree (i d : Nat) (hi : i < 6) :
    inBand i d = true ↔ JapanTaxLaw.LocalGrantPopulationBandsSpec.bandSpec i d := by
  cases i with
  | zero => simp [inBand, JapanTaxLaw.LocalGrantPopulationBandsSpec.bandSpec]
  | succ i1 =>
    cases i1 with
    | zero => simp [inBand, JapanTaxLaw.LocalGrantPopulationBandsSpec.bandSpec]
    | succ i2 =>
      cases i2 with
      | zero => simp [inBand, JapanTaxLaw.LocalGrantPopulationBandsSpec.bandSpec]
      | succ i3 =>
        cases i3 with
        | zero => simp [inBand, JapanTaxLaw.LocalGrantPopulationBandsSpec.bandSpec]
        | succ i4 =>
          cases i4 with
          | zero => simp [inBand, JapanTaxLaw.LocalGrantPopulationBandsSpec.bandSpec]
          | succ i5 => simp [inBand, JapanTaxLaw.LocalGrantPopulationBandsSpec.bandSpec]

example : inBand 0 1_000 = true := by decide
example : inBand 0 999 = false := by decide
example : inBand 0 5_999 = true := by decide
example : inBand 1 6_000 = true := by decide
example : inBand 0 6_000 = false := by decide
example : inBand 4 219_999 = true := by decide
example : inBand 5 220_000 = true := by decide
example : inBand 4 220_000 = false := by decide

example (d : Nat) : pickVal d < 6 := pickVal_lt_six d
example (d : Nat) (hd : 1_000 <= d) : ∃ i : Nat, inBand i d = true := exhaustive d hd
example (d i j : Nat) (hil : i < 6) (hjl : j < 6) (hne : i ≠ j)
    (hi : inBand i d = true) (hj : inBand j d = true) : False :=
  pairwise_exclusive d i j hil hjl hne hi hj

end JapanTaxLaw.LocalGrantPopulationBandsTests
