import JapanTaxLaw.TaxFinance

/-!
# PropertyInKindEnforcementDate — 相続税物納財産手続省令 施行日（附則 art.1）bounded L4 モデル

Sources (pinned):
  Law id: 325M50000040022
  Revision: 325M50000040022_20210401_503M60000040030
  Raw snapshot: data/raw/325M50000040022_20210401_503M60000040030.law.json
  附則 Article 1 (施行期日), flat/normalized leaf text. Needles contain no U+3000.

原文逐語（附則）:
  「第一条 この省令は、平成十五年一月六日から施行する。」

Computation（原文逐語から導出、施行日の算定のみ）:
  平成 15 年 = 1988 + 15 = 2003（平成元年 = 1989、1989+15-1=2003）
  enforcementDate = (2003, 1, 6)
  inForce(date) = dateKey(date) >= 20030106

Scope / NOT MODELLED:
  - 附則の他の施行日（平成18年等）・経過措置は NOT MODELLED。
  - 物納財産収納後の手続の実体は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.PropertyInKindEnforcementDate

open JapanTaxLaw.TaxFinance

/-- 平成年を西暦に換算（平成元年 = 1989）。 -/
def heiseiToSeireki (heiseiYear : Nat) : Nat := 1988 + heiseiYear

/-- 施行日 = 平成15年1月6日 = 2003-01-06。 -/
def enforcementDate : Nat × Nat × Nat := (heiseiToSeireki 15, 1, 6)

/-- 暦日を Nat キー YYYYMMDD に符号化。 -/
def dateKey (d : Nat × Nat × Nat) : Nat := d.1 * 10000 + d.2.1 * 100 + d.2.2

def enforcementKey : Nat := dateKey enforcementDate

/-- 指定日が施行日以降か。 -/
def inForce (d : Nat × Nat × Nat) : Bool := dateKey d >= enforcementKey

example : heiseiToSeireki 15 = 2003 := by decide
example : enforcementDate = (2003, 1, 6) := by decide
example : enforcementKey = 20030106 := by decide
example : inForce (2003, 1, 6) = true := by decide
example : inForce (2003, 1, 5) = false := by decide

end JapanTaxLaw.PropertyInKindEnforcementDate
