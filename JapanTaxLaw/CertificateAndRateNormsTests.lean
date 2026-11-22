import JapanTaxLaw.CertificateAndRateNorms
import JapanTaxLaw.CertificateAndRateNormsSpec

/-!
# CertificateAndRateNormsTests — 証明書・提出・税率上限
-/
namespace JapanTaxLaw.CertificateAndRateNormsTests

open JapanTaxLaw.CertificateAndRateNorms

theorem certificate_spec (h : Bool) :
    certificateHeld h = JapanTaxLaw.CertificateAndRateNormsSpec.certificateSpec h := by rfl

theorem submit_spec (d dl : Nat) :
    submittedInTime d dl = true ↔ JapanTaxLaw.CertificateAndRateNormsSpec.submitSpec d dl := by
  simp [submittedInTime, JapanTaxLaw.CertificateAndRateNormsSpec.submitSpec]

example : certificateHeld true = true := certificate_present
example : certificateHeld false = false := certificate_absent
example (d : Nat) : submittedInTime d d = true := submit_at_deadline d
example (d dl : Nat) (h : dl < d) : submittedInTime d dl = false := submit_late d dl h
example (d : Nat) : extendDeadline d 0 = d := extend_zero d
example (c : Nat) : rateWithinCap c c = true := rate_at_cap c
example (r c : Nat) (h : c < r) : rateWithinCap r c = false := rate_over_cap r c h
example : certificateDeclared = true := certificate_is_declaration

end JapanTaxLaw.CertificateAndRateNormsTests
