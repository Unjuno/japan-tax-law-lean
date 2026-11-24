import JapanTaxLaw.PrescribedTimesTwoSpec

/-
# PrescribedTimesTwoTests — kernel-decided checks for 沖縄復帰特例省令 art.26（二回）

All checks are closed Nat/Bool expressions discharged by `rfl` / `by decide`,
or theorem applications. Coverage: the pinned count, zero, one, two, three,
a Nat identity, and impl/spec agreement.
-/

namespace JapanTaxLaw.PrescribedTimesTwo

-- (a) pinned statutory value: 二回 = 2.
example : prescribedTimes = 2 := rfl

-- (b) zero and one do not qualify.
example : isPrescribedCount 0 = false := by decide
example : isPrescribedCount 1 = false := by decide

-- (c) exactly two qualifies.
example : isPrescribedCount 2 = true := by decide

-- (d) three does not qualify.
example : isPrescribedCount 3 = false := by decide

-- (e) Nat identity / saturation at the count.
example : 2 + 0 = 2 := by decide

-- (f) kernel-decided impl/spec agreement at boundary points.
example : isPrescribedCount 2 = specIsPrescribedCount 2 := by decide
example : isPrescribedCount 1 = specIsPrescribedCount 1 := by decide
example : isPrescribedCount 3 = specIsPrescribedCount 3 := by decide

-- (g) universal theorem applied to an arbitrary count.
example (x : Nat) : isPrescribedCount x = specIsPrescribedCount x := agree_prescribed_count x

-- (h) independent spec value is the same count.
example : specTimes = 2 := by decide

end JapanTaxLaw.PrescribedTimesTwo
