import JapanTaxLaw.DividendTaxRate

/-!
# DividendTaxRate spec — 5% の独立定式
Sources (pinned): law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002.
-/

namespace JapanTaxLaw.DividendTaxRate

def specTax (b : Nat) : Nat := b * 5 / 100

example : specTax 1000 = 50 := by decide
example : specTax 10000 = 500 := by decide

def agreeDividendTaxRate : Bool :=
  [0, 1, 100, 1000, 10000].all fun b => taxYen b == specTax b

example : agreeDividendTaxRate = true := by decide

end JapanTaxLaw.DividendTaxRate
