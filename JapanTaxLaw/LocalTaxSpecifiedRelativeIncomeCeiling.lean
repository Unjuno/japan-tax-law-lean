import JapanTaxLaw.TaxFinance

/-!
# LocalTaxSpecifiedRelativeIncomeCeiling — 地方税法施行規則 第二条の三の五(3)2（特定親族の所得要件）

Pinned source:
  Law id: 329M50000002023
  Official title: 地方税法施行規則
  Law number: 昭和二十九年総理府令第二十三号
  Law type: MinisterialOrdinance (省令)
  Revision: 329M50000002023_20261101_508M60000008045
  Raw snapshot: data/raw/329M50000002023_20261101_508M60000008045.law.json
  sha256: 5ffb833bd3a3d7c477efecd41ace0d53ea8e8a14e61567f6ee18d08000bb217e
  Normative unit id: NORM|82fb8eb5c1e96b8c4ba285efcd8506848b999781b461e977bb759c1932819c31
  Source path: LawBody[2]/MainProvision/MainProvision[41]/Article:2_3_5/Article#2_3_5/
               Paragraph#3/Item#2/ItemSentence/Column#2/Sentence#1
  Statutory article: 第二条の三の五 — caption （公的年金等受給者の扶養親族等申告書の提出方法）.
    Paragraph 3 Item 2 lists, as a form item, the name of a 特定親族 who has
    退職手当等に係る所得 and whose 合計所得金額 is 八十五万円以下.

原文逐語（pinned, 一字一句改変なし）:
  「退職手当等に係る所得を有する者であつて、合計所得金額が八十五万円以下である特定親族の氏名」

Variable contract (円/year, domain Nat):
  incomeCeilingYen : Money := 850_000 (八十五万円以下 — inclusive upper bound).
  withinIncomeRequirement income := income ≤ incomeCeilingYen.
  「以下」 = ≤ (inclusive). Upper-bound-only (no lower bound in the needle).

Scope: only this income ceiling is modeled. The form-submission procedure, the
definition of 特定親族, the 退職手当等 income concept, other items, other paragraphs
and other articles are NOT MODELLED. MinisterialOrdinance, not an Act.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.LocalTaxSpecifiedRelativeIncomeCeiling

open JapanTaxLaw.TaxFinance

/-- 八十五万円 — inclusive upper bound (以下) for the specified relative's total income. -/
def incomeCeilingYen : Money := 850_000

/-- 「合計所得金額が八十五万円以下」: total income at most ¥850,000. -/
def withinIncomeRequirement (income : Money) : Prop :=
  income ≤ incomeCeilingYen

end JapanTaxLaw.LocalTaxSpecifiedRelativeIncomeCeiling
