import JapanTaxLaw.FiscalPeriodLength

/-!
# FiscalPeriodLength spec — 5箇年度 の独立定式
Sources (pinned): law 405M50000008001, revision 405M50000008001_20250401_507M60000008028.
Independent restatement: 対象年度 offset(1origin) は 1..5。
-/

namespace JapanTaxLaw.FiscalPeriodLength

def specPeriod (o : Nat) : Bool := 1 <= o && o <= 5

example : specPeriod 1 = true := by decide
example : specPeriod 5 = true := by decide
example : specPeriod 6 = false := by decide

def agreeFiscalPeriodLength : Bool :=
  [0, 1, 2, 5, 6, 10].all fun o => isInPeriod o == specPeriod o

example : agreeFiscalPeriodLength = true := by decide

end JapanTaxLaw.FiscalPeriodLength
