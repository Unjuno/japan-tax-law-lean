import JapanTaxLaw.QuakeReconstructionExpenseFloor1MSpec

/-
# QuakeReconstructionExpenseFloor1MTests — kernel-decided checks for 東日本大震災特例法 art.38-2(2)(4)イ

All checks are closed Nat/Bool expressions discharged by `rfl` / `by decide`,
or theorem applications. Coverage: the pinned value, zero, a small positive
input, both sides of the 百万円 floor, a Nat identity at the floor, and
impl/spec agreement at boundary points.
-/

namespace JapanTaxLaw.QuakeReconstructionExpenseFloor1M

-- (a) pinned statutory value: 百万円 = 1,000,000.
example : expenseFloor = 1_000_000 := rfl

-- (b) zero and small positive expenses do not satisfy the condition.
example : meetsExpenseFloor 0 = false := by decide
example : meetsExpenseFloor 1 = false := by decide

-- (c) just below the floor fails.
example : meetsExpenseFloor 999_999 = false := by decide

-- (d) 以上 is inclusive: exactly 百万円 qualifies.
example : meetsExpenseFloor 1_000_000 = true := by decide

-- (e) one yen above the floor qualifies.
example : meetsExpenseFloor 1_000_001 = true := by decide

-- (f) Nat identity / saturation at the floor.
example : 1_000_000 + 0 = 1_000_000 := by decide

-- (g) kernel-decided impl/spec agreement at boundary points.
example : meetsExpenseFloor 1_000_000 = specMeetsExpense 1_000_000 := by decide
example : meetsExpenseFloor 999_999 = specMeetsExpense 999_999 := by decide
example : meetsExpenseFloor 0 = specMeetsExpense 0 := by decide

-- (h) universal theorem applied to an arbitrary amount.
example (x : Nat) : meetsExpenseFloor x = specMeetsExpense x := agree_expense_floor x

-- (i) independent spec constant is the same statutory value.
example : specExpenseFloor = 1_000_000 := rfl

end JapanTaxLaw.QuakeReconstructionExpenseFloor1M
