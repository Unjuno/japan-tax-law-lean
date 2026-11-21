import JapanTaxLaw.TaxFinance

/-!
# InheritanceTaxDelinquencyException — 相続税法 第三十八条(4)（延納税額百万円以下・延納期間三年以下の例外）

Pinned source:
  Law id: 325AC0000000073
  Official title: 相続税法
  Law number: 昭和二十五年法律第七十三号
  Law type: Act (法律)
  Revision: 325AC0000000073_20260401_506AC0000000008
  Raw snapshot: data/raw/325AC0000000073_20260401_506AC0000000008.law.json
  sha256: c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7
  Normative unit id: NORM|6c27921434c59ba57a352e0bf3f7ff011871be1423b177bd348091a1ab4d0156
  Source path: LawBody[3]/MainProvision/MainProvision[5]/Article:38/Article#38/
               Paragraph#4/ParagraphSentence/Sentence#2
  Statutory article: 第三十八条(4) — 延納税額百万円以下かつ延納期間三年以下の例外

原文逐語（pinned, 一字一句改変なし）:
  「ただし、その延納税額が百万円以下で、かつ、その延納期間が三年以下である場合は、この限りでない。」

Variable contract:
  `maxDelinquencyYen : Money := 1_000_000` = 百万円 (inclusive upper bound: 以下).
  `maxPeriodYears : Nat := 3` = 三年 (inclusive upper bound: 以下).
  `exceptionApplies delinquencyYen periodYears :=
     delinquencyYen ≤ maxDelinquencyYen ∧ periodYears ≤ maxPeriodYears`.
  Unit 円 / 年; domain Nat. 「以下」 = ≤ (inclusive); 「かつ」 = conjunctive AND.

Scope: only the exception CONDITION (the two conjuncts). The preceding rule that
「この限りでない」 overrides, how 延納税額 and 延納期間 are computed, other
paragraphs, and other articles are NOT MODELLED.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.InheritanceTaxDelinquencyException

open JapanTaxLaw.TaxFinance

/-- 百万円 — inclusive upper bound for the delinquency tax amount (以下). -/
def maxDelinquencyYen : Money := 1_000_000

/-- 三年 — inclusive upper bound for the delinquency period in years (以下). -/
def maxPeriodYears : Nat := 3

/-- 「延納税額が百万円以下で、かつ、その延納期間が三年以下」: conjunctive exception condition. -/
def exceptionApplies (delinquencyYen : Money) (periodYears : Nat) : Prop :=
  delinquencyYen ≤ maxDelinquencyYen ∧ periodYears ≤ maxPeriodYears

end JapanTaxLaw.InheritanceTaxDelinquencyException
