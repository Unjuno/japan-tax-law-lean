import JapanTaxLaw.TaxFinance

/-!
# ReconstructionZoneLocalTaxExemptionEnforcementDate — 東日本大震災復興特別区域法第四十三条の地方税の課税免除等に関する省令 施行日（附則 art.1）bounded L4 モデル

Sources (pinned):
  Law id: 423M60000008168
  Revision: 423M60000008168_20260401_508M60000008052
  Raw snapshot: data/raw/423M60000008168_20260401_508M60000008052.law.json
  附則 Article 1 (施行期日). Needles contain no U+3000.

原文逐語（附則）:
  「第一条 この省令は、平成二十九年四月一日から施行する。」

Computation（原文逐語から導出、施行日の算定のみ）:
  平成 29 年 = 1988 + 29 = 2017（平成元年 = 1989、1989+29-1=2017）
  enforcementDate = (2017, 4, 1)
  inForce(d) = dateKey(d) >= 20170401

Scope / NOT MODELLED:
  - 同条のただし書（各改正規定は当該各号に定める日から施行する）は NOT MODELLED。
    inForce は省令全体の施行日（2017-04-01）のみを表す。
  - 附則の他条（経過措置等）・省令の実体規定（地方税の課税免除・不均一課税の適用要件等）は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.ReconstructionZoneLocalTaxExemptionEnforcementDate

open JapanTaxLaw.TaxFinance

def heiseiToSeireki (heiseiYear : Nat) : Nat := 1988 + heiseiYear

/-- 施行日 = 平成29年4月1日 = 2017-04-01。 -/
def enforcementDate : Nat × Nat × Nat := (heiseiToSeireki 29, 4, 1)

def dateKey (d : Nat × Nat × Nat) : Nat := d.1 * 10000 + d.2.1 * 100 + d.2.2

def enforcementKey : Nat := dateKey enforcementDate

/-- 指定日が施行日以降か。 -/
def inForce (d : Nat × Nat × Nat) : Bool := dateKey d >= enforcementKey

example : heiseiToSeireki 29 = 2017 := by decide
example : enforcementDate = (2017, 4, 1) := by decide
example : enforcementKey = 20170401 := by decide
example : inForce (2017, 3, 31) = false := by decide
example : inForce (2017, 4, 1) = true := by decide

end JapanTaxLaw.ReconstructionZoneLocalTaxExemptionEnforcementDate
