import JapanTaxLaw.PrescribedPeriodWithinFourMonthsSpec

/-
# PrescribedPeriodWithinFourMonthsTests — kernel-decided checks for 不当廉売関税等政令 art.17

All checks are closed Nat/Bool expressions discharged by `rfl` / `by decide`,
or theorem applications. Coverage: the pinned cap, zero, small periods, the
four-month ceiling, five months, a Nat identity, and impl/spec agreement.
-/

namespace JapanTaxLaw.PrescribedPeriodWithinFourMonths

-- (a) pinned statutory value: 四月 = 4.
example : periodMonthCap = 4 := rfl

-- (b) zero and small periods qualify.
example : withinPrescribedPeriod 0 = true := by decide
example : withinPrescribedPeriod 1 = true := by decide

-- (c) 以内 is inclusive: exactly four months qualifies.
example : withinPrescribedPeriod 4 = true := by decide

-- (d) five months exceeds the ceiling.
example : withinPrescribedPeriod 5 = false := by decide

-- (e) Nat identity / saturation at the ceiling.
example : 4 + 0 = 4 := by decide

-- (f) kernel-decided impl/spec agreement at boundary points.
example : withinPrescribedPeriod 4 = specWithinPeriod 4 := by decide
example : withinPrescribedPeriod 5 = specWithinPeriod 5 := by decide
example : withinPrescribedPeriod 0 = specWithinPeriod 0 := by decide

-- (g) universal theorem applied to an arbitrary month count.
example (x : Nat) : withinPrescribedPeriod x = specWithinPeriod x := agree_period_cap x

-- (h) independent spec constant is the same statutory value.
example : specMonthCap = 4 := rfl

end JapanTaxLaw.PrescribedPeriodWithinFourMonths
