import JapanTaxLaw.TaxFinance

/-
# OkinawaArt19Bracket8M10M — 沖縄の復帰に伴う国税関係法令の適用の特別措置等に関する政令 第十九条(1)(3) 別表
（八百万円以上千万円未満の金額）

Pinned source:
  Law id: 347CO0000000151
  Official title: 沖縄の復帰に伴う国税関係法令の適用の特別措置等に関する政令
  Law type: CabinetOrder (政令)
  Revision: 347CO0000000151_20251231_507CO0000000426
  Raw snapshot: data/raw/347CO0000000151_20251231_507CO0000000426.law.json
  sha256: 8c5521ffb74068dc5b6872a3748b53a6eec38afc3637ece878eb0ca9da74a437
  Statutory article: 第十九条 (art. 19), 第一項 (1), 第三号 (3), table cell
  Source path: LawBody[3]/MainProvision/MainProvision[1]/Article:19/Article#19/
               Paragraph#1/Item#3/TableStruct/Table/TableRow/TableColumn/Sentence#1
  Normative unit id: NORM|efdfff78b60a7d77191816bd395051878b7e92f4d65e99da141fd9208a1cc6f8

原文逐語（pinned, 一字一句改変なし, CONDITION, verbatim-unique in whole law）:
  「八百万円以上千万円未満の金額」

Variable contract:
  `lowerBound : Nat := 8_000_000` = 八百万円 (inclusive lower bound: 以上).
  `upperBound : Nat := 10_000_000` = 千万円 (exclusive upper bound: 未満).
  `inBracket amount : Bool := decide (lowerBound <= amount && amount < upperBound)`.
  Unit 円; domain Nat (whole yen). 以上 = inclusive `<=`; 未満 = strict `<`.
  A value of exactly 八百万円 qualifies; exactly 千万円 does NOT.

Scope: ONLY this explicit numeric bracket cell is modelled. The other table
cells/rows of 第十九条(1)(3), the substantive rate/amount that this bracket
selects, other items and paragraphs, and all enforcement/operational rules are
NOT MODELLED.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.OkinawaArt19Bracket8M10M

/-- 八百万円 — inclusive lower bound (以上). Unit 円; domain Nat. -/
def lowerBound : Nat := 8_000_000

/-- 千万円 — exclusive upper bound (未満). Unit 円; domain Nat. -/
def upperBound : Nat := 10_000_000

/-- 「八百万円以上千万円未満の金額」: 8,000,000 <= amount < 10,000,000. -/
def inBracket (amount : Nat) : Bool :=
  decide (lowerBound <= amount && amount < upperBound)

/-- 未満 is exclusive: exactly 千万円 fails. -/
theorem upper_exclusive : inBracket 10_000_000 = false := by
  unfold inBracket lowerBound upperBound
  decide

/-- 以上 is inclusive: exactly 八百万円 qualifies. -/
theorem lower_inclusive : inBracket 8_000_000 = true := by
  unfold inBracket lowerBound upperBound
  decide

/-- Just below the upper bound still qualifies. -/
theorem just_below_upper : inBracket 9_999_999 = true := by
  unfold inBracket lowerBound upperBound
  decide

/-- Just below the lower bound fails. -/
theorem just_below_lower : inBracket 7_999_999 = false := by
  unfold inBracket lowerBound upperBound
  decide

end JapanTaxLaw.OkinawaArt19Bracket8M10M
