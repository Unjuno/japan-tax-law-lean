import JapanTaxLaw.TaxFinance

/-!
# HanshinAwajiDisasterTaxReliefEnforcementDate — 阪神・淡路大震災被災者国税特例施行規則 施行日（附則 art.1）bounded L4 モデル

Sources (pinned):
  Law id: 407M50000040012
  Revision: 407M50000040012_20090401_421M60000040020
  Raw snapshot: data/raw/407M50000040012_20090401_421M60000040020.law.json
  附則 Article 1 (施行期日). Needles contain no U+3000.

原文逐語（附則）:
  「第一条 この省令は、平成十四年八月一日から施行する。」

Computation（原文逐語から導出、施行日の算定のみ）:
  平成 14 年 = 1988 + 14 = 2002（平成元年 = 1989、1989+14-1=2002）
  enforcementDate = (2002, 8, 1)
  inForce(d) = dateKey(d) >= 20020801

Scope / NOT MODELLED:
  - 附則の他条（経過措置等）・省令の実体規定（特例適用要件等）は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.HanshinAwajiDisasterTaxReliefEnforcementDate

open JapanTaxLaw.TaxFinance

def heiseiToSeireki (heiseiYear : Nat) : Nat := 1988 + heiseiYear

/-- 施行日 = 平成14年8月1日 = 2002-08-01。 -/
def enforcementDate : Nat × Nat × Nat := (heiseiToSeireki 14, 8, 1)

def dateKey (d : Nat × Nat × Nat) : Nat := d.1 * 10000 + d.2.1 * 100 + d.2.2

def enforcementKey : Nat := dateKey enforcementDate

/-- 指定日が施行日以降か。 -/
def inForce (d : Nat × Nat × Nat) : Bool := dateKey d >= enforcementKey

example : heiseiToSeireki 14 = 2002 := by decide
example : enforcementDate = (2002, 8, 1) := by decide
example : enforcementKey = 20020801 := by decide
example : inForce (2002, 7, 31) = false := by decide
example : inForce (2002, 8, 1) = true := by decide

end JapanTaxLaw.HanshinAwajiDisasterTaxReliefEnforcementDate
