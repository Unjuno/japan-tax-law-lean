import JapanTaxLaw.DeliberationQuorum

/-!
# DeliberationQuorum tests — 定足数 smoke checks
Decidable smoke tests, pinned to law 412CO0000000276 / revision 412CO0000000276_20260401_508CO0000000085.
1/3 以上: 10/30 は可、9/30 は不可。
-/

namespace JapanTaxLaw.DeliberationQuorum

example : quorumMet 10 30 = true := by decide
example : quorumMet 9 30 = false := by decide
example : quorumMet 11 30 = true := by decide

end JapanTaxLaw.DeliberationQuorum
