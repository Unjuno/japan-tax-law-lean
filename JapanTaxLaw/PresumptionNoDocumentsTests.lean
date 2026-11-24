import JapanTaxLaw.PresumptionNoDocumentsSpec

/-! Exhaustive Bool-domain tests for the presumption. -/
namespace JapanTaxLaw.PresumptionNoDocuments

example : presumeNotApplicable false = true := by rfl
example : presumeNotApplicable true = false := by rfl
example : specPresume false = true := by rfl
example : specPresume true = false := by rfl

example : specPresume false = presumeNotApplicable false := agree_spec_impl false
example : specPresume true = presumeNotApplicable true := agree_spec_impl true

end JapanTaxLaw.PresumptionNoDocuments
