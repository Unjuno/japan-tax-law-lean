import JapanTaxLaw.TaxFinance

/-
# AviationFuelTaxAmountFloor — 国税局課税部等所掌事務範囲省令 第二条（航空機燃料税額の下限）

Pinned source:
  Law id: 352M50000040032
  Official title: 国税局課税部等の統括国税調査官等の所掌に属する事務の範囲を定める省令
  Law type: MinisterialOrdinance (省令)
  Revision: 352M50000040032_20220710_504M60000040044
  Enforcement: 2022-07-10
  Raw snapshot: data/raw/352M50000040032_20220710_504M60000040044.law.json
  sha256: d626cf16d9fed1f7c4c51c463edd7e23b40bd66063cbbd79f3fe3055324610ed
  Statutory article: 第二条 (art. 2; raw JSON Article attr.Num = "2").
  Source path: law_full_text → Article[Num=2] (verified by independent
  re-extraction: 1 structural hit; the needle occurs verbatim exactly once).

原文逐語（pinned, 一字一句改変なし）:
  「当該積込みの場所において一年中に航空機に積み込まれた航空機燃料に係る航空機燃料税の額に相当する金額が五千万円以上であること」

Variable contract:
  `amount : Nat` = 航空機燃料税の額に相当する金額 (the amount corresponding to
  the aviation fuel tax), unit 円 (whole yen), aggregated over 一年 (one year).
  `amountFloor : Nat := 50_000_000` = 五千万円 = 50,000,000 円 (= 5 × 10^7).
  The generator's kanji converter is 万/億-aware and recognizes 五千万.
  `meetsFloor amount := decide (amount >= amountFloor)`; 「以上」 is INCLUSIVE
  (>=), so exactly ¥50,000,000 meets the floor and ¥49,999,999 does not.

Scope: ONLY the explicit numeric floor is modelled — 五千万円 = 50,000,000 円
and 「以上」 = inclusive >=. The loading-place condition (当該積込みの場所),
the one-year aggregation window, the actor/office competencies, the enumerated
items and every other article are NOT MODELLED.

No `sorry`, `admit`, `axiom`, `Classical.choice`, `Monotone`, or struct literals.
-/

namespace JapanTaxLaw.AviationFuelTaxAmountFloor

/-- 五千万円 = 50,000,000 円. Unit 円; domain Nat. -/
def amountFloor : Nat := 50_000_000

/-- 「航空機燃料税の額に相当する金額が五千万円以上」: amount >= ¥50,000,000
    (以上 = inclusive >=). -/
def meetsFloor (amount : Nat) : Bool :=
  decide (amount >= amountFloor)

/-- ¥49,999,999 < 五千万円: the amount just below the floor does not meet it. -/
theorem below_floor_false : meetsFloor 49_999_999 = false := by
  unfold meetsFloor amountFloor
  decide

/-- Exactly 五千万円 (¥50,000,000) meets the floor: 以上 is inclusive. -/
theorem at_floor_true : meetsFloor 50_000_000 = true := by
  unfold meetsFloor amountFloor
  decide

/-- ¥50,000,001 > 五千万円: the first amount above the floor also meets it. -/
theorem above_floor_true : meetsFloor 50_000_001 = true := by
  unfold meetsFloor amountFloor
  decide

/-- Zero yen does not meet the floor. -/
theorem zero_false : meetsFloor 0 = false := by
  unfold meetsFloor amountFloor
  decide

/-- Direct-inequality monotonicity (no `Monotone`): if an amount meets the
    floor, any larger amount meets it too. -/
theorem meetsFloor_of_ge {amount amount' : Nat}
    (h : meetsFloor amount = true) (hle : amount <= amount') :
    meetsFloor amount' = true := by
  unfold meetsFloor amountFloor at h ⊢
  apply decide_eq_true
  have ha : amount >= 50_000_000 := of_decide_eq_true h
  omega

end JapanTaxLaw.AviationFuelTaxAmountFloor
