import JapanTaxLaw.RateSumProration
import JapanTaxLaw.RateSumProrationSpec

/-!
# RateSumProrationTests — 率乗・合算・差額・按分
-/
namespace JapanTaxLaw.RateSumProrationTests

open JapanTaxLaw.RateSumProration

theorem rate_spec (b r : Nat) :
    rateMultiply b r = JapanTaxLaw.RateSumProrationSpec.rateSpec b r := by rfl

theorem sum_spec (xs : List Nat) :
    sumAmounts xs = JapanTaxLaw.RateSumProrationSpec.sumSpec xs := by
  induction xs with
  | nil => rfl
  | cons a xs ih => simp [sumAmounts, JapanTaxLaw.RateSumProrationSpec.sumSpec, ih]

theorem diff_spec (a b : Nat) :
    difference a b = JapanTaxLaw.RateSumProrationSpec.diffSpec a b := by rfl

theorem proration_spec (t w s : Nat) :
    prorationShare t w s = JapanTaxLaw.RateSumProrationSpec.prorationSpec t w s := by rfl

example (r : Nat) : rateMultiply 0 r = 0 := rate_zero r
example (b : Nat) : rateMultiply b 1 = b := rate_identity b
example : sumAmounts [] = 0 := sum_nil
example (x : Nat) (xs : List Nat) : sumAmounts (x :: xs) = x + sumAmounts xs := sum_cons x xs
example (xs ys : List Nat) : sumAmounts (xs ++ ys) = sumAmounts xs + sumAmounts ys := sum_append xs ys
example (a : Nat) : difference a a = 0 := difference_self a
example (a b : Nat) : (if a <= b then b - a else a - b) = difference a b := difference_nonneg a b
example : prorationShare 0 1 1 = some 0 := proration_zero
example : prorationShare 100 1 0 = none := proration_none
example : computed = true := is_computed

end JapanTaxLaw.RateSumProrationTests
