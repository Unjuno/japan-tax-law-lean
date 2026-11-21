import JapanTaxLaw.TaxFinance

/-!
# TaxAccountantFineLimit — 税理士法 第六十一条(1)（罰金: 百万円以下）

Pinned source:
  Law id: 326AC1000000237
  Official title: 税理士法
  Law number: 昭和二十六年法律第二百三十七号
  Law type: Act (法律)
  Revision: 326AC1000000237_20251001_505AC0000000053
  Raw snapshot: data/raw/326AC1000000237_20251001_505AC0000000053.law.json
  sha256: 46d956e2c48954577ec3479c5e8c83a2a2ff913860a2ba6b2eea327f3107916f
  Normative unit id: NORM|b184122a9d2a8592751ebeb1a6872fbc6be6328b78f6a6febe1119ff04f6dc67
  Source path: LawBody[2]/MainProvision/MainProvision[8]/Article:61/Article#61/
               Paragraph#1/ParagraphSentence/Sentence#1
  Statutory article: 第六十一条(1) — 罰金 百万以下 (fine ≤ 1_000_000 yen).
    Article 61 has no caption; Item 1-3 reference 第五十三条 violations.

原文逐語（pinned, 一字一句改変なし）:
  「次の各号のいずれかに該当する場合には、その違反行為をした者は、百万円以下の罰金に処する。」

Variable contract:
  maxFineYen : Money := 1_000_000 — derived programmatically from the
  verbatim needle's kanji numeral 百万 (百万円). 「以下」 = ≤ (inclusive).

Scope: only the fine ceiling is modeled. The violation conditions (各号 / 第五十三条),
imprisonment (none in this clause), other paragraphs and other articles are NOT MODELLED.
Actual sentencing is judicial.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.TaxAccountantFineLimit

open JapanTaxLaw.TaxFinance

/-- 百万円 — fine ceiling (以下, inclusive). Derived from verbatim source. -/
def maxFineYen : Money := 1_000_000

/-- 「百万円以下の罰金」: fine at most ¥1_000_000. -/
def withinFineLimit (fine : Money) : Prop :=
  fine ≤ maxFineYen

end JapanTaxLaw.TaxAccountantFineLimit
