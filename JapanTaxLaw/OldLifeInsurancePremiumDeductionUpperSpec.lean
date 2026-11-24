import JapanTaxLaw.OldLifeInsurancePremiumDeductionUpper

/-!
# OldLifeInsurancePremiumDeductionUpper spec — 上段計算式の独立定式
Sources (pinned): law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002.
Independent restatement: 27500 + (total-40000)/4 を total/4 + 17500 に変形。
-/

namespace JapanTaxLaw.OldLifeInsurancePremiumDeductionUpper

def specDeduction (t : Nat) : Nat := t / 4 + 17500

example : specDeduction 44000 = 28500 := by decide
example : specDeduction 70000 = 35000 := by decide

def agreeOldLifeInsurancePremiumDeductionUpper : Bool :=
  [40000, 40001, 44000, 50000, 69999, 70000].all fun t => deduction t == specDeduction t

example : agreeOldLifeInsurancePremiumDeductionUpper = true := by decide

end JapanTaxLaw.OldLifeInsurancePremiumDeductionUpper
