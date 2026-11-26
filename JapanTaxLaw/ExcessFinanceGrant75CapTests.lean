import JapanTaxLaw.ExcessFinanceGrant75Cap

/-!
# ExcessFinanceGrant75Cap tests — kernel-decided boundary examples
Pinned to law 431AC0000000004, revision 431AC0000000004_20260401_508AC0000000002, art. 31(5)(4).
Rate 75/100; cap = excess - prior limits (saturating).
-/

namespace JapanTaxLaw.ExcessFinanceGrant75Cap

example : cappedGrant 0 0 0 = 0 := by decide
example : cappedGrant 1 0 0 = 0 := by decide
example : cappedGrant 74 0 1000 = 55 := by decide
example : cappedGrant 75 0 1000 = 56 := by decide
example : cappedGrant 76 0 1000 = 57 := by decide
example : cappedGrant 100 0 1000 = 75 := by decide
example : cappedGrant 100 40 100 = 60 := by decide
example : cappedGrant 100 40 200 = 75 := by decide

end JapanTaxLaw.ExcessFinanceGrant75Cap
