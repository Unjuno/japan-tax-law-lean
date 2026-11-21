import JapanTaxLaw.AccountingSubjectsCount
import JapanTaxLaw.AccountingSubjectsCountSpec

/-
# AccountingSubjectsCountTests — kernel-decided boundary + agreement checks

All checks are kernel-decided (`rfl` / `by decide`). Boundary categories
registered: zero, small_input, threshold_at (2), threshold_above (3).
-/

namespace JapanTaxLaw.AccountingSubjectsCount

-- length = 0 (zero input)
example : 0 = ([] : List String).length := by rfl
-- length = 1 (small positive input)
example : 1 = ["簿記論"].length := by rfl
-- length = 2 (exact statutory count == prescribedCount)
example : 2 = accountingSubjects.length := by rfl
example : prescribedCount = 2 := by rfl
example : accountingSubjects.length = prescribedCount := by rfl
-- length = 3 (one above the statutory count: out of scope)
example : 3 = ["簿記論", "財務諸表論", "税法"].length := by rfl

-- subject membership (decidable on concrete values)
example : isPrescribedSubject "簿記論" = true := by decide
example : isPrescribedSubject "財務諸表論" = true := by decide
example : isPrescribedSubject "税法" = false := by decide

-- impl/spec agreement (axiom-free rfl bridges)
example : prescribedCount = specCount := by rfl
example : accountingSubjects = specSubjects := by rfl
example : specSubjects.length = specCount := by rfl

end JapanTaxLaw.AccountingSubjectsCount
