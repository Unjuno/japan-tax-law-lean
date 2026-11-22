import JapanTaxLaw.NickelContent

/-!
# NickelContent tests — ニッケル含有量 smoke checks
Decidable smoke tests, pinned to law 508CO0000000224 / revision 508CO0000000224_20261031_508CO0000000340.
0.6% ちょうど(6/1000)→false、超え(7/1000)→true。
-/

namespace JapanTaxLaw.NickelContent

example : exceedsNickelThreshold 6 1000 = false := by decide
example : exceedsNickelThreshold 7 1000 = true := by decide
example : exceedsNickelThreshold 12 2000 = false := by decide
example : exceedsNickelThreshold 13 2000 = true := by decide

end JapanTaxLaw.NickelContent
