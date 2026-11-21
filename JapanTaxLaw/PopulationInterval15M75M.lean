import JapanTaxLaw.TaxFinance

/-
# PopulationInterval15M75M — 航空機燃料譲与税法施行規則 第四条（旅客数区分: 千五百万人超え七千五百万人以下）

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
  Source path: law_full_text → Article[Num=4] → Paragraph[Num=3] → TableStruct
    → Table → TableRow[6] → TableColumn[0] → Sentence (verbatim needle leaf).
  Independent re-extraction: 1 structural Article hit, needle occurs verbatim
    once in the scoped article and once in the whole file.

原文逐語（pinned, 一字一句改変なし）:
  「千五百万人を超え七千五百万人以下の人数」

Variable contract:
  `p : Nat` = 人口/人数 (旅客数), unit 人, whole persons.
  `popLow : Nat := 15_000_000` = 千五百万人 = 1500万 = 15,000,000 人,
    STRICT lower bound (超え, `popLow < p`; 15,000,000 itself is excluded).
  `popHigh : Nat := 75_000_000` = 七千五百万人 = 7500万 = 75,000,000 人,
    INCLUSIVE upper bound (以下, `p <= popHigh`; 75,000,000 is included).
  `inPopulationInterval p := decide (popLow < p && p <= popHigh)`.
  The 万/億-aware kanji converter verifies these literals:
  int_to_kanji(15_000_000) = 千五百万 and int_to_kanji(75_000_000) = 七千五百万;
  both occur verbatim inside the pinned needle.

Scope: ONLY the explicit numeric interval 15,000,000 < p <= 75,000,000 is modelled.
The surrounding passenger-count rate table (rate 〇・五), adjacent brackets
(十二万人以下, 三百万人を超え千五百万人以下の人数, 七千五百万人を超える人数),
airport corrections and all other articles are NOT MODELLED. The bounds are
plain Nat comparisons; no monotonicity helper and no struct literals occur.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.PopulationInterval15M75M

/-- 千五百万人 = 1500万 = 15,000,000 人. STRICT lower bound (超え). -/
def popLow : Nat := 15_000_000

/-- 七千五百万人 = 7500万 = 75,000,000 人. INCLUSIVE upper bound (以下). -/
def popHigh : Nat := 75_000_000

/-- 「千五百万人を超え七千五百万人以下の人数」: strict lower, inclusive upper. -/
def inPopulationInterval (p : Nat) : Bool :=
  decide (popLow < p && p <= popHigh)

/-- Exactly 15,000,000 (千五百万人) is excluded: 超え is a strict lower bound. -/
theorem at_lower_false : inPopulationInterval 15_000_000 = false := by
  unfold inPopulationInterval popLow popHigh
  decide

/-- 15,000,001 is the first population strictly above 千五百万人. -/
theorem above_lower_true : inPopulationInterval 15_000_001 = true := by
  unfold inPopulationInterval popLow popHigh
  decide

/-- Exactly 75,000,000 (七千五百万人) is included: 以下 is inclusive. -/
theorem at_upper_true : inPopulationInterval 75_000_000 = true := by
  unfold inPopulationInterval popLow popHigh
  decide

/-- 75,000,001 exceeds the inclusive upper bound 七千五百万人. -/
theorem above_upper_false : inPopulationInterval 75_000_001 = false := by
  unfold inPopulationInterval popLow popHigh
  decide

/-- Zero persons is outside the interval. -/
theorem zero_false : inPopulationInterval 0 = false := by
  unfold inPopulationInterval popLow popHigh
  decide

end JapanTaxLaw.PopulationInterval15M75M
