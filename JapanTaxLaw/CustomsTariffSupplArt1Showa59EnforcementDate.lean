import JapanTaxLaw.TaxFinance

/-!
# CustomsTariffSupplArt1Showa59EnforcementDate — 関税定率法 附則 art.1（昭和59年施行）bounded L4 モデル

Sources (pinned):
  Law id: 143AC0000000054
  Revision: 143AC0000000054_20260601_508AC0000000005
  Raw snapshot: data/raw/143AC0000000054_20260601_508AC0000000005.law.json
  附則 Article 1 (施行期日). Needles contain no U+3000.

原文逐語（附則）:
  「第一条 この法律は、昭和五十九年四月一日から施行する。」

Computation（原文逐語から導出、施行日の算算のみ）:
  昭和 59 年 = 1925 + 59 = 1984（昭和元年 = 1926、1925+59=1984）
  enforcementDate = (1984, 4, 1)
  inForce(d) = dateKey(d) >= 19840401

Scope / NOT MODELLED:
  - 同条のただし書「次の各号に掲げる改正規定は、当該各号に掲げる日から施行する」
    は NOT MODELLED（各号ごとの施行日を本モデルでは扱わない）。
  - 附則の他条（経過措置等）・関税定率法の実体規定（税率・課税要件・手続等）は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.CustomsTariffSupplArt1Showa59EnforcementDate

open JapanTaxLaw.TaxFinance

def showaToSeireki (showaYear : Nat) : Nat := 1925 + showaYear

/-- 施行日 = 昭和59年4月1日 = 1984-04-01。 -/
def enforcementDate : Nat × Nat × Nat := (showaToSeireki 59, 4, 1)

def dateKey (d : Nat × Nat × Nat) : Nat := d.1 * 10000 + d.2.1 * 100 + d.2.2

def enforcementKey : Nat := dateKey enforcementDate

/-- 指定された施行日以後のみ。 -/
def inForce (d : Nat × Nat × Nat) : Bool := dateKey d >= enforcementKey

example : showaToSeireki 59 = 1984 := by decide
example : enforcementDate = (1984, 4, 1) := by decide
example : enforcementKey = 19840401 := by decide
example : inForce (1984, 3, 31) = false := by decide
example : inForce (1984, 4, 1) = true := by decide

end JapanTaxLaw.CustomsTariffSupplArt1Showa59EnforcementDate
