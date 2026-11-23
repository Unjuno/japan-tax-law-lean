import JapanTaxLaw.TreatyJPUSPensions
import JapanTaxLaw.TreatyJPUSPensionsSpec

/-!
# TreatyJPUSPensionsTests — 第十七条（年金）
-/
namespace JapanTaxLaw.TreatyJPUSPensionsTests
open JapanTaxLaw.TreatyJPUSPensions

theorem alimony_spec (d : Bool) : alimonyTaxable d = JapanTaxLaw.TreatyJPUSPensionsSpec.alimonyTaxableSpec d := by rfl
theorem payer_taxes_spec (d : Bool) : payerStateTaxes d = JapanTaxLaw.TreatyJPUSPensionsSpec.payerStateTaxesSpec d := by rfl
example : sourceTaxOnPension = false := pension_no_source_tax
example : alimonyTaxable true = 1 := deductible_alimony_payer_only
example : alimonyTaxable false = 0 := nondeductible_alimony_neither
example : payerStateTaxes false = false := nondeductible_no_payer_tax
example : payerStateTaxes true = true := deductible_payer_tax
example : pensionsDeclared = true := pensions_is_declaration

end JapanTaxLaw.TreatyJPUSPensionsTests
