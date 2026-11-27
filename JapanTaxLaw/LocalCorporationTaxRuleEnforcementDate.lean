import JapanTaxLaw.TaxFinance

/-!
# LocalCorporationTaxRuleEnforcementDate — 地方法人税法施行規則 施行日（附則 art.1）bounded L4 モデル

Sources (pinned):
  Law id: 426M60000040022
  Revision: 426M60000040022_20260414_508M60000040040
  Raw snapshot: data/raw/426M60000040022_20260414_508M60000040040.law.json
  附則 Article 1 (施行期日). Needles contain no U+3000.

原文逐語（附則）:
  「第一条 この省令は、平成二十六年十月一日から施行する。」

Computation（原文逐語から導出、施行日の算定のみ）:
  平成 26 年 = 1988 + 26 = 2014（平成元年 = 1989、1989+26-1=2014）
  enforcementDate = (2014, 10, 1)
  inForce(d) = dateKey(d) >= 20141001

Scope / NOT MODELLED:
  - 附則の他条（経過措置等）・省令の実体規定（地方法人税の課税要件・申告等）は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.LocalCorporationTaxRuleEnforcementDate

open JapanTaxLaw.TaxFinance

def heiseiToSeireki (heiseiYear : Nat) : Nat := 1988 + heiseiYear

/-- 施行日 = 平成26年10月1日 = 2014-10-01。 -/
def enforcementDate : Nat × Nat × Nat := (heiseiToSeireki 26, 10, 1)

def dateKey (d : Nat × Nat × Nat) : Nat := d.1 * 10000 + d.2.1 * 100 + d.2.2

def enforcementKey : Nat := dateKey enforcementDate

/-- 指定日が施行日以降か。 -/
def inForce (d : Nat × Nat × Nat) : Bool := dateKey d >= enforcementKey

example : heiseiToSeireki 26 = 2014 := by decide
example : enforcementDate = (2014, 10, 1) := by decide
example : enforcementKey = 20141001 := by decide
example : inForce (2014, 9, 30) = false := by decide
example : inForce (2014, 10, 1) = true := by decide

end JapanTaxLaw.LocalCorporationTaxRuleEnforcementDate
