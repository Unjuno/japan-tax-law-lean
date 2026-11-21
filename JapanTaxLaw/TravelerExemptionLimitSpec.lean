import JapanTaxLaw.TravelerExemptionLimit

/-!
# TravelerExemptionLimit spec — 関税法施行令 art.40 の独立整数定式
Sources (pinned): law 335CO0000000069, revision 335CO0000000069_20260401_508CO0000000085.
Independent restatement: 上限 200000 円以下（境界含む）。
-/

namespace JapanTaxLaw.TravelerExemptionLimit

def specLimit : Nat := 200_000

def specBelow (amount : Nat) : Bool := amount <= 200000

example : specLimit = 200_000 := by decide
example : specBelow 200_000 = true := by decide
example : specBelow 200_001 = false := by decide

def agreeTravelerExemptionLimit : Bool :=
  [0, 1, 199_999, 200_000, 200_001, 1_000_000].all fun a =>
    isAtOrBelowLimit a == specBelow a

example : agreeTravelerExemptionLimit = true := by decide

end JapanTaxLaw.TravelerExemptionLimit
