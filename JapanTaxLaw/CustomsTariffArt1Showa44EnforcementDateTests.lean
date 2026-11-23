import JapanTaxLaw.CustomsTariffArt1Showa44EnforcementDateSpec

/-!
# CustomsTariffArt1Showa44EnforcementDateTests — kernel-checked checks for 附則第一条

Verifies the enforcement date 「この法律は、昭和四十四年四月一日から施行する。」(昭和44年4月1日)
in-force predicate: in force on and after that date, not before; universal agreement
with the flat independent spec.
-/

namespace JapanTaxLaw.CustomsTariffArt1Showa44EnforcementDate

example : enforcementDate = ⟨44, 4, 1⟩ := enforcement_date_components
example : inForce ⟨44, 4, 1⟩ := in_force_at_date
example : inForce ⟨44, 4, 2⟩ := by
  unfold inForce leDate enforcementDate
  decide
example : inForce ⟨45, 1, 1⟩ := by
  unfold inForce leDate enforcementDate
  decide
example : ¬ inForce ⟨43, 12, 31⟩ := not_in_force_before_year
example : ¬ inForce ⟨44, 3, 30⟩ := not_in_force_before_month
example : ¬ inForce ⟨44, 4, 0⟩ := by
  unfold inForce leDate enforcementDate
  decide
example (d : Date) : inForce d ↔ SpecInForce d := agree_in_force d

end JapanTaxLaw.CustomsTariffArt1Showa44EnforcementDate
