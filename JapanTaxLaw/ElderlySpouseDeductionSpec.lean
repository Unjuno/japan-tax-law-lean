import JapanTaxLaw.ElderlySpouseDeduction

/-!
# ElderlySpouseDeduction spec — 所得別定額の独立定式
Sources (pinned): law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002.
-/

namespace JapanTaxLaw.ElderlySpouseDeduction

def specDeduction (i : Nat) : Nat :=
  if 9000000 < i then
    if 9500000 < i then (if 10000000 < i then 0 else 30000) else 60000
  else 100000

example : specDeduction 9000001 = 60000 := by decide
example : specDeduction 9500001 = 30000 := by decide

def agreeElderlySpouseDeduction : Bool :=
  [0, 9000000, 9000001, 9500000, 9500001, 10000000, 10000001].all fun i => deduction i == specDeduction i

example : agreeElderlySpouseDeduction = true := by decide

end JapanTaxLaw.ElderlySpouseDeduction
