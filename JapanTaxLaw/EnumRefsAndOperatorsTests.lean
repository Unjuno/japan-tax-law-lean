import JapanTaxLaw.EnumRefsAndOperators
import JapanTaxLaw.EnumRefsAndOperatorsSpec

/-!
# EnumRefsAndOperatorsTests — 範囲・参照・切捨て・合算
-/
namespace JapanTaxLaw.EnumRefsAndOperatorsTests

open JapanTaxLaw.EnumRefsAndOperators

theorem range_spec (lo hi x : Nat) :
    inRange lo hi x = true ↔ JapanTaxLaw.EnumRefsAndOperatorsSpec.rangeSpec lo hi x := by
  simp [inRange, JapanTaxLaw.EnumRefsAndOperatorsSpec.rangeSpec]

theorem enum_spec (xs : List Nat) (x : Nat) :
    inEnum xs x = true ↔ JapanTaxLaw.EnumRefsAndOperatorsSpec.enumSpec xs x := by
  simp [inEnum, JapanTaxLaw.EnumRefsAndOperatorsSpec.enumSpec]

theorem round_spec (x : Nat) :
    roundDown100 x = JapanTaxLaw.EnumRefsAndOperatorsSpec.roundDownSpec x := by rfl

theorem sum_spec (xs : List Nat) :
    sumItems xs = JapanTaxLaw.EnumRefsAndOperatorsSpec.sumSpec xs := by
  induction xs with
  | nil => rfl
  | cons a xs ih => simp [sumItems, JapanTaxLaw.EnumRefsAndOperatorsSpec.sumSpec, ih]

example : inRange 1 3 1 = true := by decide
example : inRange 1 3 3 = true := by decide
example : inRange 1 3 4 = false := by decide
example : inEnum [1,2,3] 2 = true := by decide
example : inEnum [1,2,3] 9 = false := by decide
example : inEnum [] 1 = false := by decide
example : resolveRef 42 = 42 := by decide
example : roundDown100 1234 = 1200 := by decide
example : roundDown100 99 = 0 := by decide
example : roundDown100 100 = 100 := by decide
example : sumItems [1,2,3] = 6 := by decide
example : sumItems [] = 0 := by decide
example (lo hi : Nat) (h : lo <= hi) : inRange lo hi lo = true := inRange_left lo hi h
example (lo hi : Nat) (h : lo <= hi) : inRange lo hi hi = true := inRange_right lo hi h
example (lo hi x : Nat) (h1 : lo <= x) (h2 : x <= hi) : inRange lo hi x = true := inRange_of_bounds lo hi x h1 h2
example (lo hi x : Nat) (h : x < lo) : inRange lo hi x = false := inRange_outside_below lo hi x h
example (lo hi x : Nat) (h : hi < x) : inRange lo hi x = false := inRange_outside_above lo hi x h
example (x : Nat) (xs : List Nat) : inEnum (x :: xs) x = true := inEnum_head x xs
example (xs : List Nat) (x : Nat) (h : x ∈ xs) : inEnum xs x = true := inEnum_of_mem xs x h
example (x : Nat) : inEnum [] x = false := inEnum_empty x
example (t : Nat) : resolveRef t = t := resolveRef_identity t
example (x : Nat) : roundDown100 x <= x := roundDown100_le x
example (x : Nat) : roundDown100 x % 100 = 0 := roundDown100_divisible x
example (x : Nat) (h : x % 100 = 0) : roundDown100 x = x := roundDown100_id x h
example (xs ys : List Nat) : sumItems (xs ++ ys) = sumItems xs + sumItems ys := sumItems_append xs ys
example (xs : List Nat) : 0 <= sumItems xs := sumItems_nonneg xs

end JapanTaxLaw.EnumRefsAndOperatorsTests
