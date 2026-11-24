import JapanTaxLaw.TaxFinance

/-!
# InheritanceTaxRateBracket30_50 — 相続税法 第十六条(1)（三千万円超五千万円以下）

Pinned source:
  Law id: 325AC0000000073
  Revision: 325AC0000000073_20260401_506AC0000000008
  Raw snapshot: data/raw/325AC0000000073_20260401_506AC0000000008.law.json
  sha256: c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7
  Normative unit id: NORM|2f9abe1626f614eaab2879239d801935a2a1b8cdbc5dde1de4f9c5925696a72b
  Source path: LawBody[3]/MainProvision/MainProvision[1]/Article:16/Article#16/
               Paragraph#1/TableStruct/Table/TableRow/TableColumn/Sentence#1

原文逐語（pinned, 一字一句改変なし）:
  「三千万円を超え五千万円以下の金額」

Variable contract: lower bound 30_000_000 strictly excluded (超え); upper bound
50_000_000 inclusive (以下). Domain Nat (whole yen).

Scope: only this taxable-value bracket. The rate itself, other brackets, the
base computation, deductions, the rest of 第十六条の表 and other paragraphs are
NOT MODELLED. No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.InheritanceTaxRateBracket30_50

open JapanTaxLaw.TaxFinance

/-- 三千万円 — exclusive lower bound (超え). -/
def lowerBoundYen : Money := 30_000_000

/-- 五千万円 — inclusive upper bound (以下). -/
def upperBoundYen : Money := 50_000_000

/-- 「三千万円を超え五千万円以下」: strict lower, inclusive upper. -/
def inBracket (taxableValue : Money) : Prop :=
  lowerBoundYen < taxableValue ∧ taxableValue ≤ upperBoundYen

/-- Decidable Bool mirror for kernel-decided boundary checks. -/
def inBracketBool (taxableValue : Money) : Bool :=
  decide (lowerBoundYen < taxableValue ∧ taxableValue ≤ upperBoundYen)

end JapanTaxLaw.InheritanceTaxRateBracket30_50
