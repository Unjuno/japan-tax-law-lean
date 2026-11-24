import JapanTaxLaw.TaxFinance

/-
# LocalTax37_2Band195To330 — 地方税法 第三十七条の二(11)（百九十五万円を超え三百三十万円以下の金額）

Pinned source:
  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Raw snapshot: data/raw/325AC0000000226_20261101_508AC0000000002.law.json
  sha256: 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53
  Normative unit id: NORM|2808f92c80b1dca3aac8145ac33c4423fd38d05ee8648ebd33d9a11e877c114d
  Source path: Article:37_2 Paragraph 11, rate-table cell.
原文逐語: 「百九十五万円を超え三百三十万円以下の金額」

Scope: only this taxable-income band. Rates, other bands, base computation,
deductions and other paragraphs are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax37_2Band195To330

open JapanTaxLaw.TaxFinance

/-- 百九十五万 — exclusive lower bound (を超え). -/
def lowerExclusiveYen : Money := 1_950_000

/-- 三百三十万 — inclusive upper bound (以下). -/
def upperInclusiveYen : Money := 3_300_000

/-- 百九十五万円を超え三百三十万円以下の金額. -/
def inBand (amount : Money) : Prop :=
  lowerExclusiveYen < amount ∧ amount ≤ upperInclusiveYen


/-- Decidable Bool mirror for kernel-decided boundary checks. -/
def inBandBool (amount : Money) : Bool :=
  decide (1_950_000 < amount ∧ amount ≤ 3_300_000)

end JapanTaxLaw.LocalTax37_2Band195To330
