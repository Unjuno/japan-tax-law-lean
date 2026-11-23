import JapanTaxLaw.PropertyInKindEnforcementDate

/-!
# PropertyInKindEnforcementDate spec — 施行日の独立定式
Sources (pinned): law 325M50000040022, revision 325M50000040022_20210401_503M60000040030.
Independent restatement: 辞書順成分比較（実装の dateKey とは別定式）。
-/

namespace JapanTaxLaw.PropertyInKindEnforcementDate

def specDate : Nat × Nat × Nat := (2003, 1, 6)
def specInForce (d : Nat × Nat × Nat) : Bool :=
  decide (d.1 > 2003) || (d.1 == 2003 && decide (d.2.1 > 1)) ||
  (d.1 == 2003 && d.2.1 == 1 && decide (d.2.2 >= 6))

example : specInForce (2003, 1, 6) = true := by decide
example : specInForce (2003, 1, 5) = false := by decide

def agreePropertyInKindEnforcementDate : Bool :=
  [(2000,1,1),(2003,1,5),(2003,1,6),(2003,1,7),(2003,2,1),(2010,1,1)].all fun d => inForce d == specInForce d

example : agreePropertyInKindEnforcementDate = true := by decide

end JapanTaxLaw.PropertyInKindEnforcementDate
