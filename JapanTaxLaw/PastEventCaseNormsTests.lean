import JapanTaxLaw.PastEventCaseNorms
import JapanTaxLaw.PastEventCaseNormsSpec

/-!
# PastEventCaseNormsTests — 過去事象の場合
-/
namespace JapanTaxLaw.PastEventCaseNormsTests
open JapanTaxLaw.PastEventCaseNorms

theorem case_spec (p : Bool) : pastEventCase p = JapanTaxLaw.PastEventCaseNormsSpec.pastEventCaseSpec p := by rfl
theorem nocase_spec (p : Bool) : noPastEvent p = JapanTaxLaw.PastEventCaseNormsSpec.noPastEventSpec p := by rfl
theorem any_spec (a b : Bool) : anyPastEvent a b = JapanTaxLaw.PastEventCaseNormsSpec.anyPastEventSpec a b := by rfl
theorem all_spec (a b : Bool) : allPastEvents a b = JapanTaxLaw.PastEventCaseNormsSpec.allPastEventsSpec a b := by rfl
example : pastEventCase true = true := case_when_occurred
example : pastEventCase false = false := case_when_absent
example : noPastEvent false = true := no_event_when_absent
example : noPastEvent true = false := no_event_fails_when_occurred
example (p : Bool) : ¬ (pastEventCase p = true ∧ noPastEvent p = true) := occurred_exclusive p
example : anyPastEvent true false = true := any_first
example : anyPastEvent false false = false := any_none
example : allPastEvents true true = true := all_both
example : allPastEvents true false = false := all_one_absent
example : pastEventCaseDeclared = true := past_event_case_is_declaration

end JapanTaxLaw.PastEventCaseNormsTests
