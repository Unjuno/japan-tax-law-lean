import JapanTaxLaw.RemainderAndValueNorms
import JapanTaxLaw.RemainderAndValueNormsSpec

/-!
# RemainderAndValueNormsTests — 控除残額・価額・床面積
-/
namespace JapanTaxLaw.RemainderAndValueNormsTests

open JapanTaxLaw.RemainderAndValueNorms

theorem remainder_spec (t d : Nat) :
    remainder t d = JapanTaxLaw.RemainderAndValueNormsSpec.remainderSpec t d := by rfl

theorem set_spec (v : Nat) :
    setValue v = JapanTaxLaw.RemainderAndValueNormsSpec.setSpec v := by rfl

theorem area_spec (a r : Nat) :
    areaTaxBase a r = JapanTaxLaw.RemainderAndValueNormsSpec.areaSpec a r := by rfl

theorem sum_spec (xs : List Nat) :
    sumValues xs = JapanTaxLaw.RemainderAndValueNormsSpec.sumSpec xs := by
  induction xs with
  | nil => rfl
  | cons a xs ih => simp [sumValues, JapanTaxLaw.RemainderAndValueNormsSpec.sumSpec, ih]

example (t : Nat) : remainder t t = 0 := remainder_zero t
example (t d : Nat) : remainder t d <= t := remainder_le_total t d
example (v : Nat) : setValue v = v := set_identity v
example (r : Nat) : areaTaxBase 0 r = 0 := area_zero r
example (a : Nat) : areaTaxBase a 1 = a := area_identity a
example : sumValues [] = 0 := sum_nil
example (x : Nat) (xs : List Nat) : sumValues (x :: xs) = x + sumValues xs := sum_cons x xs
example : remainderDeclared = true := remainder_is_declaration

end JapanTaxLaw.RemainderAndValueNormsTests
