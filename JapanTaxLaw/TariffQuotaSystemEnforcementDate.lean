import JapanTaxLaw.TaxFinance

/-!
# TariffQuotaSystemEnforcementDate — 関税割当制度に関する政令 施行日（附則 art.1）bounded L4 モデル

Sources (pinned):
  Law id: 336CO0000000153
  Revision: 336CO0000000153_20260401_508CO0000000085
  Raw snapshot: data/raw/336CO0000000153_20260401_508CO0000000085.law.json
  附則 Article 1 (施行期日). Needles contain no U+3000.

原文逐語（附則）:
  「第一条 この政令は、平成三年四月一日から施行する。」

Computation（原文逐語から導出、施行日の算定のみ）:
  平成 3 年 = 1988 + 3 = 1991（平成元年 = 1989、1989+3-1=1991）
  enforcementDate = (1991, 4, 1)
  inForce(d) = dateKey(d) >= 19910401

Scope / NOT MODELLED:
  - 附則の他条（経過措置等）・政令の実体規定は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.TariffQuotaSystemEnforcementDate

open JapanTaxLaw.TaxFinance

def heiseiToSeireki (heiseiYear : Nat) : Nat := 1988 + heiseiYear

/-- 施行日 = 平成3年4月1日 = 1991-04-01。 -/
def enforcementDate : Nat × Nat × Nat := (heiseiToSeireki 3, 4, 1)

def dateKey (d : Nat × Nat × Nat) : Nat := d.1 * 10000 + d.2.1 * 100 + d.2.2

def enforcementKey : Nat := dateKey enforcementDate

/-- 指定日が施行日以降か。 -/
def inForce (d : Nat × Nat × Nat) : Bool := dateKey d >= enforcementKey

example : heiseiToSeireki 3 = 1991 := by decide
example : enforcementDate = (1991, 4, 1) := by decide
example : enforcementKey = 19910401 := by decide
example : inForce (1991, 3, 31) = false := by decide
example : inForce (1991, 4, 1) = true := by decide

end JapanTaxLaw.TariffQuotaSystemEnforcementDate
