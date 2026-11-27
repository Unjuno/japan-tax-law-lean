import JapanTaxLaw.TaxFinance

/-!
# CountervailingDutyEnforcementDate — 相殺関税に関する政令 施行日（附則 art.1）bounded L4 モデル

Sources (pinned):
  Law id: 406CO0000000415
  Revision: 406CO0000000415_20171008_428CO0000000240
  Raw snapshot: data/raw/406CO0000000415_20171008_428CO0000000240.law.json
  附則 Article 1 (施行期日). Needles contain no U+3000.

原文逐語（附則）:
  「第一条 この政令は、平成十三年一月六日から施行する。」

Computation（原文逐語から導出、施行日の算定のみ）:
  平成 13 年 = 1988 + 13 = 2001（平成元年 = 1989、1989+13-1=2001）
  enforcementDate = (2001, 1, 6)
  inForce(d) = dateKey(d) >= 20010106

Scope / NOT MODELLED:
  - 附則の他条（経過措置等）・政令の実体規定（相殺関税の税率・手続等）は NOT MODELLED。
  - 中央省庁再編に伴う組織・権限移管の法的効果は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.CountervailingDutyEnforcementDate

open JapanTaxLaw.TaxFinance

def heiseiToSeireki (heiseiYear : Nat) : Nat := 1988 + heiseiYear

/-- 施行日 = 平成13年1月6日 = 2001-01-06。 -/
def enforcementDate : Nat × Nat × Nat := (heiseiToSeireki 13, 1, 6)

def dateKey (d : Nat × Nat × Nat) : Nat := d.1 * 10000 + d.2.1 * 100 + d.2.2

def enforcementKey : Nat := dateKey enforcementDate

/-- 指定日が施行日以降か。 -/
def inForce (d : Nat × Nat × Nat) : Bool := dateKey d >= enforcementKey

example : heiseiToSeireki 13 = 2001 := by decide
example : enforcementDate = (2001, 1, 6) := by decide
example : enforcementKey = 20010106 := by decide
example : inForce (2001, 1, 5) = false := by decide
example : inForce (2001, 1, 6) = true := by decide

end JapanTaxLaw.CountervailingDutyEnforcementDate
