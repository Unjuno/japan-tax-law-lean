import JapanTaxLaw.TaxFinance

/-!
# OilCoalTaxRate — 石油石炭税法 art.9（税率）bounded L4 モデル

Sources (pinned):
  Law id: 353AC0000000025
  Revision: 353AC0000000025_20260525_506AC0000000052
  Raw snapshot: data/raw/353AC0000000025_20260525_506AC0000000052.law.json
  Article Num 9, flat/normalized leaf text 99 chars, U+3000 count 0.

原文逐語:
  「一原油及び石油製品一キロリットルにつき二千四十円
   二ガス状炭化水素一トンにつき千八十円
   三石炭一トンにつき七百円」

Computation（原文逐語から導出、税率定数のみ）:
  crudeOilRatePerKL   = 2,040（原油・石油製品 1キロリットルあたり）
  gaseousHCRatePerTon = 1,080（ガス状炭化水素 1トンあたり）
  coalRatePerTon      =   700（石炭 1トンあたり）
  tax = rate × quantity（数量単位は区分ごとに異なる）

Scope / NOT MODELLED:
  - 各区分の物的定義（原油/石油製品/ガス状炭化水素/石炭）、課税標準、
    申告・納付手続は NOT MODELLED。
  - 本スライスは 3 つの税率定数と tax=rate×quantity のみを扱う。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.OilCoalTaxRate

open JapanTaxLaw.TaxFinance

/-- 原油・石油製品の税率 = 2040円/kL。 -/
def crudeOilRatePerKL : Money := 2_040
/-- ガス状炭化水素の税率 = 1080円/t。 -/
def gaseousHCRatePerTon : Money := 1_080
/-- 石炭の税率 = 700円/t。 -/
def coalRatePerTon : Money := 700

/-- 原油・石油製品の税額 = 2040 × キロリットル数。 -/
def crudeOilTax (kL : Nat) : Money := crudeOilRatePerKL * kL
/-- ガス状炭化水素の税額 = 1080 × トン数。 -/
def gaseousHCTax (tons : Nat) : Money := gaseousHCRatePerTon * tons
/-- 石炭の税額 = 700 × トン数。 -/
def coalTax (tons : Nat) : Money := coalRatePerTon * tons

example : crudeOilRatePerKL = 2_040 := by decide
example : gaseousHCRatePerTon = 1_080 := by decide
example : coalRatePerTon = 700 := by decide
example : crudeOilTax 1 = 2_040 := by decide
example : gaseousHCTax 2 = 2_160 := by decide
example : coalTax 3 = 2_100 := by decide

end JapanTaxLaw.OilCoalTaxRate
