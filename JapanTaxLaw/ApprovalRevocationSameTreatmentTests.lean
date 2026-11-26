import JapanTaxLaw.ApprovalRevocationSameTreatmentSpec

/-
# ApprovalRevocationSameTreatmentTests — kernel-decided boundary checks
-/

namespace JapanTaxLaw.ApprovalRevocationSameTreatment

example : asSameTreatment 0 = 1 := by decide
example : asSameTreatment 1 = 1 := by decide
example : asSameTreatment 2 = 2 := by decide
example : asSameTreatment 3 = 3 := by decide
example : specAsSameTreatment 0 = 1 := by decide
example : specAsSameTreatment 1 = 1 := by decide
example : asSameTreatment 0 = specAsSameTreatment 0 := by decide
example : asSameTreatment 1 = specAsSameTreatment 1 := by decide
example (x : Nat) : asSameTreatment x = specAsSameTreatment x := agree_as_same_treatment x
example : asSameTreatment 9 = specAsSameTreatment 9 := agree_as_same_treatment 9

end JapanTaxLaw.ApprovalRevocationSameTreatment
