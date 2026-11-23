import JapanTaxLaw.SchoolExemptionRequirements

/-!
# SchoolExemptionRequirements spec — 両要件の独立定式
Sources (pinned): law 403M50000040031, revision 403M50000040031_20260401_508M60000040010.
Independent restatement: 12 <= months かつ 680 <= hours（Bool 比較を分解）。
-/

namespace JapanTaxLaw.SchoolExemptionRequirements

def specMeets (m : Nat) (h : Nat) : Bool := Nat.ble 12 m && Nat.ble 680 h

example : specMeets 12 680 = true := by decide
example : specMeets 11 680 = false := by decide

def agreeSchoolExemptionRequirements : Bool :=
  [(0,0),(11,680),(12,679),(12,680),(24,1000),(12,1000)].all fun mh =>
    meetsSchoolRequirements mh.1 mh.2 == specMeets mh.1 mh.2

example : agreeSchoolExemptionRequirements = true := by decide

end JapanTaxLaw.SchoolExemptionRequirements
