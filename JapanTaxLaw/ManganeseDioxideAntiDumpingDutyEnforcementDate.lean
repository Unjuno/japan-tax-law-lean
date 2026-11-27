import JapanTaxLaw.TaxFinance

/-!
# ManganeseDioxideAntiDumpingDutyEnforcementDate — 電解二酸化マンガンに対して課する不当廉売関税に関する政令 施行日（附則 art.1）bounded L4 モデル

Sources (pinned):
  Law id: 420CO0000000196
  Revision: 420CO0000000196_20240301_506CO0000000039
  Raw snapshot: data/raw/420CO0000000196_20240301_506CO0000000039.law.json
  附則 Article 1 (施行期日). Needles contain no U+3000.

原文逐語（附則）:
  「第一条 この政令は、平成二十三年四月一日から施行する。」

Computation（原文逐語から導出、施行日の算定のみ）:
  平成 23 年 = 1988 + 23 = 2011（平成元年 = 1989、1989+23-1=2011）
  enforcementDate = (2011, 4, 1)
  inForce(d) = dateKey(d) >= 20110401

Scope / NOT MODELLED:
  - 附則の他条（経過措置等）・政令の実体規定（不当廉売関税の税率・手続等）は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.ManganeseDioxideAntiDumpingDutyEnforcementDate

open JapanTaxLaw.TaxFinance

def heiseiToSeireki (heiseiYear : Nat) : Nat := 1988 + heiseiYear

/-- 施行日 = 平成23年4月1日 = 2011-04-01。 -/
def enforcementDate : Nat × Nat × Nat := (heiseiToSeireki 23, 4, 1)

def dateKey (d : Nat × Nat × Nat) : Nat := d.1 * 10000 + d.2.1 * 100 + d.2.2

def enforcementKey : Nat := dateKey enforcementDate

/-- 指定日が施行日以降か。 -/
def inForce (d : Nat × Nat × Nat) : Bool := dateKey d >= enforcementKey

example : heiseiToSeireki 23 = 2011 := by decide
example : enforcementDate = (2011, 4, 1) := by decide
example : enforcementKey = 20110401 := by decide
example : inForce (2011, 3, 31) = false := by decide
example : inForce (2011, 4, 1) = true := by decide

end JapanTaxLaw.ManganeseDioxideAntiDumpingDutyEnforcementDate
