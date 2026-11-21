import JapanTaxLaw.CustomsBondedFacilityLicenseFeeItem3Spec

/-!
# CustomsBondedFacilityLicenseFeeItem3Tests — kernel-checked checks for 税関関係手数料令 第二条(1)第三号

All checks are `by decide` / theorem application, kernel-checked.
-/

namespace JapanTaxLaw.CustomsBondedFacilityLicenseFeeItem3

open JapanTaxLaw.TaxFinance

example : generalFeeYen = 16_400 := rfl
example : designatedFeeYen = 16_200 := rfl
example : designatedFeeYen < generalFeeYen := designated_lt_general
example : generalFeeYen = designatedFeeYen + specDifferenceYen := agree_fee_difference

end JapanTaxLaw.CustomsBondedFacilityLicenseFeeItem3
