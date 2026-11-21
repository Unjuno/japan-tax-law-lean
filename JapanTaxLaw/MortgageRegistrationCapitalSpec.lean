import JapanTaxLaw.MortgageRegistrationCapital

/-!
# MortgageRegistrationCapital spec — 登録免許税法施行令 art.26 の独立整数定式
Sources (pinned): law 342CO0000000146, revision 342CO0000000146_20261001_507CO0000000124.
Independent restatement: 上限 500000000 円以下（境界含む）。
-/

namespace JapanTaxLaw.MortgageRegistrationCapital

def specThreshold : Nat := 500_000_000

def specBelow (c : Nat) : Bool := c <= 500000000

example : specThreshold = 500_000_000 := by decide
example : specBelow 500_000_000 = true := by decide
example : specBelow 500_000_001 = false := by decide

def agreeMortgageRegistrationCapital : Bool :=
  [0, 1, 499_999_999, 500_000_000, 500_000_001, 1_000_000_000].all fun c =>
    isAtOrBelowThreshold c == specBelow c

example : agreeMortgageRegistrationCapital = true := by decide

end JapanTaxLaw.MortgageRegistrationCapital
