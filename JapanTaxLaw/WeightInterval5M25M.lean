import JapanTaxLaw.TaxFinance

/-
# WeightInterval5M25M — 航空機燃料譲与税法施行規則 第四条（重量区分: 五百万トンを超え二千五百万トン以下）

Pinned source (verified from source; note the revision/filename supplied in the
task do not exist in this tree — see docs/adversarial/reviews-batch-52.md):
  Law id: 347M50000008026
  Official title: 航空機燃料譲与税法施行規則 (inventory official_title / revision_info.law_title)
  Law number: 昭和四十七年自治省令第二十六号
  Law type: MinisterialOrdinance (省令)
  Revision: 347M50000008026_20250905_507M60000008091 (CurrentEnforced)
  Raw snapshot: data/raw/347M50000008026_20250905_507M60000008091.law.json
  sha256: 7304e9a98c078d84b5ca2468a5e9932313ffe49e0bf90b40a75371822418b75c
  Article: 第四条 (raw JSON Article attr.Num = "4"); Caption
    （空港関係市町村に係る延べ重量及び旅客数並びに世帯数の補正）
  Source path: law_full_text → Article[Num=4] → Paragraph[Num=2] → TableStruct
    → Table → TableRow → TableColumn → Sentence[Num=1] → Sentence string leaf
    (verbatim needle). This is a DIFFERENT table cell from the population
    interval, which lives in Paragraph[Num=3] (see PopulationInterval15M75M).
  Independent re-extraction: 1 structural Article hit, needle occurs verbatim
    once in the scoped article and once in the whole file.

原文逐語（pinned, 一字一句改変なし）:
  「五百万トンを超え二千五百万トン以下の重量」

Variable contract:
  `w : Nat` = 重量/トン数, unit トン, whole tons.
  `weightLow : Nat := 5_000_000` = 五百万トン = 500万 = 5,000,000 トン,
    STRICT lower bound (超え, `weightLow < w`; 5,000,000 itself is excluded).
  `weightHigh : Nat := 25_000_000` = 二千五百万トン = 2500万 = 25,000,000 トン,
    INCLUSIVE upper bound (以下, `w <= weightHigh`; 25,000,000 is included).
  `inWeightInterval w := decide (weightLow < w && w <= weightHigh)`.
  The 万/億-aware kanji converter verifies these literals:
  int_to_kanji(5_000_000) = 五百万 and int_to_kanji(25_000_000) = 二千五百万;
  both occur verbatim inside the pinned needle.

Scope: ONLY the explicit numeric interval 5,000,000 < w <= 25,000,000 is modelled.
The surrounding weight rate table, adjacent brackets, the population and
household intervals, airport corrections and all other articles are NOT MODELLED.
The bounds are plain Nat comparisons; no monotonicity helper and no struct
literals occur.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.WeightInterval5M25M

/-- 五百万トン = 500万 = 5,000,000 トン. STRICT lower bound (超え). -/
def weightLow : Nat := 5_000_000

/-- 二千五百万トン = 2500万 = 25,000,000 トン. INCLUSIVE upper bound (以下). -/
def weightHigh : Nat := 25_000_000

/-- 「五百万トンを超え二千五百万トン以下の重量」: strict lower, inclusive upper. -/
def inWeightInterval (w : Nat) : Bool :=
  decide (weightLow < w && w <= weightHigh)

/-- Exactly 5,000,000 (五百万トン) is excluded: 超え is a strict lower bound. -/
theorem at_lower_false : inWeightInterval 5_000_000 = false := by
  unfold inWeightInterval weightLow weightHigh
  decide

/-- 5,000,001 is the first weight strictly above 五百万トン. -/
theorem above_lower_true : inWeightInterval 5_000_001 = true := by
  unfold inWeightInterval weightLow weightHigh
  decide

/-- Exactly 25,000,000 (二千五百万トン) is included: 以下 is inclusive. -/
theorem at_upper_true : inWeightInterval 25_000_000 = true := by
  unfold inWeightInterval weightLow weightHigh
  decide

/-- 25,000,001 exceeds the inclusive upper bound 二千五百万トン. -/
theorem above_upper_false : inWeightInterval 25_000_001 = false := by
  unfold inWeightInterval weightLow weightHigh
  decide

/-- Zero tons is outside the interval. -/
theorem zero_false : inWeightInterval 0 = false := by
  unfold inWeightInterval weightLow weightHigh
  decide

end JapanTaxLaw.WeightInterval5M25M
