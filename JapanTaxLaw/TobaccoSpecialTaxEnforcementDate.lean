import JapanTaxLaw.TaxFinance

/-!
# TobaccoSpecialTaxEnforcementDate — たばこ特別税に関する政令 施行日（附則 art.1）bounded L4 モデル

Sources (pinned):
  Law id: 410CO0000000345
  Revision: 410CO0000000345_20241001_506CO0000000147
  Raw snapshot: data/raw/410CO0000000345_20241001_506CO0000000147.law.json
  附則 Article 1 (施行期日). Needles contain no U+3000.

原文逐語（附則）:
  「第一条 この政令は、平成十年十二月一日から施行する。」

Computation（原文逐語から導出、施行日の算定のみ）:
  平成 10 年 = 1988 + 10 = 1998（平成元年 = 1989、1989+10-1=1998）
  enforcementDate = (1998, 12, 1)
  inForce(d) = dateKey(d) >= 19981201

Scope / NOT MODELLED:
  - 附則の他条（経過措置等）・省令の実体規定（たばこ特別税の税率・申告等）は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.TobaccoSpecialTaxEnforcementDate

open JapanTaxLaw.TaxFinance

def heiseiToSeireki (heiseiYear : Nat) : Nat := 1988 + heiseiYear

/-- 施行日 = 平成10年12月1日 = 1998-12-01。 -/
def enforcementDate : Nat × Nat × Nat := (heiseiToSeireki 10, 12, 1)

def dateKey (d : Nat × Nat × Nat) : Nat := d.1 * 10000 + d.2.1 * 100 + d.2.2

def enforcementKey : Nat := dateKey enforcementDate

/-- 指定日が施行日以降か。 -/
def inForce (d : Nat × Nat × Nat) : Bool := dateKey d >= enforcementKey

example : heiseiToSeireki 10 = 1998 := by decide
example : enforcementDate = (1998, 12, 1) := by decide
example : enforcementKey = 19981201 := by decide
example : inForce (1998, 11, 30) = false := by decide
example : inForce (1998, 12, 1) = true := by decide

end JapanTaxLaw.TobaccoSpecialTaxEnforcementDate
