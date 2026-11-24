import JapanTaxLaw.OldLifeInsurancePremiumDeductionMid

/-!
# OldLifeInsurancePremiumDeductionMid spec — 中段計算式の独立定式
Sources (pinned): law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002.
Independent restatement: 15000 + (total-15000)/2 を total/2 + 7500 に変形。
-/

namespace JapanTaxLaw.OldLifeInsurancePremiumDeductionMid

def specDeduction (t : Nat) : Nat := t / 2 + 7500

example : specDeduction 16000 = 15500 := by decide
example : specDeduction 40000 = 27500 := by decide

def agreeOldLifeInsurancePremiumDeductionMid : Bool :=
  [15000, 15001, 16000, 25000, 39999, 40000].all fun t => deduction t == specDeduction t

example : agreeOldLifeInsurancePremiumDeductionMid = true := by decide

end JapanTaxLaw.OldLifeInsurancePremiumDeductionMid
