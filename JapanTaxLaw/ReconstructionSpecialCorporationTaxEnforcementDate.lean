import JapanTaxLaw.TaxFinance

/-!
# ReconstructionSpecialCorporationTaxEnforcementDate — 復興特別法人税に関する省令 施行日（附則 art.1）bounded L4 モデル

Sources (pinned):
  Law id: 424M60000040007
  Revision: 424M60000040007_20210415_503M60000040045
  Raw snapshot: data/raw/424M60000040007_20210415_503M60000040045.law.json
  附則 Article 1 (施行期日). Needles contain no U+3000.

原文逐語（附則）:
  「第一条 この省令は、平成二十四年四月一日から施行する。」

Computation（原文逐語から導出、施行日の算定のみ）:
  平成 24 年 = 1988 + 24 = 2012（平成元年 = 1989、1989+24-1=2012）
  enforcementDate = (2012, 4, 1)
  inForce(d) = dateKey(d) >= 20120401

Scope / NOT MODELLED:
  - 附則の他条（経過措置等）・省令の実体規定（復興特別法人税の税率・申告等）は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.ReconstructionSpecialCorporationTaxEnforcementDate

open JapanTaxLaw.TaxFinance

def heiseiToSeireki (heiseiYear : Nat) : Nat := 1988 + heiseiYear

/-- 施行日 = 平成24年4月1日 = 2012-04-01。 -/
def enforcementDate : Nat × Nat × Nat := (heiseiToSeireki 24, 4, 1)

def dateKey (d : Nat × Nat × Nat) : Nat := d.1 * 10000 + d.2.1 * 100 + d.2.2

def enforcementKey : Nat := dateKey enforcementDate

/-- 指定日が施行日以降か。 -/
def inForce (d : Nat × Nat × Nat) : Bool := dateKey d >= enforcementKey

example : heiseiToSeireki 24 = 2012 := by decide
example : enforcementDate = (2012, 4, 1) := by decide
example : enforcementKey = 20120401 := by decide
example : inForce (2012, 3, 31) = false := by decide
example : inForce (2012, 4, 1) = true := by decide

end JapanTaxLaw.ReconstructionSpecialCorporationTaxEnforcementDate
