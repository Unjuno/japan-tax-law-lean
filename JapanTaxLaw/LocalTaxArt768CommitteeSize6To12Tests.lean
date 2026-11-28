import JapanTaxLaw.LocalTaxArt768CommitteeSize6To12Spec

/-!
# LocalTaxArt768CommitteeSize6To12 tests — kernel-decided boundary checks

Pinned to law 325AC0000000226 / revision 325AC0000000226_20261101_508AC0000000002.
境界: 5/6/7 と 11/12/13。
-/

namespace JapanTaxLaw.LocalTaxArt768CommitteeSize6To12

example : inRange 0 = false := by decide
example : inRange 1 = false := by decide
example : inRange 5 = false := by decide
example : inRange 6 = true := by decide
example : inRange 7 = true := by decide
example : inRange 11 = true := by decide
example : inRange 12 = true := by decide
example : inRange 13 = false := by decide
example : specInRange 5 = false := by decide
example : specInRange 12 = true := by decide

end JapanTaxLaw.LocalTaxArt768CommitteeSize6To12
