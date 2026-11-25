import JapanTaxLaw.DonationTaxCredit

/-!
# DonationTaxCredit tests — 寄附金税額控除 smoke checks
Decidable smoke tests, pinned to law 325AC0000000226 / revision 325AC0000000226_20261101_508AC0000000002.
min(寄附金,所得30%) - 2000 × 4%(指定都市2%)。
-/

namespace JapanTaxLaw.DonationTaxCredit

example : credit 10000 100000 false = 320 := by decide
example : credit 10000 100000 true = 160 := by decide
example : credit 2000 100000 false = 0 := by decide

end JapanTaxLaw.DonationTaxCredit
