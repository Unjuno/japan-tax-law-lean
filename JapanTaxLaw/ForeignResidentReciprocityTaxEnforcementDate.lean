import JapanTaxLaw.TaxFinance

/-!
# ForeignResidentReciprocityTaxEnforcementDate — 外国居住者等の所得に対する相互主義による所得税等の非課税等に関する省令 施行日（附則 art.1）bounded L4 モデル

Sources (pinned):
  Law id: 428M60000048005
  Revision: 428M60000048005_20260101_506M60000048004
  Raw snapshot: data/raw/428M60000048005_20260101_506M60000048004.law.json
  附則 Article 1 (施行期日). Needles contain no U+3000.

原文逐語（附則）:
  「第一条 この省令は、平成三十年一月一日から施行する。」

Computation（原文逐語から導出、施行日の算定のみ）:
  平成 30 年 = 1988 + 30 = 2018（平成元年 = 1989、1989+30-1=2018）
  enforcementDate = (2018, 1, 1)
  inForce(d) = dateKey(d) >= 20180101

Scope / NOT MODELLED:
  - 附則の他条（経過措置等）・省令の実体規定（相互主義による非課税の適用要件等）は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.ForeignResidentReciprocityTaxEnforcementDate

open JapanTaxLaw.TaxFinance

def heiseiToSeireki (heiseiYear : Nat) : Nat := 1988 + heiseiYear

/-- 施行日 = 平成30年1月1日 = 2018-01-01。 -/
def enforcementDate : Nat × Nat × Nat := (heiseiToSeireki 30, 1, 1)

def dateKey (d : Nat × Nat × Nat) : Nat := d.1 * 10000 + d.2.1 * 100 + d.2.2

def enforcementKey : Nat := dateKey enforcementDate

/-- 指定日が施行日以降か。 -/
def inForce (d : Nat × Nat × Nat) : Bool := dateKey d >= enforcementKey

example : heiseiToSeireki 30 = 2018 := by decide
example : enforcementDate = (2018, 1, 1) := by decide
example : enforcementKey = 20180101 := by decide
example : inForce (2017, 12, 31) = false := by decide
example : inForce (2018, 1, 1) = true := by decide

end JapanTaxLaw.ForeignResidentReciprocityTaxEnforcementDate
