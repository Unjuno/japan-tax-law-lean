import JapanTaxLaw.TaxFinance

/-!
# FlatTaxRates — 13 の pinned 定额税率規定

Sources (pinned normative units; all verbatim rates):
  57115b067b1d 地方税法38条    個人均等割 標準 1,000円
  7f877c12a7a3 地方税法310条   個人均等割 標準 3,000円
  0ef7e0bd4973 地方税法76条    ゴルフ場利用税 一人一日 800円
  a72a527a443f 地方税法144条の10 軽油引取税 1kL 15,000円
  07c851b88f81 地方税法468条   たばこ税 千本 6,552円
  b8d04f750e2e 地方揮発油税法4条 4,400円/kL
  6a86796b8088 揮発油税法9条   24,300円/kL
  9bdfbdda5ae8 航空機燃料税法11条 26,000円/kL
  d4bbced0aa2c 電源開発促進税法6条 375円/千kWh
  069561073028 たばこ税法11条  千本 6,802円
  99600b1b32c1 国際観光旅客税法15条 出国一回 3,000円
  61b63c1b8aef 森林環境税法5条  1,000円
  e99baf5ca455 地方税法741条   大規模償却資産 固定資産税 標準 1.4% (14 per-mille)

Each constructor carries the integer amount in the unit stated in that
provision (円 per stated base, or per-mille for the last). Tax bases,
eligibility and rounding for fractional bases are caller-established and NOT
MODELLED. Not legal advice.
-/

namespace JapanTaxLaw.FlatTaxRates

/-- 13 の定额税率規定を区別する添字。 -/
inductive FlatRateKind where
  | individualEqualLow | individualEqualHigh | golfCourseUse | lightOil
  | tobaccoLocal | localGasoline | gasoline | aviationFuel
  | powerDevelopment | tobaccoNational | internationalTourist
  | forestEnvironment | fixedAssetLarge

deriving DecidableEq, Repr

/-- 実装: 原文の数値（規定ごとの単位で整数）。 -/
def flatAmount : FlatRateKind → Nat
  | FlatRateKind.individualEqualLow => 1_000
  | FlatRateKind.individualEqualHigh => 3_000
  | FlatRateKind.golfCourseUse => 800
  | FlatRateKind.lightOil => 15_000
  | FlatRateKind.tobaccoLocal => 6_552
  | FlatRateKind.localGasoline => 4_400
  | FlatRateKind.gasoline => 24_300
  | FlatRateKind.aviationFuel => 26_000
  | FlatRateKind.powerDevelopment => 375
  | FlatRateKind.tobaccoNational => 6_802
  | FlatRateKind.internationalTourist => 3_000
  | FlatRateKind.forestEnvironment => 1_000
  | FlatRateKind.fixedAssetLarge => 14

end JapanTaxLaw.FlatTaxRates
