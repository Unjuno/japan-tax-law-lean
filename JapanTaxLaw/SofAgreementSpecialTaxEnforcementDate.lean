import JapanTaxLaw.TaxFinance

/-!
# SofAgreementSpecialTaxEnforcementDate — 日米安全保障条約第六条に基づく関税法特例法 施行日（附則 art.1）bounded L4 モデル

Sources (pinned):
  Law id: 327AC0000000113
  Revision: 327AC0000000113_20260401_508AC0000000012
  Raw snapshot: data/raw/data/raw/327AC0000000113_20260401_508AC0000000012.law.json
  附則 Article 1 (施行期日). Needles contain no U+3000.

原文逐語（附則）:
  「第一条 この法律は、昭和六十年四月一日から施行する。」

Computation（原文逐語から導出、施行日の算定のみ）:
  昭和 60 年 = 1925 + 60 = 1985（昭和元年 = 1926、1926+60-1=1985）
  enforcementDate = (1985, 4, 1)
  inForce(d) = dateKey(d) >= 19850401

Scope / NOT MODELLED:
  - 附則の他条（経過措置等）・法律の実体規定は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.SofAgreementSpecialTaxEnforcementDate

open JapanTaxLaw.TaxFinance

def showaToSeireki (showaYear : Nat) : Nat := 1925 + showaYear

/-- 施行日 = 昭和60年4月1日 = 1985-04-01。 -/
def enforcementDate : Nat × Nat × Nat := (showaToSeireki 60, 4, 1)

def dateKey (d : Nat × Nat × Nat) : Nat := d.1 * 10000 + d.2.1 * 100 + d.2.2

def enforcementKey : Nat := dateKey enforcementDate

/-- 指定日が施行日以降か。 -/
def inForce (d : Nat × Nat × Nat) : Bool := dateKey d >= enforcementKey

example : showaToSeireki 60 = 1985 := by decide
example : enforcementDate = (1985, 4, 1) := by decide
example : enforcementKey = 19850401 := by decide
example : inForce (1985, 3, 31) = false := by decide
example : inForce (1985, 4, 1) = true := by decide

end JapanTaxLaw.SofAgreementSpecialTaxEnforcementDate
