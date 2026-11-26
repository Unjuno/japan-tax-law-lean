import JapanTaxLaw.SubstituteMemberResidualTermSpec

/-
# SubstituteMemberResidualTermTests — kernel-decided boundary checks
-/

namespace JapanTaxLaw.SubstituteMemberResidualTerm

example : substituteTerm 0 = 0 := by decide
example : substituteTerm 1 = 1 := by decide
example : substituteTerm 2 = 2 := by decide
example : substituteTerm 3 = 3 := by decide
example : specSubstituteTerm 0 = 0 := by decide
example : specSubstituteTerm 1 = 1 := by decide
example : substituteTerm 0 = specSubstituteTerm 0 := by decide
example : substituteTerm 2 = specSubstituteTerm 2 := by decide
example (x : Nat) : substituteTerm x = specSubstituteTerm x := agree_substitute_term x
example : substituteTerm 11 = specSubstituteTerm 11 := agree_substitute_term 11

end JapanTaxLaw.SubstituteMemberResidualTerm
