import JapanTaxLaw.TaxFinance

/-!
# TobaccoSpecialTaxRuleEnforcementDate — たばこ特別税に関する省令 施行日（附則 art.1）bounded L4 モデル

Sources (pinned):
  Law id: 410M50000040122
  Revision: 410M50000040122_20150401_427M60000040039
  Raw snapshot: data/raw/410M50000040122_20150401_427M60000040039.law.json
  附則 Article 1 (施行期日). Needles contain no U+3000.

原文逐語（附則）:
  「第一条 この省令は、平成十六年一月十九日から施行する。」

Computation（原文逐語から導出、施行日の算定のみ）:
  平成 16 年 = 1988 + 16 = 2004（平成元年 = 1989、1989+16-1=2004）
  enforcementDate = (2004, 1, 19)
  inForce(d) = dateKey(d) >= 20040119

Scope / NOT MODELLED:
  - 附則の他条（経過措置等）・省令の実体規定（たばこ特別税の税率・申告等）は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.TobaccoSpecialTaxRuleEnforcementDate

open JapanTaxLaw.TaxFinance

def heiseiToSeireki (heiseiYear : Nat) : Nat := 1988 + heiseiYear

/-- 施行日 = 平成16年1月19日 = 2004-01-19。 -/
def enforcementDate : Nat × Nat × Nat := (heiseiToSeireki 16, 1, 19)

def dateKey (d : Nat × Nat × Nat) : Nat := d.1 * 10000 + d.2.1 * 100 + d.2.2

def enforcementKey : Nat := dateKey enforcementDate

/-- 指定日が施行日以降か。 -/
def inForce (d : Nat × Nat × Nat) : Bool := dateKey d >= enforcementKey

example : heiseiToSeireki 16 = 2004 := by decide
example : enforcementDate = (2004, 1, 19) := by decide
example : enforcementKey = 20040119 := by decide
example : inForce (2004, 1, 18) = false := by decide
example : inForce (2004, 1, 19) = true := by decide

end JapanTaxLaw.TobaccoSpecialTaxRuleEnforcementDate
