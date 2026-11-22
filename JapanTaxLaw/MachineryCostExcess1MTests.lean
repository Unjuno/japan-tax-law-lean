import JapanTaxLaw.MachineryCostExcess1MSpec

/-
# MachineryCostExcess1MTests — kernel-decided checks for 沖縄振興省令 art.4(1)(3)イ

All checks are closed Nat/Bool expressions discharged by `rfl` / `by decide`,
or theorem applications. Coverage: the pinned value, zero, a small positive
input, both sides of the 百万円 floor, a Nat identity at the floor, and
impl/spec agreement at boundary points.
-/

namespace JapanTaxLaw.MachineryCostExcess1M

-- (a) pinned statutory value: 百万円 = 1,000,000.
example : costFloor = 1_000_000 := rfl

-- (b) zero and small positive totals do not satisfy the condition.
example : exceedsCostFloor 0 = false := by decide
example : exceedsCostFloor 1 = false := by decide

-- (c) just below the floor fails.
example : exceedsCostFloor 999_999 = false := by decide

-- (d) 超える is exclusive: exactly 百万円 fails.
example : exceedsCostFloor 1_000_000 = false := by decide

-- (e) one yen above the floor qualifies.
example : exceedsCostFloor 1_000_001 = true := by decide

-- (f) Nat identity / saturation at the floor.
example : 1_000_000 + 0 = 1_000_000 := by decide

-- (g) kernel-decided impl/spec agreement at boundary points.
example : exceedsCostFloor 1_000_000 = specExceedsCost 1_000_000 := by decide
example : exceedsCostFloor 1_000_001 = specExceedsCost 1_000_001 := by decide
example : exceedsCostFloor 0 = specExceedsCost 0 := by decide

-- (h) universal theorem applied to an arbitrary total.
example (x : Nat) : exceedsCostFloor x = specExceedsCost x := agree_cost_floor x

-- (i) independent spec constant is the same statutory value.
example : specCostFloor = 1_000_000 := rfl

end JapanTaxLaw.MachineryCostExcess1M
