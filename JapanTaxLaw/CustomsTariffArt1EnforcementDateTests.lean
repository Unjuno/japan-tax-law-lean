import JapanTaxLaw.CustomsTariffArt1EnforcementDateSpec

/-!
# CustomsTariffArt1EnforcementDateTests — kernel-checked checks for 関税定率法 附則第一条

Verifies the enforcement date (昭和42年6月1日) in-force predicate: in force on
and after that date, not before; universal agreement with the flat independent spec.
-/

namespace JapanTaxLaw.CustomsTariffArt1EnforcementDate

-- The enforcement date is 昭和 42年6月1日 (derived from the needle).
example : enforcementDate = ⟨42, 6, 1⟩ := rfl

-- In force ON and AFTER the enforcement date.
example : inForce ⟨42, 6, 1⟩ := in_force_at_date
example : inForce ⟨42, 6, 2⟩ := by
  unfold inForce leDate enforcementDate
  decide
example : inForce ⟨42, 7, 1⟩ := by
  unfold inForce leDate enforcementDate
  decide
example : inForce ⟨43, 1, 1⟩ := by
  unfold inForce leDate enforcementDate
  decide

-- Not in force before the enforcement date.
example : ¬ inForce ⟨41, 12, 31⟩ := not_in_force_before_year
example : ¬ inForce ⟨42, 5, 31⟩ := not_in_force_before_month
example : ¬ inForce ⟨42, 6, 0⟩ := by
  unfold inForce leDate enforcementDate
  decide

-- Universal agreement with the independent flat spec.
example (d : Date) : inForce d ↔ SpecInForce d := agree_in_force d

end JapanTaxLaw.CustomsTariffArt1EnforcementDate
