import JapanTaxLaw.TreasuryCollectionNet

/-!
# TreasuryCollectionNet tests — kernel-decided boundary examples
Pinned to law 329AC0000000036, revision 329AC0000000036_20240101_431AC0000000003, art. 14(1).
Unit: 円; net = saturating (受入国税収納金等 - 過誤納還付金等).
-/

namespace JapanTaxLaw.TreasuryCollectionNet

example : netCollection 0 0 true = 0 := by decide
example : netCollection 1 0 true = 1 := by decide
example : netCollection 100 40 true = 60 := by decide
example : netCollection 100 100 true = 0 := by decide
example : netCollection 100 150 true = 0 := by decide
example : netCollection 100 40 false = 0 := by decide

end JapanTaxLaw.TreasuryCollectionNet
