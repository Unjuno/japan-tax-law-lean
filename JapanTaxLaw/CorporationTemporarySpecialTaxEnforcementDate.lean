import JapanTaxLaw.TaxFinance

/-!
# CorporationTemporarySpecialTaxEnforcementDate — 法人臨時特別税に関する省令 施行日（附則 art.1）bounded L4 モデル

Sources (pinned):
  Law id: 403M50000040006
  Revision: 403M50000040006_20030106_414M60000040072
  Raw snapshot: data/raw/403M50000040006_20030106_414M60000040072.law.json
  附則 Article 1 (施行期日). Needles contain no U+3000.

原文逐語（附則）:
  「第一条 この省令は、平成十五年一月六日から施行する。」

Computation（原文逐語から導出、施行日の算定のみ）:
  平成 15 年 = 1988 + 15 = 2003（平成元年 = 1989、1989+15-1=2003）
  enforcementDate = (2003, 1, 6)
  inForce(d) = dateKey(d) >= 20030106

Scope / NOT MODELLED:
  - 附則の他条（経過措置等）・省令の実体規定（臨時特別税の税率・申告等）は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.CorporationTemporarySpecialTaxEnforcementDate

open JapanTaxLaw.TaxFinance

def heiseiToSeireki (heiseiYear : Nat) : Nat := 1988 + heiseiYear

/-- 施行日 = 平成15年1月6日 = 2003-01-06。 -/
def enforcementDate : Nat × Nat × Nat := (heiseiToSeireki 15, 1, 6)

def dateKey (d : Nat × Nat × Nat) : Nat := d.1 * 10000 + d.2.1 * 100 + d.2.2

def enforcementKey : Nat := dateKey enforcementDate

/-- 指定日が施行日以降か。 -/
def inForce (d : Nat × Nat × Nat) : Bool := dateKey d >= enforcementKey

example : heiseiToSeireki 15 = 2003 := by decide
example : enforcementDate = (2003, 1, 6) := by decide
example : enforcementKey = 20030106 := by decide
example : inForce (2003, 1, 5) = false := by decide
example : inForce (2003, 1, 6) = true := by decide

end JapanTaxLaw.CorporationTemporarySpecialTaxEnforcementDate
