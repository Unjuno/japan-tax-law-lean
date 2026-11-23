import JapanTaxLaw.DeliberationQuorum

/-!
# DeliberationQuorum spec — 1/3 以上の独立定式
Sources (pinned): law 412CO0000000276, revision 412CO0000000276_20260401_508CO0000000085.
Independent restatement: attendance*3 >= total。
-/

namespace JapanTaxLaw.DeliberationQuorum

def specQuorum (a : Nat) (t : Nat) : Bool := a * 3 >= t

example : specQuorum 10 30 = true := by decide
example : specQuorum 9 30 = false := by decide

def agreeDeliberationQuorum : Bool :=
  [(0,0),(0,3),(1,3),(9,30),(10,30),(11,30),(5,30)].all fun pair =>
    quorumMet pair.1 pair.2 == specQuorum pair.1 pair.2

example : agreeDeliberationQuorum = true := by decide

end JapanTaxLaw.DeliberationQuorum
