import JapanTaxLaw.TaxFinance

/-!
# DutyFreeLightOilOrderEnforcementDate — 免税軽油引取手続省令 施行日（附則 art.1）bounded L4 モデル

Sources (pinned):
  Law id: 331M50000002047
  Revision: 331M50000002047_20090401_421M60000008036
  Raw snapshot: data/raw/331M50000002047_20090401_421M60000008036.law.json
  附則 Article 1 (施行期日). Needles contain no U+3000.

原文逐語（附則）:
  「第一条 この省令は、平成元年十月一日から施行する。」

Computation（原文逐語から導出、施行日の算定のみ）:
  平成元年 = 1989（平成元年 = 1989、1988+1=1989。元号の「元」は 1 を表す）
  enforcementDate = (1989, 10, 1)
  inForce(d) = dateKey(d) >= 19891001

Scope / NOT MODELLED:
  - 附則の他条（経過措置等）・省令の実体規定は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.DutyFreeLightOilOrderEnforcementDate

open JapanTaxLaw.TaxFinance

/-- 平成年を西暦に換算（平成元年 = 1989、「元」= 1）。 -/
def heiseiToSeireki (heiseiYear : Nat) : Nat := 1988 + heiseiYear

/-- 施行日 = 平成元年10月1日 = 1989-10-01。 -/
def enforcementDate : Nat × Nat × Nat := (heiseiToSeireki 1, 10, 1)

/-- 暦日を Nat キー YYYYMMDD に符号化。 -/
def dateKey (d : Nat × Nat × Nat) : Nat := d.1 * 10000 + d.2.1 * 100 + d.2.2

def enforcementKey : Nat := dateKey enforcementDate

/-- 指定日が施行日以降か。 -/
def inForce (d : Nat × Nat × Nat) : Bool := dateKey d >= enforcementKey

example : heiseiToSeireki 1 = 1989 := by decide
example : enforcementDate = (1989, 10, 1) := by decide
example : enforcementKey = 19891001 := by decide
example : inForce (1989, 9, 30) = false := by decide
example : inForce (1989, 10, 1) = true := by decide

end JapanTaxLaw.DutyFreeLightOilOrderEnforcementDate
