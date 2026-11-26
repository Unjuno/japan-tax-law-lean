import JapanTaxLaw.QuotaApplicationCopyCountOneSpec

/-
# QuotaApplicationCopyCountOneTests — kernel-decided checks for とうもろこし関税割当省令 art.1

Closed Nat/Bool expressions discharged by `by decide`, or theorem applications.
-/

namespace JapanTaxLaw.QuotaApplicationCopyCountOne

example : submissionCopies = 1 := rfl
example : isPrescribedCopies 0 = false := by decide
example : isPrescribedCopies 1 = true := by decide
example : isPrescribedCopies 2 = false := by decide
example : isPrescribedCopies 1 = specIsPrescribedCopies 1 := by decide

end JapanTaxLaw.QuotaApplicationCopyCountOne
