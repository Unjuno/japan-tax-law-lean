import JapanTaxLaw.TaxFinance

/-
# LocalTax37_2Band695To900 — 地方税法 第三十七条の二(11)（六百九十五万円を超え九百万円以下の金額）

Pinned source:
  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Raw snapshot: data/raw/325AC0000000226_20261101_508AC0000000002.law.json
  sha256: 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53
  Normative unit id: NORM|97c4daa450498330a9237448704c4ce49d3b816d053b5b70bfca92ac1288972c
  Source path: Article:37_2 Paragraph 11, rate-table cell.
原文逐語: 「六百九十五万円を超え九百万円以下の金額」

Scope: only this taxable-income band. Rates, other bands, base computation,
deductions and other paragraphs are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax37_2Band695To900

open JapanTaxLaw.TaxFinance

/-- 六百九十五万 — exclusive lower bound (を超え). -/
def lowerExclusiveYen : Money := 6_950_000

/-- 九百万 — inclusive upper bound (以下). -/
def upperInclusiveYen : Money := 9_000_000

/-- 六百九十五万円を超え九百万円以下の金額. -/
def inBand (amount : Money) : Prop :=
  lowerExclusiveYen < amount ∧ amount ≤ upperInclusiveYen


/-- Decidable Bool mirror for kernel-decided boundary checks. -/
def inBandBool (amount : Money) : Bool :=
  decide (6_950_000 < amount ∧ amount ≤ 9_000_000)

end JapanTaxLaw.LocalTax37_2Band695To900
