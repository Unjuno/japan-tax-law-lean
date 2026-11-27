import JapanTaxLaw.TaxFinance

/-!
# PurebredLivestockCertificateEnforcementDate — 純粋種繁殖用牛豚・無税馬証明書に関する省令 施行日（附則 art.1）bounded L4 モデル

Sources (pinned):
  Law id: 407M50000200013
  Revision: 407M50000200013_20201221_502M60000200083
  Raw snapshot: data/raw/407M50000200013_20201221_502M60000200083.law.json
  附則 Article 1 (施行期日). Needles contain no U+3000.

原文逐語（附則）:
  「第一条 この省令は、平成十二年四月一日から施行する。」

Computation（原文逐語から導出、施行日の算定のみ）:
  平成 12 年 = 1988 + 12 = 2000（平成元年 = 1989、1989+12-1=2000）
  enforcementDate = (2000, 4, 1)
  inForce(d) = dateKey(d) >= 20000401

Scope / NOT MODELLED:
  - 附則の他条（経過措置等）・省令の実体規定（証明書の交付申請・発給・写し送付）は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.PurebredLivestockCertificateEnforcementDate

open JapanTaxLaw.TaxFinance

def heiseiToSeireki (heiseiYear : Nat) : Nat := 1988 + heiseiYear

/-- 施行日 = 平成12年4月1日 = 2000-04-01。 -/
def enforcementDate : Nat × Nat × Nat := (heiseiToSeireki 12, 4, 1)

def dateKey (d : Nat × Nat × Nat) : Nat := d.1 * 10000 + d.2.1 * 100 + d.2.2

def enforcementKey : Nat := dateKey enforcementDate

/-- 指定日が施行日以降か。 -/
def inForce (d : Nat × Nat × Nat) : Bool := dateKey d >= enforcementKey

example : heiseiToSeireki 12 = 2000 := by decide
example : enforcementDate = (2000, 4, 1) := by decide
example : enforcementKey = 20000401 := by decide
example : inForce (2000, 3, 31) = false := by decide
example : inForce (2000, 4, 1) = true := by decide

end JapanTaxLaw.PurebredLivestockCertificateEnforcementDate
