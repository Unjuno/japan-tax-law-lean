import JapanTaxLaw.TaxFinance

/-!
# LocalGasolineTaxOrderEnforcementDate — 地方揮発油税法施行令 施行日（附則 art.1）bounded L4 モデル

Sources (pinned):
  Law id: 330CO0000000151
  Revision: 330CO0000000151_20241001_506CO0000000148
  Raw snapshot: data/raw/330CO0000000151_20241001_506CO0000000148.law.json
  附則 Article 1 (施行期日). Needles contain no U+3000.

原文逐語（附則）:
  「第一条 この政令は、昭和四十一年四月一日から施行する。」

Computation（原文逐語から導出、施行日の算定のみ）:
  昭和 41 年 = 1925 + 41 = 1966（昭和元年 = 1926、1926+41-1=1966）
  enforcementDate = (1966, 4, 1)
  inForce(d) = dateKey(d) >= 19660401

Scope / NOT MODELLED:
  - 附則の他の条（経過措置等）は NOT MODELLED。
  - 地方揮発油税法施行令の実体規定は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.LocalGasolineTaxOrderEnforcementDate

open JapanTaxLaw.TaxFinance

/-- 昭成年を西暦に換算（昭和元年 = 1926）。 -/
def showaToSeireki (showaYear : Nat) : Nat := 1925 + showaYear

/-- 施行日 = 昭和41年4月1日 = 1966-04-01。 -/
def enforcementDate : Nat × Nat × Nat := (showaToSeireki 41, 4, 1)

/-- 暦日を Nat キー YYYYMMDD に符号化。 -/
def dateKey (d : Nat × Nat × Nat) : Nat := d.1 * 10000 + d.2.1 * 100 + d.2.2

def enforcementKey : Nat := dateKey enforcementDate

/-- 指定日が施行日以降か。 -/
def inForce (d : Nat × Nat × Nat) : Bool := dateKey d >= enforcementKey

example : showaToSeireki 41 = 1966 := by decide
example : enforcementDate = (1966, 4, 1) := by decide
example : enforcementKey = 19660401 := by decide
example : inForce (1966, 4, 1) = true := by decide
example : inForce (1966, 3, 31) = false := by decide

end JapanTaxLaw.LocalGasolineTaxOrderEnforcementDate
