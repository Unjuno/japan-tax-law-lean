import JapanTaxLaw.TaxFinance

/-!
# VehicleWeightUnit — 自動車重量税法 art. 7（〇・五トン単位の算定）

Sources (pinned):

  Law id: 346AC0000000089
  Revision: 346AC0000000089_20220401_504AC0000000004
  Raw snapshot: data/raw/346AC0000000089_20220401_504AC0000000004.law.json

Pinned 原文: 「車両重量〇・五トン又はその端数ごとに七千五百円」

Scoped claim: only the number of chargeable 0.5-ton units for a vehicle weight
expressed in tenths of a ton (a fraction counts as one full unit). The amount
per unit, vehicle category and inspection period are caller-established.
-/

namespace JapanTaxLaw.VehicleWeightUnit

/-- One unit is 〇・五トン = 5 tenths of a ton; ceiling division by 5. -/
def weightUnits (weightTenths : Nat) : Nat :=
  (weightTenths + 5 - 1) / 5

end JapanTaxLaw.VehicleWeightUnit
