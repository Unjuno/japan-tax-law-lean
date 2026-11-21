import JapanTaxLaw.TaxFinance

/-
# NickelContentThreshold — 溶融亜鉛めっき鋼帯及び鋼板に対して課する暫定的な不当廉売関税に関する政令 第一条

Pinned source:
  Law id: 508CO0000000254
  Official title: 溶融亜鉛めっき鋼帯及び鋼板に対して課する暫定的な不当廉売関税に関する政令
  Law number: 令和八年政令第二百五十四号
  Law type: CabinetOrder (政令)
  Revision: 508CO0000000254_20260808_000000000000000
  Raw snapshot: data/raw/508CO0000000254_20260808_000000000000000.law.json
  sha256: aed868d547988eef85a4fe851b8e46bb92ea4b237502c20e76a702a1232e72b0
  Statutory article: 第一条 (art. 1; raw JSON Article attr.Num = "1").
  Source path: law_full_text → Article[Num=1] → バイメタル subitem (verified by
  independent re-extraction: 1 structural hit, needle occurs verbatim once).

原文逐語（pinned, 一字一句改変なし）:
  「バイメタル（張合せ加工を行ったもので、ニッケルの含有量が全重量の十パーセントを超えるものに限る。）」

Variable contract:
  `nickel : Nat` = ニッケルの重量 (nickel weight), unit e.g. g, whole grams.
  `total : Nat` = 全重量 (total weight), same unit as `nickel`.
  十パーセント = 10% = 10/100. 「超える」 = STRICT `>`, NOT inclusive 以上.
  Algebra (exact integer cross-multiplication, no division/rounding):
    nickel / total > 10 / 100  ⇔  100 * nickel > 10 * total  ⇔  10 * nickel > total
  (divide both sides of 100 * n > 10 * t by the positive factor 10).
  `exceedsNickelThreshold nickel total := decide (total > 0 && 10 * nickel > total)`.
  The `total > 0` guard makes an undefined (zero-denominator) ratio false.

Scope: ONLY the explicit numeric composition threshold is modelled — nickel
content strictly exceeds 10% of total weight. The 張合せ加工 process, the other
conditions of the bimetal definition, the provisional anti-dumping duty rate,
the covered goods, other items/paragraphs and other articles are NOT MODELLED.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.NickelContentThreshold

/-- 十パーセント = 10/100; exact cross-multiplication gives `10 * nickel > total`. -/
def exceedsNickelThreshold (nickel total : Nat) : Bool :=
  decide (total > 0 && 10 * nickel > total)

/-- 11/100 = 11% > 10%: 10 * 11 = 110 > 100. -/
theorem eleven_percent_true : exceedsNickelThreshold 11 100 = true := by
  unfold exceedsNickelThreshold
  have h : 10 * 11 > 100 := by omega
  simp [h]

/-- Exactly 10%: 10 * 10 = 100, not > 100, so 超える is false. -/
theorem exactly_ten_percent_false : exceedsNickelThreshold 10 100 = false := by
  unfold exceedsNickelThreshold
  have h : ¬ 10 * 10 > 100 := by omega
  simp [h]

/-- 9% < 10%: false. -/
theorem nine_percent_false : exceedsNickelThreshold 9 100 = false := by
  unfold exceedsNickelThreshold
  have h : ¬ 10 * 9 > 100 := by omega
  simp [h]

/-- 1/10 = 10% exactly: not exceeding, hence false. -/
theorem one_in_ten_false : exceedsNickelThreshold 1 10 = false := by
  unfold exceedsNickelThreshold
  have h : ¬ 10 * 1 > 10 := by omega
  simp [h]

/-- 2/10 = 20% > 10%: true. -/
theorem two_in_ten_true : exceedsNickelThreshold 2 10 = true := by
  unfold exceedsNickelThreshold
  have h : 10 * 2 > 10 := by omega
  simp [h]

/-- zero total: the ratio is undefined (zero denominator), so false. -/
theorem zero_total_false : exceedsNickelThreshold 0 0 = false := by
  unfold exceedsNickelThreshold
  have h : ¬ 0 > 0 := by omega
  simp [h]

end JapanTaxLaw.NickelContentThreshold
