import JapanTaxLaw.CertificateIssueWithinFifteenDaysFromAcceptance

/-
# CertificateIssueWithinFifteenDaysFromAcceptanceSpec — 電解二酸化マンガン証明書発給省令 2(4) の独立定式

Pinned: law 420M60000400040, revision 420M60000400040_20240301_506M60000400008,
Article 2 Paragraph 4; needle 「…受理した日から十五日以内にするものとする」.

Independent restatement: issuance must occur on or after acceptance and no more
than fifteen days later. The pre-acceptance guard is stated independently;
agreement with the implementation is a separate bridge.
-/

namespace JapanTaxLaw.CertificateIssueWithinFifteenDaysFromAcceptance

/-- 独立定式: 十五 = 15。 -/
def specLimit : Nat := 15

/-- 独立定式: 受理日 <= 交付日 && 差 <= 15。 -/
def specWithin (acceptDay issueDay : Nat) : Bool :=
  acceptDay <= issueDay && issueDay - acceptDay <= specLimit

theorem agreeLimit : dayLimit = specLimit := by
  unfold dayLimit specLimit
  rfl

theorem agreeWithin (acceptDay issueDay : Nat) :
    within15 acceptDay issueDay = specWithin acceptDay issueDay := by
  unfold within15 specWithin
  rw [agreeLimit]

example : specWithin 0 15 = true := by decide
example : specWithin 0 16 = false := by decide
example : specWithin 10 9 = false := by decide

end JapanTaxLaw.CertificateIssueWithinFifteenDaysFromAcceptance
