import JapanTaxLaw.MedicalExpenseDeduction

/-!
# MedicalExpenseDeduction spec — 2 段 cap の独立定式
Sources (pinned): law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002.
Independent restatement: min/max を用いた別定式。
-/

namespace JapanTaxLaw.MedicalExpenseDeduction

def specThreshold (inc : Nat) : Nat := min (inc * 5 / 100) 100000
def specDeduction (inc : Nat) (paid : Nat) : Nat := min (paid - min paid (specThreshold inc)) 2000000

example : specThreshold 1000000 = 50000 := by decide
example : specDeduction 1000000 200000 = 150000 := by decide
example : specDeduction 1000000 3000000 = 2000000 := by decide

def agreeMedicalExpenseDeduction : Bool :=
  [(0,0),(1000000,0),(1000000,30000),(1000000,200000),(5000000,120000),
   (1000000,2100000),(1000000,3000000)].all fun ip => deduction ip.1 ip.2 == specDeduction ip.1 ip.2

example : agreeMedicalExpenseDeduction = true := by decide

end JapanTaxLaw.MedicalExpenseDeduction
