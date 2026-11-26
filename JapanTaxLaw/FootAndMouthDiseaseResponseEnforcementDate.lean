import JapanTaxLaw.TaxFinance

/-!
# FootAndMouthDiseaseResponseEnforcementDate — 口蹄疫に起因する事態への対応に関する政令 施行日（附則 art.1）bounded L4 モデル

Sources (pinned):
  Law id: 422CO0000000222
  Revision: 422CO0000000222_20220401_502CO0000000207
  Raw snapshot: data/raw/422CO0000000222_20220401_502CO0000000207.law.json
  附則 Article 1 (施行期日). Needles contain no U+3000.

原文逐語（附則）:
  「第一条 この政令は、令和四年四月一日から施行する。」

Computation（原文逐語から導出、施行日の算定のみ）:
  令和 4 年 = 2018 + 4 = 2022（令和元年 = 2019、2019+4-1=2022）
  enforcementDate = (2022, 4, 1)
  inForce(d) = dateKey(d) >= 20220401

Scope / NOT MODELLED:
  - 附則の他条（経過措置等）・政令の実体規定（口蹄疫対応措置の適用要件等）は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.FootAndMouthDiseaseResponseEnforcementDate

open JapanTaxLaw.TaxFinance

def reiwaToSeireki (reiwaYear : Nat) : Nat := 2018 + reiwaYear

/-- 施行日 = 令和4年4月1日 = 2022-04-01。 -/
def enforcementDate : Nat × Nat × Nat := (reiwaToSeireki 4, 4, 1)

def dateKey (d : Nat × Nat × Nat) : Nat := d.1 * 10000 + d.2.1 * 100 + d.2.2

def enforcementKey : Nat := dateKey enforcementDate

/-- 指定日が施行日以降か。 -/
def inForce (d : Nat × Nat × Nat) : Bool := dateKey d >= enforcementKey

example : reiwaToSeireki 4 = 2022 := by decide
example : enforcementDate = (2022, 4, 1) := by decide
example : enforcementKey = 20220401 := by decide
example : inForce (2022, 3, 31) = false := by decide
example : inForce (2022, 4, 1) = true := by decide

end JapanTaxLaw.FootAndMouthDiseaseResponseEnforcementDate
