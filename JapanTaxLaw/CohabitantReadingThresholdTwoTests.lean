import JapanTaxLaw.CohabitantReadingThresholdTwoSpec

/-
# CohabitantReadingThresholdTwoTests — kernel-decided checks for 能登半島地震臨時特例法等施行令 art.2(2)

Closed Nat/Bool expressions discharged by `rfl` / `by decide`, or theorem
applications. Coverage: the pinned floor, zero, one, two, three, a Nat
identity, and impl/spec agreement.
-/

namespace JapanTaxLaw.CohabitantReadingThresholdTwo

-- (a) pinned statutory value: 二人 = 2.
example : cohabitantFloor = 2 := rfl

-- (b) zero and one do not satisfy the count.
example : appliesReading 0 = false := by decide
example : appliesReading 1 = false := by decide

-- (c) 以上 is inclusive: exactly two qualifies.
example : appliesReading 2 = true := by decide

-- (d) three qualifies.
example : appliesReading 3 = true := by decide

-- (e) Nat identity at the floor.
example : 2 + 0 = 2 := by decide

-- (f) kernel-decided impl/spec agreement at boundaries.
example : appliesReading 0 = specAppliesReading 0 := by decide
example : appliesReading 2 = specAppliesReading 2 := by decide
example : appliesReading 3 = specAppliesReading 3 := by decide

-- (g) universal theorem applied to an arbitrary count.
example (x : Nat) : appliesReading x = specAppliesReading x := agree_cohabitant_floor x

-- (h) independent spec constant.
example : specCohabitantFloor = 2 := rfl

end JapanTaxLaw.CohabitantReadingThresholdTwo
