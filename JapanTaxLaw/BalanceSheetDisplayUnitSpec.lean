import JapanTaxLaw.BalanceSheetDisplayUnit

/-!
# Independent spec — art. 22の4(2) presentation units

The spec computes the divisor with a nested conditional instead of pattern
matching. Agreement is exhaustive over all three declared units.
-/
namespace JapanTaxLaw.BalanceSheetDisplayUnit

def specDivisor (u : DisplayUnit) : Nat :=
  if u == DisplayUnit.oneYen then 1
  else if u == DisplayUnit.thousandYen then 1_000
  else 1_000_000

theorem agree_spec_impl (u : DisplayUnit) : specDivisor u = unitDivisor u := by
  cases u <;> rfl

example : specDivisor DisplayUnit.millionYen = 1_000_000 := by rfl

end JapanTaxLaw.BalanceSheetDisplayUnit
