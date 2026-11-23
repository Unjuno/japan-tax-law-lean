import JapanTaxLaw.CommitteeTermTwoYearsSpec

/-
# CommitteeTermTwoYearsTests — kernel-decided checks for 国税審議会令 art.4（二年）

All checks are closed Nat/Bool expressions discharged by `rfl` / `by decide`,
or theorem applications. Coverage: the pinned value, zero, a small positive
input, both sides of the two-year term, a Nat identity at the term, and
impl/spec agreement at boundary points.
-/

namespace JapanTaxLaw.CommitteeTermTwoYears

-- (a) pinned statutory value: 二年 = 2.
example : committeeTermYears = 2 := rfl

-- (b) zero and one year are not the statutory term.
example : isCommitteeTerm 0 = false := by decide
example : isCommitteeTerm 1 = false := by decide

-- (c) two years is the term.
example : isCommitteeTerm 2 = true := by decide

-- (d) three years is not the term.
example : isCommitteeTerm 3 = false := by decide

-- (e) Nat identity / saturation at the term.
example : 2 + 0 = 2 := by decide

-- (f) kernel-decided impl/spec agreement at boundary points.
example : isCommitteeTerm 2 = specIsCommitteeTerm 2 := by decide
example : isCommitteeTerm 1 = specIsCommitteeTerm 1 := by decide
example : isCommitteeTerm 0 = specIsCommitteeTerm 0 := by decide

-- (g) universal theorem applied to an arbitrary term.
example (x : Nat) : isCommitteeTerm x = specIsCommitteeTerm x := agree_committee_term x

-- (h) independent spec constant is the same statutory value.
example : specCommitteeTermYears = 2 := rfl

end JapanTaxLaw.CommitteeTermTwoYears
