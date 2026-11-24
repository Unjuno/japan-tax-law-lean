import JapanTaxLaw.TaxFinance

/-!
# Vessel500Ton — 地方税法施行規則 art. 11_2（総トン数 五百トン以上の船舶）

Sources (pinned):

  Law id: 329M50000002023
  Revision: 329M50000002023_20261101_508M60000008045
  Raw snapshot: data/raw/329M50000002023_20261101_508M60000008045.law.json

Pinned 原文: 「総トン数五百トン以上の船舶であつて、総務大臣が当該船舶の構造、資格等からみて主として遠洋区域を航行区域とすると認めるもの」

Scoped claim: only the 総トン数 五百トン以上の船舶 threshold; other conditions are caller-established.
-/

namespace JapanTaxLaw.Vessel500Ton

def vesselFloor500 : Nat := 500

def hasVessel500Ton (x : Nat) : Bool :=
  decide (vesselFloor500 <= x)

theorem threshold_value : vesselFloor500 = 500 := rfl

end JapanTaxLaw.Vessel500Ton
