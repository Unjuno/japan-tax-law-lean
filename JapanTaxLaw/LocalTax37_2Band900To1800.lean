import JapanTaxLaw.TaxFinance

/-
# LocalTax37_2Band900To1800 — 地方税法 第三十七条の二(11)（九百万円を超え千八百万円以下の金額）

Pinned source:
  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Raw snapshot: data/raw/325AC0000000226_20261101_508AC0000000002.law.json
  sha256: 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53
  Normative unit id: NORM|c9934e9ea57c62899dce39e90bacdc679abf8fad7250d364ef4ca8a1f95a3917
  Source path: Article:37_2 Paragraph 11, rate-table cell.
原文逐語: 「九百万円を超え千八百万円以下の金額」

Scope: only this taxable-income band. Rates, other bands, base computation,
deductions and other paragraphs are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax37_2Band900To1800

open JapanTaxLaw.TaxFinance

/-- 九百万 — exclusive lower bound (を超え). -/
def lowerExclusiveYen : Money := 9_000_000

/-- 千八百万 — inclusive upper bound (以下). -/
def upperInclusiveYen : Money := 18_000_000

/-- 九百万円を超え千八百万円以下の金額. -/
def inBand (amount : Money) : Prop :=
  lowerExclusiveYen < amount ∧ amount ≤ upperInclusiveYen


/-- Decidable Bool mirror for kernel-decided boundary checks. -/
def inBandBool (amount : Money) : Bool :=
  decide (9_000_000 < amount ∧ amount ≤ 18_000_000)

end JapanTaxLaw.LocalTax37_2Band900To1800
