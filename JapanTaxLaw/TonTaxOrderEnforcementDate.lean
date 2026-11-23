import JapanTaxLaw.TaxFinance

/-!
# TonTaxOrderEnforcementDate — とん税法施行令 施行日（附則 art.1）bounded L4 モデル

Sources (pinned):
  Law id: 332CO0000000048
  Revision: 332CO0000000048_20201001_502CO0000000128
  Raw snapshot: data/raw/332CO0000000048_20201001_502CO0000000128.law.json
  附則 Article 1 (施行期日). Needles contain no U+3000.

原文逐語（附則）:
  「第一条 この政令は、昭和六十四年四月一日から施行する。」

Computation（原文逐語から導出、施行日の算定のみ）:
  昭和 64 年 = 1925 + 64 = 1989（昭和元年 = 1926、1926+64-1=1989。昭和最後の年）
  enforcementDate = (1989, 4, 1)
  inForce(d) = dateKey(d) >= 19890401

Scope / NOT MODELLED:
  - 附則の他条（経過措置等）・とん税法施行令の実体規定は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.TonTaxOrderEnforcementDate

open JapanTaxLaw.TaxFinance

/-- 昭成年を西暦に換算（昭和元年 = 1926）。 -/
def showaToSeireki (showaYear : Nat) : Nat := 1925 + showaYear

/-- 施行日 = 昭和64年4月1日 = 1989-04-01（昭和最後の年）。 -/
def enforcementDate : Nat × Nat × Nat := (showaToSeireki 64, 4, 1)

/-- 暦日を Nat キー YYYYMMDD に符号化。 -/
def dateKey (d : Nat × Nat × Nat) : Nat := d.1 * 10000 + d.2.1 * 100 + d.2.2

def enforcementKey : Nat := dateKey enforcementDate

/-- 指定日が施行日以降か。 -/
def inForce (d : Nat × Nat × Nat) : Bool := dateKey d >= enforcementKey

example : showaToSeireki 64 = 1989 := by decide
example : enforcementDate = (1989, 4, 1) := by decide
example : enforcementKey = 19890401 := by decide
example : inForce (1989, 3, 31) = false := by decide
example : inForce (1989, 4, 1) = true := by decide

end JapanTaxLaw.TonTaxOrderEnforcementDate
