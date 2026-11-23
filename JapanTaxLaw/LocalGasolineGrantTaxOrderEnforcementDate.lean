import JapanTaxLaw.TaxFinance

/-!
# LocalGasolineGrantTaxOrderEnforcementDate — 地方揮発油譲与税法施行令 施行日（附則 art.1）bounded L4 モデル

Sources (pinned):
  Law id: 344CO0000000088
  Revision: 344CO0000000088_20090401_421CO0000000100
  Raw snapshot: data/raw/344CO0000000088_20090401_421CO0000000100.law.json
  附則 Article 1 (施行期日). Needles contain no U+3000.

原文逐語（附則）:
  「第一条 この政令は、昭和五十一年四月一日から施行する。」

Computation（原文逐語から導出、施行日の算定のみ）:
  昭和 51 年 = 1925 + 51 = 1976（昭和元年 = 1926、1926+51-1=1976）
  enforcementDate = (1976, 4, 1)
  inForce(d) = dateKey(d) >= 19760401

Scope / NOT MODELLED:
  - 附則の他条（経過措置等）・施行令の実体規定は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.LocalGasolineGrantTaxOrderEnforcementDate

open JapanTaxLaw.TaxFinance

def showaToSeireki (showaYear : Nat) : Nat := 1925 + showaYear

/-- 施行日 = 昭和51年4月1日 = 1976-04-01。 -/
def enforcementDate : Nat × Nat × Nat := (showaToSeireki 51, 4, 1)

/-- 暦日を Nat キー YYYYMMDD に符号化。 -/
def dateKey (d : Nat × Nat × Nat) : Nat := d.1 * 10000 + d.2.1 * 100 + d.2.2

def enforcementKey : Nat := dateKey enforcementDate

/-- 指定日が施行日以降か。 -/
def inForce (d : Nat × Nat × Nat) : Bool := dateKey d >= enforcementKey

example : showaToSeireki 51 = 1976 := by decide
example : enforcementDate = (1976, 4, 1) := by decide
example : enforcementKey = 19760401 := by decide
example : inForce (1976, 3, 31) = false := by decide
example : inForce (1976, 4, 1) = true := by decide

end JapanTaxLaw.LocalGasolineGrantTaxOrderEnforcementDate
