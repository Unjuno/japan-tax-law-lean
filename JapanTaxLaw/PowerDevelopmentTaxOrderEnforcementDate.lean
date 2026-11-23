import JapanTaxLaw.TaxFinance

/-!
# PowerDevelopmentTaxOrderEnforcementDate — 電源開発促進税法施行令 施行日（附則 art.1）bounded L4 モデル

Sources (pinned):
  Law id: 349CO0000000339
  Revision: 349CO0000000339_20250401_507CO0000000006
  Raw snapshot: data/raw/349CO0000000339_20250401_507CO0000000006.law.json
  附則 Article 1 (施行期日). Needles contain no U+3000.

原文逐語（附則）:
  「第一条 この政令は、平成十二年三月二十一日から施行する。」

Computation（原文逐語から導出、施行日の算定のみ）:
  平成 12 年 = 1988 + 12 = 2000（平成元年 = 1989、1989+12-1=2000）
  enforcementDate = (2000, 3, 21)
  inForce(d) = dateKey(d) >= 20000321

Scope / NOT MODELLED:
  - 附則の他条（経過措置等）・施行令の実体規定は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.PowerDevelopmentTaxOrderEnforcementDate

open JapanTaxLaw.TaxFinance

def heiseiToSeireki (heiseiYear : Nat) : Nat := 1988 + heiseiYear

/-- 施行日 = 平成12年3月21日 = 2000-03-21。 -/
def enforcementDate : Nat × Nat × Nat := (heiseiToSeireki 12, 3, 21)

/-- 暦日を Nat キー YYYYMMDD に符号化。 -/
def dateKey (d : Nat × Nat × Nat) : Nat := d.1 * 10000 + d.2.1 * 100 + d.2.2

def enforcementKey : Nat := dateKey enforcementDate

/-- 指定日が施行日以降か。 -/
def inForce (d : Nat × Nat × Nat) : Bool := dateKey d >= enforcementKey

example : heiseiToSeireki 12 = 2000 := by decide
example : enforcementDate = (2000, 3, 21) := by decide
example : enforcementKey = 20000321 := by decide
example : inForce (2000, 3, 20) = false := by decide
example : inForce (2000, 3, 21) = true := by decide

end JapanTaxLaw.PowerDevelopmentTaxOrderEnforcementDate
