import JapanTaxLaw.TaxFinance

/-!
# InternationalTouristTaxEnforcementDate — 国際観光旅客税法施行令 施行日（附則 art.1）bounded L4 モデル

Sources (pinned):
  Law id: 430CO0000000161
  Revision: 430CO0000000161_20190107_000000000000000
  Raw snapshot: data/raw/430CO0000000161_20190107_000000000000000.law.json
  附則 Article 1 (施行期日). Needles contain no U+3000.

原文逐語（附則）:
  「第一条 この政令は、平成三十一年一月七日から施行する。」

Computation（原文逐語から導出、施行日の算定のみ）:
  平成 31 年 = 1988 + 31 = 2019（平成元年 = 1989、1989+31-1=2019）
  enforcementDate = (2019, 1, 7)
  inForce(d) = dateKey(d) >= 20190107

Scope / NOT MODELLED:
  - 附則の他条（経過措置等）・政令の実体規定（国際観光旅客税の課税要件・手続等）は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.InternationalTouristTaxEnforcementDate

open JapanTaxLaw.TaxFinance

def heiseiToSeireki (heiseiYear : Nat) : Nat := 1988 + heiseiYear

/-- 施行日 = 平成31年1月7日 = 2019-01-07。 -/
def enforcementDate : Nat × Nat × Nat := (heiseiToSeireki 31, 1, 7)

def dateKey (d : Nat × Nat × Nat) : Nat := d.1 * 10000 + d.2.1 * 100 + d.2.2

def enforcementKey : Nat := dateKey enforcementDate

/-- 指定日が施行日以降か。 -/
def inForce (d : Nat × Nat × Nat) : Bool := dateKey d >= enforcementKey

example : heiseiToSeireki 31 = 2019 := by decide
example : enforcementDate = (2019, 1, 7) := by decide
example : enforcementKey = 20190107 := by decide
example : inForce (2019, 1, 6) = false := by decide
example : inForce (2019, 1, 7) = true := by decide

end JapanTaxLaw.InternationalTouristTaxEnforcementDate
