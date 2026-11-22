import JapanTaxLaw.TaxFinance

/-!
# GolfRateCeiling1200 — 地方税法 art. 76（ゴルフ場利用税の税率上限 千二百円）

Sources (pinned):

  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Raw snapshot: data/raw/325AC0000000226_20261101_508AC0000000002.law.json

Pinned 原文: 「千二百円を超える税率で課することができない。」

Scoped claim: only the ゴルフ場利用税の税率上限 千二百円; other conditions are caller-established.
-/

namespace JapanTaxLaw.GolfRateCeiling1200

def golfRateCapYen : Nat := 1200

def withinGolfRate (x : Nat) : Bool :=
  decide (x <= golfRateCapYen)

theorem threshold_value : golfRateCapYen = 1200 := rfl

end JapanTaxLaw.GolfRateCeiling1200
