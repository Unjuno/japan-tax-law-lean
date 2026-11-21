import JapanTaxLaw.TaxFinance

/-
# DisasterReliefPenalty — 災害被害者に対する租税の減免、徴収猶予等に関する法律 第五条（罰則）

Pinned source:
  Law id: 329AC0000000112
  Official title: 災害被害者に対する租税の減免、徴収猶予等に関する法律
  Law type: Act (法律)
  Revision: 329AC0000000112_20250601_504AC0000000068
  Raw snapshot: data/raw/329AC0000000112_20250601_504AC0000000068.law.json
  sha256: e9fdb7f3e8e12c43d255f747e2533f5374b31454e03efd513bfe1f4c12d35943
  Statutory article: 第五条 (art. 5; raw JSON Article attr.Num = "5").
  Source path: law_full_text → Article[Num=5] (verified by independent
  re-extraction: 1 structural hit; the needle occurs verbatim exactly once).

原文逐語（pinned, 一字一句改変なし）:
  「第一項の規定による承認を受けないで同項の資材等又は製品等を譲り受けた者は、一年以下の拘禁刑又は五十万円以下の罰金に処する。」

Variable contract:
  `years : Nat` = 拘禁刑の期間 (term of imprisonment), unit 年 (whole years).
  `yen : Nat` = 罰金の額 (amount of the criminal fine), unit 円 (whole yen).
  `imprisonmentCeiling : Nat := 1` = 一年 = 1 年.
  `fineCeiling : Nat := 500_000` = 五十万円 = 500,000 円.
  `withinImprisonment years := decide (years <= imprisonmentCeiling)`:
    「一年以下」 is INCLUSIVE (<=); 0 年 and 1 年 are within, 2 年 is outside.
  `withinFine yen := decide (yen <= fineCeiling)`:
    「五十万円以下」 is INCLUSIVE (<=); ¥499,999 and ¥500,000 are within,
    ¥500,001 is outside.
  The two ceilings are DIMENSIONALLY DISTINCT axes (年 vs 円): never mix,
  compare, or convert across them; each predicate takes only its own unit.

Scope: ONLY the two explicit penalty ceilings are modelled — 一年 = 1 年 and
五十万円 = 500,000 円, both with inclusive 「以下」. The approval condition
(第一項の規定による承認), the definitions of 資材等・製品等, the transferee actor,
actual sentencing, and every other article/paragraph are NOT MODELLED.

No `sorry`, `admit`, `axiom`, `Classical.choice`, `Monotone`, or struct literals.
-/

namespace JapanTaxLaw.DisasterReliefPenalty

/-- 一年 = 1 年. Unit 年; domain Nat. -/
def imprisonmentCeiling : Nat := 1

/-- 五十万円 = 500,000 円. Unit 円; domain Nat. -/
def fineCeiling : Nat := 500_000

/-- 「一年以下の拘禁刑」: years is at most 1 年 (以下 = inclusive <=). -/
def withinImprisonment (years : Nat) : Bool :=
  decide (years <= imprisonmentCeiling)

/-- 「五十万円以下の罰金」: yen is at most ¥500,000 (以下 = inclusive <=). -/
def withinFine (yen : Nat) : Bool :=
  decide (yen <= fineCeiling)

/-- 0 年 is within the one-year imprisonment ceiling. -/
theorem imprisonment_zero_true : withinImprisonment 0 = true := by
  unfold withinImprisonment imprisonmentCeiling
  decide

/-- Exactly 一年 (1 年) is within the imprisonment ceiling: 以下 is inclusive. -/
theorem imprisonment_one_true : withinImprisonment 1 = true := by
  unfold withinImprisonment imprisonmentCeiling
  decide

/-- 2 年 > 一年: the first term outside the imprisonment ceiling. -/
theorem imprisonment_two_false : withinImprisonment 2 = false := by
  unfold withinImprisonment imprisonmentCeiling
  decide

/-- ¥499,999 is within the fine ceiling. -/
theorem fine_499999_true : withinFine 499_999 = true := by
  unfold withinFine fineCeiling
  decide

/-- Exactly 五十万円 (¥500,000) is within the fine ceiling: 以下 is inclusive. -/
theorem fine_500000_true : withinFine 500_000 = true := by
  unfold withinFine fineCeiling
  decide

/-- ¥500,001 > 五十万円: the first amount outside the fine ceiling. -/
theorem fine_500001_false : withinFine 500_001 = false := by
  unfold withinFine fineCeiling
  decide

/-- Zero yen is within the fine ceiling. -/
theorem fine_zero_true : withinFine 0 = true := by
  unfold withinFine fineCeiling
  decide

end JapanTaxLaw.DisasterReliefPenalty
