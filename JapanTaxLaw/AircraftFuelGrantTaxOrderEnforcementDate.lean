import JapanTaxLaw.TaxFinance

/-!
# AircraftFuelGrantTaxOrderEnforcementDate — 航空機燃料譲与税法施行令 施行日（附則 art.1）bounded L4 モデル

Sources (pinned):
  Law id: 347CO0000000167
  Revision: 347CO0000000167_20140312_426CO0000000059
  Raw snapshot: data/raw/347CO0000000167_20140312_426CO0000000059.law.json
  附則 Article 1 (施行期日). Needles contain no U+3000.

原文逐語（附則）:
  「第一条 この政令は、昭和五十四年四月一日から施行する。」

Computation（原文逐語から導出、施行日の算定のみ）:
  昭和 54 年 = 1925 + 54 = 1979（昭和元年 = 1926、1926+54-1=1979）
  enforcementDate = (1979, 4, 1)
  inForce(d) = dateKey(d) >= 19790401

Scope / NOT MODELLED:
  - 附則の他条（経過措置等）・施行令の実体規定は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.AircraftFuelGrantTaxOrderEnforcementDate

open JapanTaxLaw.TaxFinance

def showaToSeireki (showaYear : Nat) : Nat := 1925 + showaYear

/-- 施行日 = 昭和54年4月1日 = 1979-04-01。 -/
def enforcementDate : Nat × Nat × Nat := (showaToSeireki 54, 4, 1)

/-- 暦日を Nat キー YYYYMMDD に符号化。 -/
def dateKey (d : Nat × Nat × Nat) : Nat := d.1 * 10000 + d.2.1 * 100 + d.2.2

def enforcementKey : Nat := dateKey enforcementDate

/-- 指定日が施行日以降か。 -/
def inForce (d : Nat × Nat × Nat) : Bool := dateKey d >= enforcementKey

example : showaToSeireki 54 = 1979 := by decide
example : enforcementDate = (1979, 4, 1) := by decide
example : enforcementKey = 19790401 := by decide
example : inForce (1979, 3, 31) = false := by decide
example : inForce (1979, 4, 1) = true := by decide

end JapanTaxLaw.AircraftFuelGrantTaxOrderEnforcementDate
