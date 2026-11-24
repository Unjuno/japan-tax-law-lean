import JapanTaxLaw.DeemingProvisionalDutySpec

/-! Exhaustive Bool-domain tests for the deeming norm. -/
namespace JapanTaxLaw.DeemingProvisionalDuty

example : deemPaid true = true := by rfl
example : deemPaid false = false := by rfl
example : specDeem true = true := by rfl
example : specDeem false = false := by rfl

example : specDeem true = deemPaid true := agree_spec_impl true
example : specDeem false = deemPaid false := agree_spec_impl false

end JapanTaxLaw.DeemingProvisionalDuty
