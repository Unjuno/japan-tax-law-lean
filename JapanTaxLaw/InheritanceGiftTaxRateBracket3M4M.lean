import JapanTaxLaw.TaxFinance

/-
# InheritanceGiftTaxRateBracket3M4M — 相続税法 第21_7(1)（三百万円を超え四百万円以下の金額）

Pinned source:
  Law id: 325AC0000000073
  Revision: 325AC0000000073_20260401_506AC0000000008
  Raw snapshot: data/raw/325AC0000000073_20260401_506AC0000000008.law.json
  sha256: c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7
  Normative unit id: NORM|ba11d2cd9757bba62e0170670bdbca61193022421bd60ba07507240125ccbaf1
  Source path: table cell, Article 21_7, Paragraph 1.

原文逐語（pinned, 一字一句改変なし）:
  「三百万円を超え四百万円以下の金額」

Scope: only this interval; the paired rate, other brackets, deduction rules
and other articles are NOT MODELLED. No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.InheritanceGiftTaxRateBracket3M4M

open JapanTaxLaw.TaxFinance

/-- 三百万 — lower bound, strictly excluded (を超え). -/
def lowerExclusiveYen : Money := 3_000_000

/-- 四百万 — upper bound, inclusive (以下). -/
def upperInclusiveYen : Money := 4_000_000

/-- 金額が 三百万を超え四百万以下の金額. -/
def inBracket (amount : Money) : Prop :=
  lowerExclusiveYen < amount ∧ amount ≤ upperInclusiveYen

/-- Decidable Bool mirror for kernel-decided boundary checks. -/
def inBracketBool (amount : Money) : Bool :=
  decide (lowerExclusiveYen < amount ∧ amount ≤ upperInclusiveYen)

end JapanTaxLaw.InheritanceGiftTaxRateBracket3M4M
