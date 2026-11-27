import JapanTaxLaw.TaxFinance

/-!
# ForeignBondInterestExemptionScopeEnforcementDate — 外貨債利子非課税規定の適用除外者範囲政令 施行日（附則 art.1）bounded L4 モデル

Sources (pinned):
  Law id: 333CO0000000337
  Revision: 333CO0000000337_20171001_429CO0000000106
  Raw snapshot: data/raw/333CO0000000337_20171001_429CO0000000106.law.json
  附則 Article 1 (施行期日). Needles contain no U+3000.

原文逐語（附則）:
  「第一条 この政令は、昭和四十年四月一日から施行する。」

Computation（原文逐語から導出、施行日の算定のみ）:
  昭和 40 年 = 1925 + 40 = 1965（昭和元年 = 1926、1926+40-1=1965）
  enforcementDate = (1965, 4, 1)
  inForce(d) = dateKey(d) >= 19650401

Scope / NOT MODELLED:
  - 附則の他条（経過措置等）・政令の実体規定（適用を受けない者の範囲）は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.ForeignBondInterestExemptionScopeEnforcementDate

open JapanTaxLaw.TaxFinance

def showaToSeireki (showaYear : Nat) : Nat := 1925 + showaYear

/-- 施行日 = 昭和40年4月1日 = 1965-04-01。 -/
def enforcementDate : Nat × Nat × Nat := (showaToSeireki 40, 4, 1)

def dateKey (d : Nat × Nat × Nat) : Nat := d.1 * 10000 + d.2.1 * 100 + d.2.2

def enforcementKey : Nat := dateKey enforcementDate

/-- 指定日が施行日以降か。 -/
def inForce (d : Nat × Nat × Nat) : Bool := dateKey d >= enforcementKey

example : showaToSeireki 40 = 1965 := by decide
example : enforcementDate = (1965, 4, 1) := by decide
example : enforcementKey = 19650401 := by decide
example : inForce (1965, 3, 31) = false := by decide
example : inForce (1965, 4, 1) = true := by decide

end JapanTaxLaw.ForeignBondInterestExemptionScopeEnforcementDate
