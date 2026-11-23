import JapanTaxLaw.TreatyJPUSShippingTransferPricing
import JapanTaxLaw.TreatyJPUSShippingTransferPricingSpec

/-!
# TreatyJPUSShippingTransferPricingTests — 第八条・第九条
-/
namespace JapanTaxLaw.TreatyJPUSShippingTransferPricingTests
open JapanTaxLaw.TreatyJPUSShippingTransferPricing

theorem container_spec (u : Bool) : containerSourceTax u = JapanTaxLaw.TreatyJPUSShippingTransferPricingSpec.containerSourceTaxSpec u := by rfl
theorem tp_spec (r n : Bool) : transferPricingAdjustment r n = JapanTaxLaw.TreatyJPUSShippingTransferPricingSpec.transferPricingAdjustmentSpec r n := by rfl
theorem years_spec (y : Nat) : adjustmentWithinSevenYears y = JapanTaxLaw.TreatyJPUSShippingTransferPricingSpec.adjustmentWithinSevenYearsSpec y := by
  unfold adjustmentWithinSevenYears JapanTaxLaw.TreatyJPUSShippingTransferPricingSpec.adjustmentWithinSevenYearsSpec
  by_cases h : y <= 7 <;> simp [h]
example : shippingProfitsSourceTax = false := shipping_residence_only
example : containerSourceTax true = true := container_other_only_use_source_tax
example : containerSourceTax false = false := container_international_no_source_tax
example : transferPricingAdjustment true true = true := tp_adjustment_applies
example : transferPricingAdjustment false true = false := tp_no_relation_no_adjustment
example : adjustmentWithinSevenYears 7 = true := seven_years_ok
example : adjustmentWithinSevenYears 8 = false := eight_years_barred
example : shippingTransferPricingDeclared = true := shipping_transfer_pricing_is_declaration

end JapanTaxLaw.TreatyJPUSShippingTransferPricingTests
