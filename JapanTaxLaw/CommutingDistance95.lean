import JapanTaxLaw.TaxFinance

/-!
# CommutingDistance95 — 所得税法施行令 art. 20の2（通勤距離 片道九十五キロメートル以上）

Sources (pinned):

  Law id: 340CO0000000096
  Revision: 340CO0000000096_20260522_508CO0000000093
  Raw snapshot: data/raw/340CO0000000096_20260522_508CO0000000093.law.json

Pinned 原文: 「その通勤の距離が片道九十五キロメートル以上である場合」

Scoped claim: only the 95 km one-way commuting-distance threshold; the commuting-status conditions are caller-established.
-/

namespace JapanTaxLaw.CommutingDistance95

def commuteThresholdKm : Nat := 95

def withinCommute (km : Nat) : Bool :=
  decide (95 <= km)

theorem threshold_value : commuteThresholdKm = 95 := rfl

end JapanTaxLaw.CommutingDistance95
