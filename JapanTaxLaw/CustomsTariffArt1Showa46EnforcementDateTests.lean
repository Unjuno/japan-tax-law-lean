import JapanTaxLaw.CustomsTariffArt1Showa46EnforcementDateSpec

/-!
# CustomsTariffArt1Showa46EnforcementDateTests — kernel-checked checks for 附則第一条

Verifies the enforcement date 「この法律は、昭和四十六年一月一日から施行する。」 in-force predicate: in force on and
after that date, not before; universal agreement with the flat independent spec.
-/

namespace JapanTaxLaw.CustomsTariffArt1Showa46EnforcementDate

example : enforcementDate = ⟨46, 1, 1⟩ := enforcement_date_components
example : inForce ⟨46, 1, 1⟩ := in_force_at_date
example : inForce ⟨46, 1, 2⟩ := by
  unfold inForce leDate enforcementDate
  decide
example : inForce ⟨47, 1, 1⟩ := by
  unfold inForce leDate enforcementDate
  decide
example : ¬ inForce ⟨45, 12, 31⟩ := not_in_force_before_year
example : ¬ inForce ⟨46, 0, 28⟩ := not_in_force_before_month
example (d : Date) : inForce d ↔ SpecInForce d := agree_in_force d

end JapanTaxLaw.CustomsTariffArt1Showa46EnforcementDate
