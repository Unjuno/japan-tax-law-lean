import JapanTaxLaw.LocalTaxArt734AmountTier1Spec

/-!
# LocalTaxArt734AmountTier1Tests — kernel-checked checks for 地方税法 第七百三十四条(3)
-/

namespace JapanTaxLaw.LocalTaxArt734AmountTier1

open JapanTaxLaw.TaxFinance

example : baseAmountYen = 120_000 := rfl
example : alternativeAmountYen = 140_000 := rfl
example : baseAmountYen < alternativeAmountYen := alternative_gt_base
example : alternativeAmountYen = baseAmountYen + specDifferenceYen := agree_amount_difference

end JapanTaxLaw.LocalTaxArt734AmountTier1
