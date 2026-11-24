import JapanTaxLaw.TaxFinance

/-
# InheritanceTaxRateBracket10_30 — 相続税法 第16(1)（千万円を超え三千万円以下の金額）

Pinned source:
  Law id: 325AC0000000073
  Revision: 325AC0000000073_20260401_506AC0000000008
  Raw snapshot: data/raw/325AC0000000073_20260401_506AC0000000008.law.json
  sha256: c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7
  Normative unit id: NORM|93b274d3db7616b01bf8ebe8da32b6a1bb33b66ca5f224d32215cd1108b0c470
  Source path: table cell, Article 16, Paragraph 1.

原文逐語（pinned, 一字一句改変なし）:
  「千万円を超え三千万円以下の金額」

Scope: only this interval; the paired rate, other brackets, deduction rules
and other articles are NOT MODELLED. No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.InheritanceTaxRateBracket10_30

open JapanTaxLaw.TaxFinance

/-- 千万 — lower bound, strictly excluded (を超え). -/
def lowerExclusiveYen : Money := 10_000_000

/-- 三千万 — upper bound, inclusive (以下). -/
def upperInclusiveYen : Money := 30_000_000

/-- 金額が 千万を超え三千万以下の金額. -/
def inBracket (amount : Money) : Prop :=
  lowerExclusiveYen < amount ∧ amount ≤ upperInclusiveYen

/-- Decidable Bool mirror for kernel-decided boundary checks. -/
def inBracketBool (amount : Money) : Bool :=
  decide (lowerExclusiveYen < amount ∧ amount ≤ upperInclusiveYen)

end JapanTaxLaw.InheritanceTaxRateBracket10_30
