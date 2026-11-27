import JapanTaxLaw.TaxFinance

/-!
# TobaccoTaxTransitionEnforcementDate — たばこ税法の一部改正に伴う経過措置に関する政令 施行日（附則 art.1）bounded L4 モデル

Sources (pinned):
  Law id: 427CO0000000156
  Revision: 427CO0000000156_20250401_507CO0000000006
  Raw snapshot: data/raw/427CO0000000156_20250401_507CO0000000006.law.json
  附則 Article 1 (施行期日). Needles contain no U+3000.

原文逐語（附則）:
  「第一条 この政令は、平成二十九年四月一日から施行する。」

Computation（原文逐語から導出、施行日の算定のみ）:
  平成 29 年 = 1988 + 29 = 2017（平成元年 = 1989、1989+29-1=2017）
  enforcementDate = (2017, 4, 1)
  inForce(d) = dateKey(d) >= 20170401

Scope / NOT MODELLED:
  - 同条のただし書「次の各号に掲げる規定は、当該各号に定める日から施行する」は NOT MODELLED（各号ごとの施行日を本モデルでは扱わない）。
    inForce は政令全体の施行日（2017-04-01）のみを表す。
  - 附則の他条（経過措置等）・政令の実体規定（たばこ税法の経過措置等）は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.TobaccoTaxTransitionEnforcementDate

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

end JapanTaxLaw.TobaccoTaxTransitionEnforcementDate
