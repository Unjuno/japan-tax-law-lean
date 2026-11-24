import JapanTaxLaw.TaxFinance

/-!
# HeavyOilQuotaOrderEnforcementDate — 重油粗油関税割当制度省令 施行日（附則 art.1）bounded L4 モデル

Sources (pinned):
  Law id: 336M50000400035
  Revision: 336M50000400035_20201228_502M60000400092
  Raw snapshot: data/raw/336M50000400035_20201228_502M60000400092.law.json
  附則 Article 1 (施行期日). Needles contain no U+3000.

原文逐語（附則）:
  「第一条 この省令は、平成二十四年三月十九日から施行する。」

Computation（原文逐語から導出、施行日の算定のみ）:
  平成 24 年 = 1988 + 24 = 2012（平成元年 = 1989、1989+24-1=2012）
  enforcementDate = (2012, 3, 19)
  inForce(d) = dateKey(d) >= 20120319

Scope / NOT MODELLED:
  - 附則の他条（経過措置等）・省令の実体規定は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.HeavyOilQuotaOrderEnforcementDate

open JapanTaxLaw.TaxFinance

def heiseiToSeireki (heiseiYear : Nat) : Nat := 1988 + heiseiYear

/-- 施行日 = 平成24年3月19日 = 2012-03-19。 -/
def enforcementDate : Nat × Nat × Nat := (heiseiToSeireki 24, 3, 19)

/-- 暦日を Nat キー YYYYMMDD に符号化。 -/
def dateKey (d : Nat × Nat × Nat) : Nat := d.1 * 10000 + d.2.1 * 100 + d.2.2

def enforcementKey : Nat := dateKey enforcementDate

/-- 指定日が施行日以降か。 -/
def inForce (d : Nat × Nat × Nat) : Bool := dateKey d >= enforcementKey

example : heiseiToSeireki 24 = 2012 := by decide
example : enforcementDate = (2012, 3, 19) := by decide
example : enforcementKey = 20120319 := by decide
example : inForce (2012, 3, 18) = false := by decide
example : inForce (2012, 3, 19) = true := by decide

end JapanTaxLaw.HeavyOilQuotaOrderEnforcementDate
