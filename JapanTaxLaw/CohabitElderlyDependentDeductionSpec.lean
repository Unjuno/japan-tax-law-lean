import JapanTaxLaw.CohabitElderlyDependentDeduction

/-!
# CohabitElderlyDependentDeduction spec — 定額控除の独立定式
Sources (pinned): law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002.
Independent restatement: 反復加算 (count * 130000)。
-/

namespace JapanTaxLaw.CohabitElderlyDependentDeduction

def specDeduction (n : Nat) : Nat := n * 130000

example : specDeduction 1 = 130000 := by decide
example : specDeduction 2 = 260000 := by decide

def agreeCohabitElderlyDependentDeduction : Bool :=
  [0,1,2,3,10].all fun n => deduction n == specDeduction n

example : agreeCohabitElderlyDependentDeduction = true := by decide

end JapanTaxLaw.CohabitElderlyDependentDeduction
