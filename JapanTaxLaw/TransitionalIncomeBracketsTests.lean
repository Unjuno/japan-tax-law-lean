import JapanTaxLaw.TransitionalIncomeBrackets
import JapanTaxLaw.TransitionalIncomeBracketsSpec

/-!
# TransitionalIncomeBracketsTests — 境界例・仕様一致・全称の排他性/網羅性
-/
namespace JapanTaxLaw.TransitionalIncomeBracketsTests

open JapanTaxLaw.TransitionalIncomeBrackets

theorem t350_spec (i d : Nat) (hi : i < 3) :
    T350.inBand i d = true ↔ JapanTaxLaw.TransitionalIncomeBracketsSpec.T350.bandSpec i d := by
  cases i with
  | zero => simp [T350.inBand, JapanTaxLaw.TransitionalIncomeBracketsSpec.T350.bandSpec]
  | succ i1 =>
    cases i1 with
    | zero => simp [T350.inBand, JapanTaxLaw.TransitionalIncomeBracketsSpec.T350.bandSpec]
    | succ i2 => simp [T350.inBand, JapanTaxLaw.TransitionalIncomeBracketsSpec.T350.bandSpec]

theorem t300_spec (i d : Nat) (hi : i < 3) :
    T300.inBand i d = true ↔ JapanTaxLaw.TransitionalIncomeBracketsSpec.T300.bandSpec i d := by
  cases i with
  | zero => simp [T300.inBand, JapanTaxLaw.TransitionalIncomeBracketsSpec.T300.bandSpec]
  | succ i1 =>
    cases i1 with
    | zero => simp [T300.inBand, JapanTaxLaw.TransitionalIncomeBracketsSpec.T300.bandSpec]
    | succ i2 => simp [T300.inBand, JapanTaxLaw.TransitionalIncomeBracketsSpec.T300.bandSpec]

-- 上限包含（以下）/ 下限排他（超え）の境界
example : T350.inBand 0 3_500_000 = true := by decide
example : T350.inBand 1 3_500_000 = false := by decide
example : T350.inBand 1 3_500_001 = true := by decide
example : T350.inBand 1 7_000_000 = true := by decide
example : T350.inBand 2 7_000_000 = false := by decide
example : T300.inBand 0 3_000_000 = true := by decide
example : T300.inBand 1 3_000_000 = false := by decide
example : T300.inBand 2 6_000_001 = true := by decide

example (d : Nat) : T350.pickVal d < 3 := T350.pickVal_lt_three d
example (d : Nat) : ∃ i : Nat, T350.inBand i d = true := T350.exhaustive d
example (d i j : Nat) (hil : i < 3) (hjl : j < 3) (hne : i ≠ j)
    (hi : T350.inBand i d = true) (hj : T350.inBand j d = true) : False :=
  T350.pairwise_exclusive d i j hil hjl hne hi hj
example (d : Nat) : T300.pickVal d < 3 := T300.pickVal_lt_three d
example (d : Nat) : ∃ i : Nat, T300.inBand i d = true := T300.exhaustive d
example (d i j : Nat) (hil : i < 3) (hjl : j < 3) (hne : i ≠ j)
    (hi : T300.inBand i d = true) (hj : T300.inBand j d = true) : False :=
  T300.pairwise_exclusive d i j hil hjl hne hi hj

end JapanTaxLaw.TransitionalIncomeBracketsTests
