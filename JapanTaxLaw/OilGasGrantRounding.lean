import JapanTaxLaw.TaxFinance

/-!
# OilGasGrantRounding — 石油ガス譲与税法 art.4（譲与時期ごとの譲与額の端数計算）

Sources (pinned):
  Law id: 340AC0000000157
  Revision: 340AC0000000157_20090401_421AC0000000009
  Raw snapshot: data/raw/340AC0000000157_20090401_421AC0000000009.law.json
  Provision: MainProvision / Article Num 4 / Paragraph 1

原文逐語:
  「各都道府県及び指定市に対する前条第一項に規定する各譲与時期ごとに
   譲与すべき石油ガス譲与税の額として前二条の規定を適用して計算した金額に
   千円未満の端数金額があるときは、その端数金額を控除した金額をもつて、
   当該各譲与時期ごとに譲与すべき石油ガス譲与税の額とする。」

Computation (原文逐語から導出):
  floorThousandYen x = x - (x % 1000)  — 千円未満の端数を控除。
  (written as x / 1000 * 1000 in the kernel implementation)

Scope: 本スライスは端数控除の数式のみ。前二条による譲与額本体の算定、
  譲与時期、指定市の認定、附則・経過措置は NOT MODELLED。
  本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.OilGasGrantRounding

open JapanTaxLaw.TaxFinance

/-- 端数単位 = 千円（原文「千円未満」）。 -/
def roundingUnitYen : Money := 1000

/-- 千円未満の端数を切り捨てた譲与額。 -/
def floorThousandYen (x : Money) : Money := x / roundingUnitYen * roundingUnitYen

example : floorThousandYen 0 = 0 := by decide
example : floorThousandYen 999 = 0 := by decide
example : floorThousandYen 1000 = 1000 := by decide
example : floorThousandYen 1001 = 1000 := by decide
example : floorThousandYen 1999 = 1000 := by decide
example : floorThousandYen 2000 = 2000 := by decide

end JapanTaxLaw.OilGasGrantRounding
