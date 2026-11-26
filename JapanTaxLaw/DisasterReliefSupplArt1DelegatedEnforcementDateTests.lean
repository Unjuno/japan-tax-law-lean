import JapanTaxLaw.DisasterReliefSupplArt1DelegatedEnforcementDateSpec

/-!
# DisasterReliefSupplArt1DelegatedEnforcementDateTests — kernel-checked checks

Verifies DELEGATION 「この法律は、公布の日から起算して一年を超えない範囲内において政令で定める日から施行する。」: Cabinet Order target and one-year cap.
-/

namespace JapanTaxLaw.DisasterReliefSupplArt1DelegatedEnforcementDate

example : delegationTarget = DelegationTarget.cabinetOrder := target_is_cabinet_order
example : delegationTarget ≠ DelegationTarget.statute := statute_not_selected
example : maxDelayYears = 1 := cap_is_source_value
example : withinCap 1 := cap_boundary_allowed
example : withinCap 0 := zero_delay_allowed
example (h : 1 < 2) : ¬ withinCap 2 := above_cap_rejected 2 h
example : SpecTarget delegationTarget := target_satisfies_spec
example : ¬ SpecTarget DelegationTarget.statute := statute_not_satisfying
example : withinCap 1 ↔ SpecWithinCap 1 := cap_spec_agreement 1

end JapanTaxLaw.DisasterReliefSupplArt1DelegatedEnforcementDate
