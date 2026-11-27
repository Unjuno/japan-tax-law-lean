import JapanTaxLaw.TaxFinance

/-!
# CustomsOfficerBadgeFormEnforcementDate — 税関職員の身分を示す証票等の書式に関する省令 施行日（附則 art.1）bounded L4 モデル

Sources (pinned):
  Law id: 329M50000040064
  Revision: 329M50000040064_20220401_504M60000040011
  Raw snapshot: data/raw/329M50000040064_20220401_504M60000040011.law.json
  附則 Article 1 (施行期日). Needles contain no U+3000.

原文逐語（附則）:
  「第一条 この省令は、昭和五十二年七月一日から施行する。」

Computation（原文逐語から導出、施行日の算定のみ）:
  昭和 52 年 = 1925 + 52 = 1977（昭和元年 = 1926、1926+52-1=1977）
  enforcementDate = (1977, 7, 1)
  inForce(d) = dateKey(d) >= 19770701

Scope / NOT MODELLED:
  - 附則の他条（経過措置等）・省令の実体規定（証票の様式・記載事項等）は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.CustomsOfficerBadgeFormEnforcementDate

open JapanTaxLaw.TaxFinance

def showaToSeireki (showaYear : Nat) : Nat := 1925 + showaYear

/-- 施行日 = 昭和52年7月1日 = 1977-07-01。 -/
def enforcementDate : Nat × Nat × Nat := (showaToSeireki 52, 7, 1)

def dateKey (d : Nat × Nat × Nat) : Nat := d.1 * 10000 + d.2.1 * 100 + d.2.2

def enforcementKey : Nat := dateKey enforcementDate

/-- 指定日が施行日以降か。 -/
def inForce (d : Nat × Nat × Nat) : Bool := dateKey d >= enforcementKey

example : showaToSeireki 52 = 1977 := by decide
example : enforcementDate = (1977, 7, 1) := by decide
example : enforcementKey = 19770701 := by decide
example : inForce (1977, 6, 30) = false := by decide
example : inForce (1977, 7, 1) = true := by decide

end JapanTaxLaw.CustomsOfficerBadgeFormEnforcementDate
