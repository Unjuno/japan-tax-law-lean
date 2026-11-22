import JapanTaxLaw.PetroleumGasSenRate

/-
# PetroleumGasSenRateSpec — independent spec for 石油ガス税法 art.10（十七円五十銭）

Pinned source:
  Law id: 340AC0000000156
  Revision: 340AC0000000156_20260525_506AC0000000052
  Raw snapshot: data/raw/340AC0000000156_20260525_506AC0000000052.law.json
  SHA-256: 537d080b0297f777c2ef10a5b7439b00c09cb6dfe1c28c40fdfeac346f36f153
  Statutory article: 第十条 (art. 10; raw JSON Article attr.Num = "10")
  原文逐語: 「石油ガス税の税率は、課税石油ガス一キログラムにつき、十七円五十銭とする。」

INDEPENDENT FORMULATION. This module owns its own statutory constants
`specYen : Nat := 17` (十七円) and `specSen : Nat := 50` (五十銭). No
implementation identifier (unitYen / unitSen / rateMatches) occurs in any
independent formula. 1銭 = 1/100円 is documented context only; the source
contains exactly the two kanji numerals 十七 and 五十, so NO numeric scale
constant is introduced (BY-DESIGN). The only bridges are the three pure
`unfold ... ; rfl` theorems below, listing only constants that actually
occur in each goal. Out of scope: 課税標準, 免税・税額控除, 申告・納付, 他の条文.
-/

namespace JapanTaxLaw.PetroleumGasSenRate

/-- Independent 十七円 — the yen component = 17. -/
def specYen : Nat := 17

/-- Independent 五十銭 — the sen component = 50. -/
def specSen : Nat := 50

/-- Independent two-component rate-match predicate (no scale constant). -/
def specRateMatches (yen : Nat) (sen : Nat) : Bool :=
  decide (yen == specYen && sen == specSen)

/-- Bridge: yen constants agree (pure unfold/rfl). -/
theorem agreeYen : unitYen = specYen := by unfold unitYen specYen; rfl

/-- Bridge: sen constants agree (pure unfold/rfl). -/
theorem agreeSen : unitSen = specSen := by unfold unitSen specSen; rfl

/-- Bridge: rate-match predicates agree for every input (pure unfold/rfl). -/
theorem agreeRate (yen : Nat) (sen : Nat) : rateMatches yen sen = specRateMatches yen sen := by
  unfold rateMatches specRateMatches unitYen specYen unitSen specSen
  rfl

end JapanTaxLaw.PetroleumGasSenRate
