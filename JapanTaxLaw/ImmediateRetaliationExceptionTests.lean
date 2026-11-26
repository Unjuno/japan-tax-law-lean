import JapanTaxLaw.ImmediateRetaliationExceptionSpec

/-
# ImmediateRetaliationExceptionTests — kernel-decided boundary checks
-/

namespace JapanTaxLaw.ImmediateRetaliationException

example : asException 0 = 1 := by decide
example : asException 1 = 1 := by decide
example : asException 2 = 2 := by decide
example : asException 3 = 3 := by decide
example : specAsException 0 = 1 := by decide
example : specAsException 1 = 1 := by decide
example : asException 0 = specAsException 0 := by decide
example : asException 1 = specAsException 1 := by decide
example (x : Nat) : asException x = specAsException x := agree_as_exception x
example : asException 9 = specAsException 9 := agree_as_exception 9

end JapanTaxLaw.ImmediateRetaliationException
