import JapanTaxLaw.TaxBaseRounding

/-!
# TaxBaseRounding tests — 課税標準額端数切捨て smoke checks
Decidable smoke tests, pinned to law 325AC0000000226 / revision 325AC0000000226_20261101_508AC0000000002.
千円未満切捨て。
-/

namespace JapanTaxLaw.TaxBaseRounding

example : roundDownToThousand 999 = 0 := by decide
example : roundDownToThousand 1000 = 1000 := by decide
example : roundDownToThousand 123456 = 123000 := by decide

end JapanTaxLaw.TaxBaseRounding
