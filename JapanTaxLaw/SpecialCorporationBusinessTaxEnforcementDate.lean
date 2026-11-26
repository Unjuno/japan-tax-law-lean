import JapanTaxLaw.TaxFinance

/-!
# SpecialCorporationBusinessTaxEnforcementDate — 特別法人事業税及び特別法人事業譲与税に関する法律施行令 施行日（附則 art.1）bounded L4 モデル

Sources (pinned):
  Law id: 431CO0000000089
  Revision: 431CO0000000089_20240401_506CO0000000012
  Raw snapshot: data/raw/431CO0000000089_20240401_506CO0000000012.law.json
  附則 Article 1 (施行期日). Needles contain no U+3000.

原文逐語（附則）:
  「第一条 この政令は、平成三十一年十月一日から施行する。」

Computation（原文逐語から導出、施行日の算定のみ）:
  平成 31 年 = 1988 + 31 = 2019（平成元年 = 1989、1989+31-1=2019）
  enforcementDate = (2019, 10, 1)
  inForce(d) = dateKey(d) >= 20191001

Scope / NOT MODELLED:
  - 附則の他条（経過措置等）・政令の実体規定（特別法人事業税の課税要件・申告等）は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.SpecialCorporationBusinessTaxEnforcementDate

open JapanTaxLaw.TaxFinance

def heiseiToSeireki (heiseiYear : Nat) : Nat := 1988 + heiseiYear

/-- 施行日 = 平成31年10月1日 = 2019-10-01。 -/
def enforcementDate : Nat × Nat × Nat := (heiseiToSeireki 31, 10, 1)

def dateKey (d : Nat × Nat × Nat) : Nat := d.1 * 10000 + d.2.1 * 100 + d.2.2

def enforcementKey : Nat := dateKey enforcementDate

/-- 指定日が施行日以降か。 -/
def inForce (d : Nat × Nat × Nat) : Bool := dateKey d >= enforcementKey

example : heiseiToSeireki 31 = 2019 := by decide
example : enforcementDate = (2019, 10, 1) := by decide
example : enforcementKey = 20191001 := by decide
example : inForce (2019, 9, 30) = false := by decide
example : inForce (2019, 10, 1) = true := by decide

end JapanTaxLaw.SpecialCorporationBusinessTaxEnforcementDate
