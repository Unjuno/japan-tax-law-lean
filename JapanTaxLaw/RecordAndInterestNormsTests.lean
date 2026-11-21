import JapanTaxLaw.RecordAndInterestNorms
import JapanTaxLaw.RecordAndInterestNormsSpec

/-!
# RecordAndInterestNormsTests — 記録・利子
-/
namespace JapanTaxLaw.RecordAndInterestNormsTests

open JapanTaxLaw.RecordAndInterestNorms

theorem substitute_spec (r : Bool) :
    substituteSubmission r = JapanTaxLaw.RecordAndInterestNormsSpec.substituteSpec r := by rfl

theorem recorded_spec (f : List Bool) :
    allRecorded f = JapanTaxLaw.RecordAndInterestNormsSpec.allRecordedSpec f := by rfl

theorem interest_spec (p r n : Nat) :
    interest p r n = JapanTaxLaw.RecordAndInterestNormsSpec.interestSpec p r n := by rfl

example : substituteSubmission true = true := substitute_when_recorded
example : substituteSubmission false = false := no_substitute_when_unrecorded
example : allRecorded [] = true := all_recorded_empty
example : allRecorded [true, true] = true := all_recorded_all_true
example : allRecorded [true, false] = false := all_recorded_with_false
example (r p : Nat) : interest 0 r p = 0 := interest_zero_principal r p
example (pr r : Nat) : interest pr r 0 = 0 := interest_zero_periods pr r
example (r : Nat) : simpleInterest 0 r = 0 := simple_zero r
example : recordDeclared = true := record_is_declaration

end JapanTaxLaw.RecordAndInterestNormsTests
