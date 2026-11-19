import JapanTaxLaw.GasolineDeduction

/-!
# GasolineDeduction spec — 揮発油税法施行令 art.2 の独立整数定式

Sources (pinned): law 332CO0000000057, revision 332CO0000000057_20250401_507CO0000000006.
Article Num 2.
Independent restatement: 「百分の一・三五」= 1.35/100 = 135/10000.
控除数量 = quantity × 135 / 10000 (floor).
-/

namespace JapanTaxLaw.GasolineDeduction

def specDeduction (quantity : Nat) : Nat := quantity * 135 / 10000

example : specDeduction 10000 = 135 := by decide
example : specDeduction 1000 = 13 := by decide
example : specDeduction 0 = 0 := by decide

def agreeGasolineDeduction : Bool :=
  [0, 1, 100, 1000, 10000, 999999].all fun q => deduction q == specDeduction q

example : agreeGasolineDeduction = true := by decide

end JapanTaxLaw.GasolineDeduction
