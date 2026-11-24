import JapanTaxLaw.CertificationIssuanceDeadlineFifteenDaysSpec

/-
# CertificationIssuanceDeadlineFifteenDaysTests — kernel-decided checks for 特定国等証明書発給省令 art.2(4)

Closed Nat/Bool expressions discharged by `rfl` / `by decide`, or theorem
applications. Coverage: the pinned deadline, zero, small values, the boundary,
one over, a Nat identity, and impl/spec agreement.
-/

namespace JapanTaxLaw.CertificationIssuanceDeadlineFifteenDays

-- (a) pinned statutory value: 十五日 = 15.
example : issuanceDeadlineDays = 15 := rfl

-- (b) zero and small day counts qualify.
example : withinIssuanceDeadline 0 = true := by decide
example : withinIssuanceDeadline 14 = true := by decide

-- (c) 以内 is inclusive: exactly fifteen days qualifies.
example : withinIssuanceDeadline 15 = true := by decide

-- (d) sixteen days exceeds the deadline.
example : withinIssuanceDeadline 16 = false := by decide

-- (e) Nat identity at the deadline.
example : 15 + 0 = 15 := by decide

-- (f) kernel-decided impl/spec agreement at boundary points.
example : withinIssuanceDeadline 0 = specWithinDeadline 0 := by decide
example : withinIssuanceDeadline 15 = specWithinDeadline 15 := by decide
example : withinIssuanceDeadline 16 = specWithinDeadline 16 := by decide

-- (g) universal theorem applied to an arbitrary day count.
example (x : Nat) : withinIssuanceDeadline x = specWithinDeadline x := agree_issuance_deadline x

-- (h) independent spec constant.
example : specDeadlineDays = 15 := rfl

end JapanTaxLaw.CertificationIssuanceDeadlineFifteenDays
