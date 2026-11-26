import JapanTaxLaw.DividedCertificateIssuanceSpec

/-
# DividedCertificateIssuanceTests — kernel-decided boundary checks
-/

namespace JapanTaxLaw.DividedCertificateIssuance

example : asDividedCert 0 = 1 := by decide
example : asDividedCert 1 = 1 := by decide
example : asDividedCert 2 = 2 := by decide
example : asDividedCert 3 = 3 := by decide
example : specAsDividedCert 0 = 1 := by decide
example : specAsDividedCert 1 = 1 := by decide
example : asDividedCert 0 = specAsDividedCert 0 := by decide
example : asDividedCert 1 = specAsDividedCert 1 := by decide
example (x : Nat) : asDividedCert x = specAsDividedCert x := agree_as_divided_cert x
example : asDividedCert 9 = specAsDividedCert 9 := agree_as_divided_cert 9

end JapanTaxLaw.DividedCertificateIssuance
