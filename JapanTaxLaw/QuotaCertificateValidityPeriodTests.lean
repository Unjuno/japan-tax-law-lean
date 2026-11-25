import JapanTaxLaw.QuotaCertificateValidityPeriodSpec

/-
# QuotaCertificateValidityPeriodTests — kernel-decided checks for 経済連携協定関税割当政令 art.2(8)

All checks are closed Nat/Bool expressions discharged by `rfl` / `by decide`,
or theorem applications.
-/

namespace JapanTaxLaw.QuotaCertificateValidityPeriod

-- (a) inclusive end day, for several end indices.
example : withinValidity 0 0 = true := by decide
example : withinValidity 3 3 = true := by decide
example : withinValidity 2 5 = true := by decide

-- (b) the day after the end is outside.
example : withinValidity 1 0 = false := by decide
example : withinValidity 6 5 = false := by decide

-- (c) kernel-decided impl/spec agreement.
example : withinValidity 0 0 = specWithinValidity 0 0 := by decide
example : withinValidity 1 0 = specWithinValidity 1 0 := by decide
example : withinValidity 2 5 = specWithinValidity 2 5 := by decide

-- (d) universal theorem applied to arbitrary indices.
example (d e : Nat) : withinValidity d e = specWithinValidity d e := agree_validity_cutoff d e

end JapanTaxLaw.QuotaCertificateValidityPeriod
