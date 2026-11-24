import JapanTaxLaw.TaxFinance

/-!
# ForeignCapitalSpecialOrderEnforcementDate — 国際復興開発銀行等外資受入特別措置政令 施行日（附則 art.1）bounded L4 モデル

Sources (pinned):
  Law id: 340CO0000000084
  Revision: 340CO0000000084_20171001_429CO0000000106
  Raw snapshot: data/raw/340CO0000000084_20171001_429CO0000000106.law.json
  附則 Article 1 (施行期日). Needles contain no U+3000.

原文逐語（附則）:
  「第一条 この政令は、平成二十六年四月一日から施行する。」

Computation（原文逐語から導出、施行日の算定のみ）:
  平成 26 年 = 1988 + 26 = 2014（平成元年 = 1989、1989+26-1=2014）
  enforcementDate = (2014, 4, 1)
  inForce(d) = dateKey(d) >= 20140401

Scope / NOT MODELLED:
  - 附則の他条（経過措置等）・政令の実体規定（外資受入の特別措置）は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.ForeignCapitalSpecialOrderEnforcementDate

open JapanTaxLaw.TaxFinance

def heiseiToSeireki (heiseiYear : Nat) : Nat := 1988 + heiseiYear

/-- 施行日 = 平成26年4月1日 = 2014-04-01。 -/
def enforcementDate : Nat × Nat × Nat := (heiseiToSeireki 26, 4, 1)

/-- 暦日を Nat キー YYYYMMDD に符号化。 -/
def dateKey (d : Nat × Nat × Nat) : Nat := d.1 * 10000 + d.2.1 * 100 + d.2.2

def enforcementKey : Nat := dateKey enforcementDate

/-- 指定日が施行日以降か。 -/
def inForce (d : Nat × Nat × Nat) : Bool := dateKey d >= enforcementKey

example : heiseiToSeireki 26 = 2014 := by decide
example : enforcementDate = (2014, 4, 1) := by decide
example : enforcementKey = 20140401 := by decide
example : inForce (2014, 3, 31) = false := by decide
example : inForce (2014, 4, 1) = true := by decide

end JapanTaxLaw.ForeignCapitalSpecialOrderEnforcementDate
