import JapanTaxLaw.TaxFinance

/-!
# InheritanceGiftTaxRateBracket4M6M — 相続税法 第二十一条の七(1)（贈与税 税率表 区分）

Pinned source:
  Law id: 325AC0000000073
  Official title: 相続税法
  Law number: 昭和二十五年法律第七十三号
  Law type: Act (法律)
  Revision: 325AC0000000073_20260401_506AC0000000008
  Raw snapshot: data/raw/325AC0000000073_20260401_506AC0000000008.law.json
  sha256: c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7
  Normative unit id: NORM|246a67a42516a454e7df2f7fc108debef44b46afd4aef3c1dd5e5f0e08115c11
  Source path: LawBody[3]/MainProvision/MainProvision[1]/Article:21_7/Article#21_7/
               Paragraph#1/TableStruct/Table/TableRow/TableColumn/Sentence#1
  Article caption: （贈与税の税率）
  Upper-column bracket: 四百万を超え六百万以下 (LO exclusive <, HI inclusive ≤),
  both bounds derived programmatically from the verbatim needle.

原文逐語（pinned, 一字一句改変なし）:
  「四百万円を超え六百万円以下の金額」

Variable contract (円, domain Nat):
  lowerExclusiveYen : Money := 4_000_000
  upperInclusiveYen : Money := 6_000_000
  inBracket amount := lowerExclusiveYen < amount ∧ amount ≤ upperInclusiveYen
  「を超え」 = strict > (boundary excluded); 「以下」 = ≤ (boundary included).

Scope: only this bracket interval. The paired tax rate, other brackets, the
deduction rules, other paragraphs and other articles are NOT MODELLED.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.InheritanceGiftTaxRateBracket4M6M

open JapanTaxLaw.TaxFinance

/-- 四百万 — lower bound, strictly excluded (を超え). -/
def lowerExclusiveYen : Money := 4_000_000

/-- 六百万 — upper bound, inclusive (以下). -/
def upperInclusiveYen : Money := 6_000_000

/-- 金額が 四百万を超え六百万以下の金額. -/
def inBracket (amount : Money) : Prop :=
  lowerExclusiveYen < amount ∧ amount ≤ upperInclusiveYen

end JapanTaxLaw.InheritanceGiftTaxRateBracket4M6M
