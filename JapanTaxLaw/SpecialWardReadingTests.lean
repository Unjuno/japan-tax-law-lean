import JapanTaxLaw.SpecialWardReadingSpec

/-
# SpecialWardReadingTests — kernel-decided boundary checks
-/

namespace JapanTaxLaw.SpecialWardReading

example : asSpecialWard 0 = 1 := by decide
example : asSpecialWard 1 = 1 := by decide
example : asSpecialWard 2 = 2 := by decide
example : asSpecialWard 3 = 3 := by decide
example : specAsSpecialWard 0 = 1 := by decide
example : specAsSpecialWard 1 = 1 := by decide
example : asSpecialWard 0 = specAsSpecialWard 0 := by decide
example : asSpecialWard 1 = specAsSpecialWard 1 := by decide
example (x : Nat) : asSpecialWard x = specAsSpecialWard x := agree_as_special_ward x
example : asSpecialWard 9 = specAsSpecialWard 9 := agree_as_special_ward 9

end JapanTaxLaw.SpecialWardReading
