import JapanTaxLaw.TaxFinance

/-!
# UnForcesStatusAgreementEnforcementDate — 国連軍地位協定実施法 施行日（附則 art.1）bounded L4 モデル

Sources (pinned):
  Law id: 329AC0000000188
  Revision: 329AC0000000188_20260401_508AC0000000002
  Raw snapshot: data/raw/data/raw/329AC0000000188_20260401_508AC0000000002.law.json
  附則 Article 1 (施行期日). Needles contain no U+3000.

原文逐語（附則）:
  「第一条 この法律は、昭和三十五年七月一日から施行する。」

Computation（原文逐語から導出、施行日の算定のみ）:
  昭和 35 年 = 1925 + 35 = 1960（昭和元年 = 1926、1926+35-1=1960）
  enforcementDate = (1960, 7, 1)
  inForce(d) = dateKey(d) >= 19600701

Scope / NOT MODELLED:
  - 附則の他条（経過措置等）・法律の実体規定は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.UnForcesStatusAgreementEnforcementDate

open JapanTaxLaw.TaxFinance

def showaToSeireki (showaYear : Nat) : Nat := 1925 + showaYear

/-- 施行日 = 昭和35年7月1日 = 1960-07-01。 -/
def enforcementDate : Nat × Nat × Nat := (showaToSeireki 35, 7, 1)

def dateKey (d : Nat × Nat × Nat) : Nat := d.1 * 10000 + d.2.1 * 100 + d.2.2

def enforcementKey : Nat := dateKey enforcementDate

/-- 指定日が施行日以降か。 -/
def inForce (d : Nat × Nat × Nat) : Bool := dateKey d >= enforcementKey

example : showaToSeireki 35 = 1960 := by decide
example : enforcementDate = (1960, 7, 1) := by decide
example : enforcementKey = 19600701 := by decide
example : inForce (1960, 6, 30) = false := by decide
example : inForce (1960, 7, 1) = true := by decide

end JapanTaxLaw.UnForcesStatusAgreementEnforcementDate
