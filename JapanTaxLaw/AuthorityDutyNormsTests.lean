import JapanTaxLaw.AuthorityDutyNorms
import JapanTaxLaw.AuthorityDutyNormsSpec

/-!
# AuthorityDutyNormsTests — 条件的職権義務
-/
namespace JapanTaxLaw.AuthorityDutyNormsTests
open JapanTaxLaw.AuthorityDutyNorms

theorem duty_spec (t : Bool) : authorityDuty t = JapanTaxLaw.AuthorityDutyNormsSpec.authorityDutySpec t := by rfl
theorem implies_spec (d a : Bool) : dutyImpliesAct d a = JapanTaxLaw.AuthorityDutyNormsSpec.dutyImpliesActSpec d a := by rfl
theorem all_spec (a b : Bool) : allDuties a b = JapanTaxLaw.AuthorityDutyNormsSpec.allDutiesSpec a b := by rfl
theorem noduty_spec (t : Bool) : noDuty t = JapanTaxLaw.AuthorityDutyNormsSpec.noDutySpec t := by rfl
example : authorityDuty true = true := duty_when_triggered
example : authorityDuty false = false := no_duty_without_trigger
example (d a : Bool) (hd : d = true) (hi : dutyImpliesAct d a = true) : a = true := duty_yields_act d a hd hi
example : allDuties true true = true := all_both
example : allDuties true false = false := all_one_missing
example : noDuty false = true := no_duty_when_absent
example (t : Bool) : ¬ (authorityDuty t = true ∧ noDuty t = true) := duty_trigger_exclusive t
example : authorityDutyDeclared = true := authority_duty_is_declaration

end JapanTaxLaw.AuthorityDutyNormsTests
