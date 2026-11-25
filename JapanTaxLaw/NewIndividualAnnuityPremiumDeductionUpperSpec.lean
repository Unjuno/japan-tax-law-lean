import JapanTaxLaw.NewIndividualAnnuityPremiumDeductionUpper

/-!
# NewIndividualAnnuityPremiumDeductionUpper spec — 上段計算式の独立定式
Sources (pinned): law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002.
Independent restatement: 22000 + (total-32000)/4 を total/4 + 14000 に変形。
-/

namespace JapanTaxLaw.NewIndividualAnnuityPremiumDeductionUpper

def specDeduction (t : Nat) : Nat := t / 4 + 14000

example : specDeduction 36000 = 23000 := by decide
example : specDeduction 56000 = 28000 := by decide

def agreeNewIndividualAnnuityPremiumDeductionUpper : Bool :=
  [32000, 32001, 36000, 40000, 55999, 56000].all fun t => deduction t == specDeduction t

example : agreeNewIndividualAnnuityPremiumDeductionUpper = true := by decide

end JapanTaxLaw.NewIndividualAnnuityPremiumDeductionUpper
