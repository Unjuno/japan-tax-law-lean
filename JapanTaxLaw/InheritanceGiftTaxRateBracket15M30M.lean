import JapanTaxLaw.TaxFinance

/-
# InheritanceGiftTaxRateBracket15M30M — 相続税法 第二十一条の七(1)（贈与税 税率表 区分）

Pinned source:
  Law id: 325AC0000000073
  Official title: 相続税法
  Law number: 昭和二十五年法律第七十三号
  Law type: Act (法律)
  Revision: 325AC0000000073_20260401_506AC0000000008
  Raw snapshot: data/raw/325AC0000000073_20260401_506AC0000000008.law.json
  sha256: c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7
  Normative unit id: NORM|68cc7a516287f33351d259921d3e7dde2e314a75cde606a098b736c6e4319ab5
  Source path: LawBody[3]/MainProvision/MainProvision[1]/Article:21_7/Article#21_7/
               Paragraph#1/TableStruct/Table/TableRow/TableColumn/Sentence#1
  Article caption: （贈与税の税率）
  Upper-column bracket: 千五百万を超え三千万以下 (LO exclusive <, HI inclusive ≤),
  both bounds derived programmatically from the verbatim needle.

原文逐語（pinned, 一字一句改変なし）:
  「千五百万円を超え三千万円以下の金額」

Variable contract (円, domain Nat):
  lowerExclusiveYen : Money := 15_000_000
  upperInclusiveYen : Money := 30_000_000
  inBracket amount := lowerExclusiveYen < amount ∧ amount ≤ upperInclusiveYen
  「を超え」 = strict > (boundary excluded); 「以下」 = ≤ (boundary included).

Scope: only this bracket interval. The paired tax rate, other brackets, the
deduction rules, other paragraphs and other articles are NOT MODELLED.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.InheritanceGiftTaxRateBracket15M30M

open JapanTaxLaw.TaxFinance

/-- 千五百万 — lower bound, strictly excluded (を超え). -/
def lowerExclusiveYen : Money := 15_000_000

/-- 三千万 — upper bound, inclusive (以下). -/
def upperInclusiveYen : Money := 30_000_000

/-- 金額が 千五百万を超え三千万以下の金額. -/
def inBracket (amount : Money) : Prop :=
  lowerExclusiveYen < amount ∧ amount ≤ upperInclusiveYen

/-- Decidable Bool mirror of `inBracket`, used for kernel-decided boundary
    checks. The interval judgements are the same inequalities as `inBracket`. -/
def inBracketBool (amount : Money) : Bool :=
  decide (lowerExclusiveYen < amount ∧ amount ≤ upperInclusiveYen)

end JapanTaxLaw.InheritanceGiftTaxRateBracket15M30M
