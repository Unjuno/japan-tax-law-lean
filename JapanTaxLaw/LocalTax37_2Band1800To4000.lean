import JapanTaxLaw.TaxFinance

/-
# LocalTax37_2Band1800To4000 — 地方税法 第三十七条の二(11)（千八百万円を超え四千万円以下の金額）

Pinned source:
  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Raw snapshot: data/raw/325AC0000000226_20261101_508AC0000000002.law.json
  sha256: 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53
  Normative unit id: NORM|5811f3c7e167317de6a2a2f42fa756fe80d1a312f06f8e5b088b730006a0d0a4
  Source path: Article:37_2 Paragraph 11, rate-table cell.
原文逐語: 「千八百万円を超え四千万円以下の金額」

Scope: only this taxable-income band. Rates, other bands, base computation,
deductions and other paragraphs are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax37_2Band1800To4000

open JapanTaxLaw.TaxFinance

/-- 千八百万 — exclusive lower bound (を超え). -/
def lowerExclusiveYen : Money := 18_000_000

/-- 四千万 — inclusive upper bound (以下). -/
def upperInclusiveYen : Money := 40_000_000

/-- 千八百万円を超え四千万円以下の金額. -/
def inBand (amount : Money) : Prop :=
  lowerExclusiveYen < amount ∧ amount ≤ upperInclusiveYen


/-- Decidable Bool mirror for kernel-decided boundary checks. -/
def inBandBool (amount : Money) : Bool :=
  decide (18_000_000 < amount ∧ amount ≤ 40_000_000)

end JapanTaxLaw.LocalTax37_2Band1800To4000
