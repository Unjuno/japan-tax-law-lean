import JapanTaxLaw.TaxFinance

/-!
# ReconstructionSpecialIncomeTaxRuleEnforcementDate — 復興特別所得税に関する省令 施行日（附則 art.1）bounded L4 モデル

Sources (pinned):
  Law id: 424M60000040006
  Revision: 424M60000040006_20260901_506M60000040028
  Raw snapshot: data/raw/424M60000040006_20260901_506M60000040028.law.json
  附則 Article 1 (施行期日). Needles contain no U+3000.

原文逐語（附則）:
  「第一条 この省令は、平成二十八年一月一日から施行する。」

Computation（原文逐語から導出、施行日の算定のみ）:
  平成 28 年 = 1988 + 28 = 2016（平成元年 = 1989、1989+28-1=2016）
  enforcementDate = (2016, 1, 1)
  inForce(d) = dateKey(d) >= 20160101

Scope / NOT MODELLED:
  - 附則の他条（経過措置等）・省令の実体規定（復興特別所得税の課税要件・申告等）は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.ReconstructionSpecialIncomeTaxRuleEnforcementDate

open JapanTaxLaw.TaxFinance

def heiseiToSeireki (heiseiYear : Nat) : Nat := 1988 + heiseiYear

/-- 施行日 = 平成28年1月1日 = 2016-01-01。 -/
def enforcementDate : Nat × Nat × Nat := (heiseiToSeireki 28, 1, 1)

def dateKey (d : Nat × Nat × Nat) : Nat := d.1 * 10000 + d.2.1 * 100 + d.2.2

def enforcementKey : Nat := dateKey enforcementDate

/-- 指定日が施行日以降か。 -/
def inForce (d : Nat × Nat × Nat) : Bool := dateKey d >= enforcementKey

example : heiseiToSeireki 28 = 2016 := by decide
example : enforcementDate = (2016, 1, 1) := by decide
example : enforcementKey = 20160101 := by decide
example : inForce (2015, 12, 31) = false := by decide
example : inForce (2016, 1, 1) = true := by decide

end JapanTaxLaw.ReconstructionSpecialIncomeTaxRuleEnforcementDate
