import JapanTaxLaw.CustomsTariffSupplArt1Heisei1EnforcementDateSpec

/-!
# CustomsTariffSupplArt1Heisei1EnforcementDateTests — kernel-checked checks

Verifies REFERENCE 「この法律は、平成元年四月一日から施行する。」: 平成元年四月一日 enforcement date and boundaries.
-/

namespace JapanTaxLaw.CustomsTariffSupplArt1Heisei1EnforcementDate

example : enforcementDate.year = 1 := enforcement_year_is_one
example : enforcementDate.month = 4 := enforcement_month_is_four
example : enforcementDate.day = 1 := enforcement_day_is_one
example : inForce enforcementDate := in_force_on_enforcement_date
example : inForce ⟨2, 1, 1⟩ := in_force_after
example : ¬ inForce ⟨1, 3, 1⟩ := not_in_force_before
example : SpecEnforcementDate enforcementDate := enforcement_satisfies_spec

end JapanTaxLaw.CustomsTariffSupplArt1Heisei1EnforcementDate
