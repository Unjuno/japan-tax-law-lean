import JapanTaxLaw.PayloadCapacityBandsSecondTable
import JapanTaxLaw.PayloadCapacityBandsSecondTableSpec

/-!
# PayloadCapacityBandsSecondTableTests — 境界・仕様一致・表間同一性
-/
namespace JapanTaxLaw.PayloadCapacityBandsSecondTableTests

open JapanTaxLaw.PayloadCapacityBandsSecondTable

theorem spec_agree (i d : Nat) (hi : i < 9) :
    inBand i d = true ↔ JapanTaxLaw.PayloadCapacityBandsSecondTableSpec.bandSpec i d := by
  cases i with
  | zero => simp [inBand, JapanTaxLaw.PayloadCapacityBands.inBand, JapanTaxLaw.PayloadCapacityBandsSecondTableSpec.bandSpec]
  | succ i1 => cases i1 with
    | zero => simp [inBand, JapanTaxLaw.PayloadCapacityBands.inBand, JapanTaxLaw.PayloadCapacityBandsSecondTableSpec.bandSpec]
    | succ i2 => cases i2 with
      | zero => simp [inBand, JapanTaxLaw.PayloadCapacityBands.inBand, JapanTaxLaw.PayloadCapacityBandsSecondTableSpec.bandSpec]
      | succ i3 => cases i3 with
        | zero => simp [inBand, JapanTaxLaw.PayloadCapacityBands.inBand, JapanTaxLaw.PayloadCapacityBandsSecondTableSpec.bandSpec]
        | succ i4 => cases i4 with
          | zero => simp [inBand, JapanTaxLaw.PayloadCapacityBands.inBand, JapanTaxLaw.PayloadCapacityBandsSecondTableSpec.bandSpec]
          | succ i5 => cases i5 with
            | zero => simp [inBand, JapanTaxLaw.PayloadCapacityBands.inBand, JapanTaxLaw.PayloadCapacityBandsSecondTableSpec.bandSpec]
            | succ i6 => cases i6 with
              | zero => simp [inBand, JapanTaxLaw.PayloadCapacityBands.inBand, JapanTaxLaw.PayloadCapacityBandsSecondTableSpec.bandSpec]
              | succ i7 => cases i7 with
                | zero => simp [inBand, JapanTaxLaw.PayloadCapacityBands.inBand, JapanTaxLaw.PayloadCapacityBandsSecondTableSpec.bandSpec]
                | succ i8 => simp [inBand, JapanTaxLaw.PayloadCapacityBands.inBand, JapanTaxLaw.PayloadCapacityBandsSecondTableSpec.bandSpec]

example : inBand 0 1 = true := by decide
example : inBand 8 9 = true := by decide
example (d : Nat) : pickVal d < 9 := pickVal_lt_nine d
example (d : Nat) : ∃ i : Nat, inBand i d = true := exhaustive d
example (i d : Nat) : inBand i d = JapanTaxLaw.PayloadCapacityBands.inBand i d := cross_table_inBand i d

end JapanTaxLaw.PayloadCapacityBandsSecondTableTests
