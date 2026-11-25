import JapanTaxLaw.EqualLevyIncomeRequirement

/-!
# EqualLevyIncomeRequirement spec — 500万円以下の独立定式
Sources (pinned): law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002.
Independent restatement: Nat.ble prevIncome 5000000（Bool 比較）。
-/

namespace JapanTaxLaw.EqualLevyIncomeRequirement

def specMeets (i : Nat) : Bool := Nat.ble i 5000000

example : specMeets 5000000 = true := by decide
example : specMeets 5000001 = false := by decide

def agreeEqualLevyIncomeRequirement : Bool :=
  [0, 1, 4999999, 5000000, 5000001, 10000000].all fun i => meetsIncomeRequirement i == specMeets i

example : agreeEqualLevyIncomeRequirement = true := by decide

end JapanTaxLaw.EqualLevyIncomeRequirement
