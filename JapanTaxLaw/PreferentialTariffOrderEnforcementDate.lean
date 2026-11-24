import JapanTaxLaw.TaxFinance

/-!
# PreferentialTariffOrderEnforcementDate — 関税定率法第五条便益関税適用政令 施行日（附則 art.1）bounded L4 モデル

Sources (pinned):
  Law id: 330CO0000000237
  Revision: 330CO0000000237_20250401_507CO0000000141
  Raw snapshot: data/raw/330CO0000000237_20250401_507CO0000000141.law.json
  附則 Article 1 (施行期日). Needles contain no U+3000.

原文逐語（附則）:
  「第一条 この政令は、平成十七年四月一日から施行する。」

Computation（原文逐語から導出、施行日の算定のみ）:
  平成 17 年 = 1988 + 17 = 2005（平成元年 = 1989、1989+17-1=2005）
  enforcementDate = (2005, 4, 1)
  inForce(d) = dateKey(d) >= 20050401

Scope / NOT MODELLED:
  - 附則の他条（経過措置等）・政令の実体規定（便益関税の適用）は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.PreferentialTariffOrderEnforcementDate

open JapanTaxLaw.TaxFinance

def heiseiToSeireki (heiseiYear : Nat) : Nat := 1988 + heiseiYear

/-- 施行日 = 平成17年4月1日 = 2005-04-01。 -/
def enforcementDate : Nat × Nat × Nat := (heiseiToSeireki 17, 4, 1)

/-- 暦日を Nat キー YYYYMMDD に符号化。 -/
def dateKey (d : Nat × Nat × Nat) : Nat := d.1 * 10000 + d.2.1 * 100 + d.2.2

def enforcementKey : Nat := dateKey enforcementDate

/-- 指定日が施行日以降か。 -/
def inForce (d : Nat × Nat × Nat) : Bool := dateKey d >= enforcementKey

example : heiseiToSeireki 17 = 2005 := by decide
example : enforcementDate = (2005, 4, 1) := by decide
example : enforcementKey = 20050401 := by decide
example : inForce (2005, 3, 31) = false := by decide
example : inForce (2005, 4, 1) = true := by decide

end JapanTaxLaw.PreferentialTariffOrderEnforcementDate
