import JapanTaxLaw.DisasterExciseTaxCredit

/-!
# DisasterExciseTaxCredit tests — kernel-decided boundary examples
Pinned to law 322AC0000000175, revision 322AC0000000175_20220101_503AC0000000011, art. 7(1).
Unit: 円; credit = disaster excise tax less cabinet-order offset (saturating).
-/

namespace JapanTaxLaw.DisasterExciseTaxCredit

example : disasterCredit 0 0 true = 0 := by decide
example : disasterCredit 1 0 true = 1 := by decide
example : disasterCredit 100 40 true = 60 := by decide
example : disasterCredit 100 100 true = 0 := by decide
example : disasterCredit 100 150 true = 0 := by decide
example : disasterCredit 100 40 false = 0 := by decide
example : appliedCredit 50 60 = 0 := by decide
example : appliedCredit 50 20 = 30 := by decide

end JapanTaxLaw.DisasterExciseTaxCredit
