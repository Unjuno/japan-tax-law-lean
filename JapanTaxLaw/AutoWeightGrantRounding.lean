import JapanTaxLaw.TaxFinance

/-!
# AutoWeightGrantRounding — 自動車重量譲与税法 art.4（譲与額の千円未満端数）

Sources (pinned):
  Law id: 346AC0000000090
  Revision: 346AC0000000090_20260401_508AC0000000002
  Raw snapshot: data/raw/346AC0000000090_20260401_508AC0000000002.law.json
  Provision: MainProvision / Article Num 4 / Paragraph 1

原文逐語:
  「各市町村に対する前条第一項に規定する各譲与時期に譲与すべき自動車重量
   譲与税の額として前三条の規定を適用して計算した金額に千円未満の端数金額が
   あるときは、その端数金額を控除した金額をもつて、当該各譲与時期に譲与すべき
   自動車重量譲与税の額とする。」

Computation: floorThousandYen x = x / 1000 * 1000 — 千円未満の端数を控除。
Scope: 端数処理のみ。前三条の譲与額本体、譲与時期、附則は NOT MODELLED。
-/

namespace JapanTaxLaw.AutoWeightGrantRounding

open JapanTaxLaw.TaxFinance

def roundingUnitYen : Money := 1000

def floorThousandYen (x : Money) : Money := x / roundingUnitYen * roundingUnitYen

example : floorThousandYen 0 = 0 := by decide
example : floorThousandYen 999 = 0 := by decide
example : floorThousandYen 1000 = 1000 := by decide
example : floorThousandYen 1001 = 1000 := by decide

end JapanTaxLaw.AutoWeightGrantRounding
