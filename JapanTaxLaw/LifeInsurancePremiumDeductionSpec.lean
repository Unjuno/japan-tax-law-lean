import JapanTaxLaw.LifeInsurancePremiumDeduction

/-!
# LifeInsurancePremiumDeduction spec — 中段計算式の独立定式
Sources (pinned): law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002.
Independent restatement: (total + 12000) / 2 への変形（_total>12000 のとき等価）。
-/

namespace JapanTaxLaw.LifeInsurancePremiumDeduction

def specDeduction (t : Nat) : Nat := (t + 12000) / 2

example : specDeduction 13000 = 12500 := by decide
example : specDeduction 32000 = 22000 := by decide

def agreeLifeInsurancePremiumDeduction : Bool :=
  [12000, 12001, 13000, 22000, 31999, 32000].all fun t => deduction t == specDeduction t

example : agreeLifeInsurancePremiumDeduction = true := by decide

end JapanTaxLaw.LifeInsurancePremiumDeduction
