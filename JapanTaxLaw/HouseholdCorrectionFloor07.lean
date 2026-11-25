import JapanTaxLaw.TaxFinance

/-
# HouseholdCorrectionFloor07 — 航空機燃料譲与税法施行規則 art.4(8)（世帯数の〇・七下限）

Pinned source (independent re-extraction from the scoped article):
  Law id: 347M50000008026 (航空機燃料譲与税法施行規則)
  Raw snapshot: data/raw/347M50000008026_20250905_507M60000008091.law.json
  Article: 第四条, paragraph 8 (Num=8)
  path: law_full_text -> Article[Num=4] -> Paragraph[Num=8] -> Sentence

原文逐語（一字一句改変なし）:
  「補正世帯数が、第六項からこの項までの規定により補正された前年度の世帯数に
   〇・七を乗じて得た数に満たず、かつ、当該前年度の世帯数から当該補正世帯数を
   控除して得た数が千を超える場合には、当該補正世帯数は、当該前年度の世帯数に
   〇・七を乗じて得た数とするものとする。」

Variable contract (typed, unit recorded, domain Nat):
  `corrected : Nat` = 前二項の規定により補正された世帯数 (世帯, whole households).
  `prev      : Nat` = 第六項からこの項までにより補正された前年度の世帯数 (世帯).
  All values are represented in SCALED units of 0.1 世帯 (デシ世帯) so that
  〇・七 (= 7/10) is exact: `scaledCurrent c = 10 * c`, `scaledFloor p = 7 * p`.
  `千` = 1000 世帯; `千を超える` is STRICT (`1000 < prev - corrected`).
  `に満たず` is STRICT (`10 * corrected < 7 * prev`).

Scope: ONLY the two numeric comparisons and the replacement value are modelled.
The preceding rate tables (延べ重量/旅客数), the airport-specific rates in 別表第三,
and the determination of `corrected`/`prev` themselves are NOT MODELLED.
No `sorry`, `admit`, `axiom`, `Classical.choice`, or finite enumeration as a
substitute for a universal proof.
-/

namespace JapanTaxLaw.HouseholdCorrectionFloor07

/-- 〇・七 = 7/10 を整数化するため、全値を 0.1 世帯単位で表現する。 -/
@[reducible] def scale : Nat := 10
@[reducible] def factor : Nat := 7
@[reducible] def gapThreshold : Nat := 1000

/-- 前年度世帯数 × 〇・七（0.1 世帯単位）: 10 × (0.7 × prev) = 7 × prev. -/
@[reducible] def scaledFloor (prev : Nat) : Nat := factor * prev

/-- 補正世帯数（0.1 世帯単位）: 10 × corrected. -/
@[reducible] def scaledCurrent (corrected : Nat) : Nat := scale * corrected

/-- 「前年度の世帯数に〇・七を乗じて得た数に満たず」: 厳密不等式. -/
@[reducible] def belowFloor (corrected prev : Nat) : Prop :=
  scale * corrected < scaledFloor prev

/-- 「前年度の世帯数から補正世帯数を控除して得た数が千を超える」: 厳密. -/
@[reducible] def gapExceeds (corrected prev : Nat) : Prop :=
  gapThreshold < prev - corrected

/-- 二条件の連立（かつ）。reducible により Decidable を合成する。 -/
@[reducible] def correctionApplies (corrected prev : Nat) : Prop :=
  belowFloor corrected prev ∧ gapExceeds corrected prev

/-- 補正後の世帯数（0.1 世帯単位）: 条件成立なら 0.7 × prev、さもなければ現状維持。 -/
def correctedScaled (corrected prev : Nat) : Nat :=
  if correctionApplies corrected prev then scaledFloor prev else scaledCurrent corrected

/-- 条件が成立するとき、補正は世帯数を必ず引き上げる（vacuous でない分岐）。 -/
theorem correctionRaises (corrected prev : Nat) :
    correctionApplies corrected prev → scaledCurrent corrected < scaledFloor prev := by
  unfold correctionApplies belowFloor gapExceeds scaledCurrent scaledFloor scale factor gapThreshold
  intro h
  omega

end JapanTaxLaw.HouseholdCorrectionFloor07
