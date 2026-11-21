import JapanTaxLaw.CustomsTaxRetentionPeriodTier1Spec

/-!
# CustomsTaxRetentionPeriodTier1Tests — kernel-checked checks for 関税法 附則第八条(3)1
-/

namespace JapanTaxLaw.CustomsTaxRetentionPeriodTier1

open JapanTaxLaw.TaxFinance

example : taxAmountCeilingYen = 100_000 := rfl
example : retentionMonths = 2 := period_decoded
example : withinTier 100_000 := at_ceiling
example : ¬ withinTier 100_001 := above_ceiling
example (t : Money) : withinTier t ↔ specWithinTier t := agree_within_tier t

end JapanTaxLaw.CustomsTaxRetentionPeriodTier1
