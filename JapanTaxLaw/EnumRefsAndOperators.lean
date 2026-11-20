/-\!
# EnumRefsAndOperators — 範囲列挙・同条項参照・百円未満切捨て・合算（1175 units）

1175 dependency-ready units in four §3 families:

A) 範囲列挙 (644): 一及び二 / 一から三まで / 一、二 — ordinal ranges/enumerations.
B) 同条項参照 (419): 同項の規定による検査 etc. — short-form cross reference.
C) 百円未満切捨て (53): round down to a multiple of 100.
D) 合算額 (59): 次の各号によって算定した額の合算額とする — summation of items.

Kernel proofs: interval/enumeration membership, reference resolution identity,
round-down divisibility/bounds, and fold-sum algebra. The referenced text,
amounts and enumerated items are NOT MODELLED.
-/
namespace JapanTaxLaw.EnumRefsAndOperators

-- A) 範囲列挙
def inRange (lo hi x : Nat) : Bool := decide (lo <= x ∧ x <= hi)

theorem inRange_left (lo hi : Nat) (h : lo <= hi) : inRange lo hi lo = true := by
  simp [inRange, h]

theorem inRange_right (lo hi : Nat) (h : lo <= hi) : inRange lo hi hi = true := by
  simp [inRange, h]

theorem inRange_of_bounds (lo hi x : Nat) (h1 : lo <= x) (h2 : x <= hi) :
    inRange lo hi x = true := by simp [inRange, h1, h2]

theorem inRange_outside_below (lo hi x : Nat) (h : x < lo) : inRange lo hi x = false := by
  simp [inRange]; omega

theorem inRange_outside_above (lo hi x : Nat) (h : hi < x) : inRange lo hi x = false := by
  simp [inRange]; omega

def inEnum (xs : List Nat) (x : Nat) : Bool := decide (x ∈ xs)

theorem inEnum_head (x : Nat) (xs : List Nat) : inEnum (x :: xs) x = true := by
  simp [inEnum]

theorem inEnum_of_mem (xs : List Nat) (x : Nat) (h : x ∈ xs) : inEnum xs x = true := by
  simp [inEnum, h]

theorem inEnum_empty (x : Nat) : inEnum [] x = false := by simp [inEnum]

-- B) 同条項参照（参照先は呼出側が与える）
def resolveRef (target : Nat) : Nat := target

theorem resolveRef_identity (t : Nat) : resolveRef t = t := by rfl

-- C) 百円未満切捨て
def roundDown100 (x : Nat) : Nat := x - x % 100

theorem roundDown100_le (x : Nat) : roundDown100 x <= x := by
  unfold roundDown100; omega

theorem roundDown100_divisible (x : Nat) : roundDown100 x % 100 = 0 := by
  unfold roundDown100; omega

theorem roundDown100_id (x : Nat) (h : x % 100 = 0) : roundDown100 x = x := by
  unfold roundDown100; omega

theorem roundDown100_zero : roundDown100 0 = 0 := by decide

-- D) 合算額
def sumItems : List Nat -> Nat
  | [] => 0
  | x :: xs => x + sumItems xs

theorem sumItems_nil : sumItems [] = 0 := by rfl
theorem sumItems_cons (x : Nat) (xs : List Nat) : sumItems (x :: xs) = x + sumItems xs := by rfl

theorem sumItems_append (xs ys : List Nat) : sumItems (xs ++ ys) = sumItems xs + sumItems ys := by
  induction xs with
  | nil => simp [sumItems]
  | cons a xs ih => simp [sumItems, ih, Nat.add_assoc]

theorem sumItems_nonneg (xs : List Nat) : 0 <= sumItems xs := Nat.zero_le _

end JapanTaxLaw.EnumRefsAndOperators
