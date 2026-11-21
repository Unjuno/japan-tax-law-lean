import JapanTaxLaw.TaxFinance

/-!
# InheritanceRegSurrenderValueCondition — 相続税法施行規則 第三十条(6)第一号（解約返戻金相当額百万円以下）

Pinned source:
  Law id: 325M50000040017
  Official title: 相続税法施行規則
  Law number: 昭和二十五年大蔵省令第十七号
  Law type: MinisterialOrdinance (省令)
  Revision: 325M50000040017_20260901_506M60000040016
  Raw snapshot: data/raw/325M50000040017_20260901_506M60000040016.law.json
  sha256: a4e46e6eba52b6f8a47365590d34aff35e9eeea4bbc7186ecdace837e35b552f
  Normative unit id: NORM|3daed7032fbd5a44d506ecc932b48bce17af305cb0e6dbb9d5645a184086d483
  Source path: LawBody[2]/MainProvision/MainProvision[44]/Article:30/Article#30/
               Paragraph#6/Item#1/ItemSentence/Sentence#1
  Statutory article: 第三十条(6)第一号 — 解約返戻金相当額百万円以下の生命保険契約又は損害保険契約

原文逐語（pinned, 一字一句改変なし）:
  「解約返戻金相当額が百万円以下である生命保険契約又は損害保険契約」

Variable contract:
  `thresholdYen : Money := 1_000_000` = 百万円 (inclusive upper bound: 以下).
  `inScope surrenderValue := surrenderValue ≤ thresholdYen`.
  Unit 円; domain Nat. 「以下」 = ≤ (inclusive).

Scope: only this surrender-value ceiling. The surrounding definition that this
Item contributes to, other items, other paragraphs, computation of
解約返戻金相当額, and other articles are NOT MODELLED.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.InheritanceRegSurrenderValueCondition

open JapanTaxLaw.TaxFinance

/-- 百万円 — inclusive upper bound (以下). Unit 円; domain Nat. -/
def thresholdYen : Money := 1_000_000

/-- 「解約返戻金相当額が百万円以下」: surrender value at most ¥1,000,000. -/
def inScope (surrenderValue : Money) : Prop :=
  surrenderValue ≤ thresholdYen

end JapanTaxLaw.InheritanceRegSurrenderValueCondition
