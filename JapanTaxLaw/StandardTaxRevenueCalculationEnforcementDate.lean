import JapanTaxLaw.TaxFinance

/-!
# StandardTaxRevenueCalculationEnforcementDate — 都及び特別区の標準税収入額の算定方法に関する省令 施行日（附則 art.1）bounded L4 モデル

Sources (pinned):
  Law id: 429M60000008030
  Revision: 429M60000008030_20260401_508M60000008048
  Raw snapshot: data/raw/429M60000008030_20260401_508M60000008048.law.json
  附則 Article 1 (施行期日). Needles contain no U+3000.

原文逐語（附則）:
  「第一条 この省令は、平成三十一年四月一日から施行する。」

Computation（原文逐語から導出、施行日の算定のみ）:
  平成 31 年 = 1988 + 31 = 2019（平成元年 = 1989、1989+31-1=2019）
  enforcementDate = (2019, 4, 1)
  inForce(d) = dateKey(d) >= 20190401

Scope / NOT MODELLED:
  - 附則の他条（経過措置等）・省令の実体規定（標準税収入額の算定方法等）は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.StandardTaxRevenueCalculationEnforcementDate

open JapanTaxLaw.TaxFinance

def heiseiToSeireki (heiseiYear : Nat) : Nat := 1988 + heiseiYear

/-- 施行日 = 平成31年4月1日 = 2019-04-01。 -/
def enforcementDate : Nat × Nat × Nat := (heiseiToSeireki 31, 4, 1)

def dateKey (d : Nat × Nat × Nat) : Nat := d.1 * 10000 + d.2.1 * 100 + d.2.2

def enforcementKey : Nat := dateKey enforcementDate

/-- 指定日が施行日以降か。 -/
def inForce (d : Nat × Nat × Nat) : Bool := dateKey d >= enforcementKey

example : heiseiToSeireki 31 = 2019 := by decide
example : enforcementDate = (2019, 4, 1) := by decide
example : enforcementKey = 20190401 := by decide
example : inForce (2019, 3, 31) = false := by decide
example : inForce (2019, 4, 1) = true := by decide

end JapanTaxLaw.StandardTaxRevenueCalculationEnforcementDate
