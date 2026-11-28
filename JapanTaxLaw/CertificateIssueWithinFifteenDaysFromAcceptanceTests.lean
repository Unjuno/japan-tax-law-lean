import JapanTaxLaw.CertificateIssueWithinFifteenDaysFromAcceptance
import JapanTaxLaw.CertificateIssueWithinFifteenDaysFromAcceptanceSpec

/-
# CertificateIssueWithinFifteenDaysFromAcceptanceTests — 電解二酸化マンガン証明書発給省令 2(4) の kernel-decided 検証

Pinned: law 420M60000400040 / revision 420M60000400040_20240301_506M60000400008.
Coverage: 十五=15, inclusive upper boundary, shifted boundaries, pre-acceptance
guard (the Nat-saturation counterexample), impl/spec agreement.
-/

namespace JapanTaxLaw.CertificateIssueWithinFifteenDaysFromAcceptance

example : dayLimit = 15 := by decide

-- 上限境界
example : within15 0 0 = true := by decide
example : within15 0 15 = true := by decide
example : within15 0 16 = false := by decide
example : within15 10 25 = true := by decide
example : within15 10 26 = false := by decide

-- 受理前ガード（Nat 減算 saturation の反例）
example : within15 10 9 = false := by decide
example : within15 1 0 = false := by decide

-- impl / 独立仕様の一致
example : dayLimit = specLimit := by decide
example : within15 0 0 = specWithin 0 0 := by decide
example : within15 0 15 = specWithin 0 15 := by decide
example : within15 0 16 = specWithin 0 16 := by decide
example : within15 10 25 = specWithin 10 25 := by decide
example : within15 10 25 = specWithin 10 25 := by decide
example : within15 10 9 = specWithin 10 9 := by decide

end JapanTaxLaw.CertificateIssueWithinFifteenDaysFromAcceptance
