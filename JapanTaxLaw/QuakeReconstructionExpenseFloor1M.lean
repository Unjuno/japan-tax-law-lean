import JapanTaxLaw.TaxFinance

/-
# QuakeReconstructionExpenseFloor1M — 東日本大震災の被災者等に係る国税関係法律の臨時特例に関する法律 第三十八条の二(2)(4)イ
（当該工事に要した費用の額が百万円以上であること）

Pinned source:
  Law id: 423AC0000000029
  Official title: 東日本大震災の被災者等に係る国税関係法律の臨時特例に関する法律
  Law type: Act (法律)
  Revision: 423AC0000000029_20260401_508AC0000000012
  Raw snapshot: data/raw/423AC0000000029_20260401_508AC0000000012.law.json
  sha256: 87125cf7c2562c5be34270498efc007cfd80abbec74aa372a9ffac93bec74c3f
  Statutory article: 第三十八条の二 (art. 38-2), 第二項 (2), 第四号 (4), イ (subitem 1)
  Source path: LawBody[2]/MainProvision/MainProvision[3]/Article:38_2/Article#38_2/
               Paragraph#2/Item#4/Subitem1#1/Subitem1Sentence/Sentence#1
  Normative unit id: NORM|894f40b7793d3fa713c8a984bee8ac458702a9b16af5b9a67796ad467c38c776

原文逐語（pinned, 一字一句改変なし, CONDITION, verbatim-unique in whole law）:
  「当該工事に要した費用の額が百万円以上であること。」

Variable contract:
  `expenseFloor : Nat := 1_000_000` = 百万円 (inclusive lower bound: 以上).
  `meetsExpenseFloor amount : Bool := decide (expenseFloor <= amount)`.
  Unit 円; domain Nat (whole yen). 以上 = inclusive `>=`. A cost of exactly
  百万円 qualifies; 999,999 does not.

Scope: ONLY this explicit numeric construction-expense condition is modelled.
The special tax measure this condition gates, the definition of 当該工事, the
identity of 被災者等, other subitems/items/paragraphs, and all enforcement
rules are NOT MODELLED.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.QuakeReconstructionExpenseFloor1M

/-- 百万円 — inclusive lower bound (以上). Unit 円; domain Nat. -/
def expenseFloor : Nat := 1_000_000

/-- 「工事に要した費用の額が百万円以上」: amount >= ¥1,000,000. -/
def meetsExpenseFloor (amount : Nat) : Bool :=
  decide (expenseFloor <= amount)

/-- 以上 is inclusive: exactly 百万円 qualifies. -/
theorem floor_inclusive : meetsExpenseFloor 1_000_000 = true := by
  unfold meetsExpenseFloor expenseFloor
  decide

/-- One yen below the floor fails. -/
theorem just_below : meetsExpenseFloor 999_999 = false := by
  unfold meetsExpenseFloor expenseFloor
  decide

/-- Zero expense does not satisfy the condition. -/
theorem zero_false : meetsExpenseFloor 0 = false := by
  unfold meetsExpenseFloor expenseFloor
  decide

end JapanTaxLaw.QuakeReconstructionExpenseFloor1M
