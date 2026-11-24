import JapanTaxLaw.SpouseIncomeCeiling950k

/-!
# SpouseIncomeCeiling950k tests — kernel-decided boundary examples
Pinned to law 340AC0000000033, revision 340AC0000000033_20261001_507AC0000000070, art. 83_2 paragraph 1 item 1.
Unit: 円; threshold 950000 円.
-/

namespace JapanTaxLaw.SpouseIncomeCeiling950k

example : qualifiedSpouse 0 = true := by decide
example : qualifiedSpouse 1 = true := by decide
example : qualifiedSpouse 949999 = true := by decide
example : qualifiedSpouse 950000 = true := by decide
example : qualifiedSpouse 950001 = false := by decide
example : qualifiedSpouse 2000000 = false := by decide

end JapanTaxLaw.SpouseIncomeCeiling950k
