import JapanTaxLaw.TaxFinance

/-
# LocalTax37_2BandUpTo195 — 地方税法 第三十七条の二(11)（百九十五万円以下の金額）

Pinned source:
  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Raw snapshot: data/raw/325AC0000000226_20261101_508AC0000000002.law.json
  sha256: 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53
  Normative unit id: NORM|a63c51497da33723c05f89264def18ad7c274d4d926f1bfe4267b570026f62f4
  Source path: Article:37_2 Paragraph 11, rate-table cell.
原文逐語: 「百九十五万円以下の金額」

Scope: only this taxable-income band. Rates, other bands, base computation,
deductions and other paragraphs are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax37_2BandUpTo195

open JapanTaxLaw.TaxFinance

/-- 百九十五万 — inclusive upper bound (以下). -/
def upperInclusiveYen : Money := 1_950_000

/-- 百九十五万円以下の金額. -/
def inBand (amount : Money) : Prop := amount ≤ upperInclusiveYen


/-- Decidable Bool mirror for kernel-decided boundary checks. -/
def inBandBool (amount : Money) : Bool :=
  decide (amount ≤ 1_950_000)

end JapanTaxLaw.LocalTax37_2BandUpTo195
