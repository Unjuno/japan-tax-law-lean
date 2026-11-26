import JapanTaxLaw.CohabitantSpecialDisabilityDeduction

/-!
# CohabitantSpecialDisabilityDeduction spec — 定額控除の独立定式
Sources (pinned): law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002.
Independent restatement: 反復加算（再帰）による 220000*count。
-/

namespace JapanTaxLaw.CohabitantSpecialDisabilityDeduction

def specDeduction (n : Nat) : Nat := n * 220000

example : specDeduction 1 = 220000 := by decide
example : specDeduction 2 = 440000 := by decide

def agreeCohabitantSpecialDisabilityDeduction : Bool :=
  [0,1,2,3,10].all fun n => deduction n == specDeduction n

example : agreeCohabitantSpecialDisabilityDeduction = true := by decide

end JapanTaxLaw.CohabitantSpecialDisabilityDeduction
