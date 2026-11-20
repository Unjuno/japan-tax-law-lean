import JapanTaxLaw.CapitalOneBillionExcessSpec

/-
# CapitalOneBillionExcessTests — kernel-decided checks for 国税臨時特例法 art.7(1)(1)

Every check is a closed Nat/Bool expression discharged by `rfl` or `by decide`,
or a theorem application. Coverage: the pinned statutory value, a zero input,
a small positive input, both sides of the 十億円 boundary, a Nat identity at the
threshold, and impl/spec agreement at boundary points.
-/

namespace JapanTaxLaw.CapitalOneBillionExcess

-- (a) pinned statutory value: 十億円 = 1,000,000,000.
example : capitalBillionFloor = 1_000_000_000 := rfl

-- (b) zero input does not satisfy the condition.
example : exceedsCapitalBillion 0 = false := by decide

-- (c) small positive input below the floor; 1 is the smallest natural amount.
example : exceedsCapitalBillion 1 = false := by decide

-- (d) just below the floor (one yen short) still fails.
example : exceedsCapitalBillion 999_999_999 = false := by decide

-- (e) exactly at the floor fails (超え is strict, unlike 以上).
example : exceedsCapitalBillion 1_000_000_000 = false := by decide

-- (f) one yen above the floor qualifies.
example : exceedsCapitalBillion 1_000_000_001 = true := by decide

-- (g) Nat identity at the threshold: adding zero yen is identity.
example : 1_000_000_000 + 0 = 1_000_000_000 := by decide

-- (h) kernel-decided impl/spec agreement at the boundary points.
example : exceedsCapitalBillion 1_000_000_000 = specExceedsCapital 1_000_000_000 := by decide
example : exceedsCapitalBillion 0 = specExceedsCapital 0 := by decide

-- (i) universal theorem applied to an arbitrary amount.
example (x : Nat) : exceedsCapitalBillion x = specExceedsCapital x := agree_capital_billion x

-- (j) independent spec constant is the same statutory value.
example : specCapitalBillionFloor = 1_000_000_000 := rfl

end JapanTaxLaw.CapitalOneBillionExcess
