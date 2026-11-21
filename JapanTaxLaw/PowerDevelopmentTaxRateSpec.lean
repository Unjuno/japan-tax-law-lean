import JapanTaxLaw.PowerDevelopmentTaxRate

/-!
# PowerDevelopmentTaxRate spec — 電源開発促進税 税率 の独立整数定式
Sources (pinned): law 349AC0000000079, revision 349AC0000000079_20250601_504AC0000000068.
Independent restatement: 税額 = 375 × 千kWh。
-/

namespace JapanTaxLaw.PowerDevelopmentTaxRate

def specTax (n : Nat) : Nat := 375 * n

example : specTax 1 = 375 := by decide
example : specTax 100 = 37500 := by decide

def agreePowerDevelopmentTaxRate : Bool :=
  [0, 1, 2, 5, 10, 100].all fun n => taxYen n == specTax n

example : agreePowerDevelopmentTaxRate = true := by decide

end JapanTaxLaw.PowerDevelopmentTaxRate
