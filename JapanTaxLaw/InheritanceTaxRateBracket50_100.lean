import JapanTaxLaw.TaxFinance

/-
# InheritanceTaxRateBracket50_100 — 相続税法 第十六条(1)（五千万円超一億円以下）

Pinned source:
  Law id: 325AC0000000073
  Revision: 325AC0000000073_20260401_506AC0000000008
  Raw snapshot: data/raw/325AC0000000073_20260401_506AC0000000008.law.json
  sha256: c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7
  Normative unit id: NORM|df94f143188b89690e03047e002c6a375e81d8d3c81f4313c1995b484310badc
  Source path: LawBody[3]/MainProvision/MainProvision[1]/Article:16/Article#16/
               Paragraph#1/TableStruct/Table/TableRow/TableColumn/Sentence#1

原文逐語（pinned, 一字一句改変なし）:
  「五千万円を超え一億円以下の金額」

Variable contract: lower bound 50_000_000 strictly excluded (超え); upper bound
100_000_000 inclusive (以下). Domain Nat (whole yen).

Scope: only this taxable-value bracket. The paired rate, the other brackets,
the base computation, deductions and other paragraphs are NOT MODELLED.
No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.InheritanceTaxRateBracket50_100

open JapanTaxLaw.TaxFinance

/-- 五千万円 — exclusive lower bound (超え). -/
def lowerExclusiveYen : Money := 50_000_000

/-- 一億円 — inclusive upper bound (以下). -/
def upperInclusiveYen : Money := 100_000_000

/-- 金額が 五千万円を超え一億円以下の金額. -/
def inBracket (amount : Money) : Prop :=
  lowerExclusiveYen < amount ∧ amount ≤ upperInclusiveYen

/-- Decidable Bool mirror for kernel-decided boundary checks. -/
def inBracketBool (amount : Money) : Bool :=
  decide (lowerExclusiveYen < amount ∧ amount ≤ upperInclusiveYen)

end JapanTaxLaw.InheritanceTaxRateBracket50_100
