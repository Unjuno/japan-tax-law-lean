import JapanTaxLaw.TaxFinance

/-!
# LocalTaxDeductionSpouse — 地方税法 第二十三条(1)第八号（控除対象配偶者）

Pinned source:
  Law id: 325AC0000000226
  Official title: 地方税法
  Law number: 昭和二十五年法律第二百二十六号
  Law type: Act (法律)
  Revision: 325AC0000000226_20261101_508AC0000000002
  Raw snapshot: data/raw/325AC0000000226_20261101_508AC0000000002.law.json
  sha256: 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53
  Normative unit id: NORM|1c803e2d190195eb3ae5d4c1ebd12bfb79992ddc99b46827d139146b79c178fc
  Source path: LawBody[2]/MainProvision/MainProvision[1]/Article:23/Article#23/
               Paragraph#1/Item#8/ItemSentence/Column#2/Sentence#1
  Statutory article: 第二十三条(1)第八号 — defined term 控除対象配偶者 (deduction-eligible spouse).
    The relative clause 「前年の合計所得金額が千万円以下である」 modifies
    道府県民税の納税義務者 (the TAXPAYER), so ¥10M is the taxpayer's prior-year
    total income ceiling, NOT the spouse's. 同一生計配偶者 is cross-referenced
    from Item 7.

原文逐語（pinned, 一字一句改変なし）:
  「同一生計配偶者のうち、前年の合計所得金額が千万円以下である道府県民税の納税義務者の配偶者をいう。」

Variable contract:
  `incomeCeilingYen : Money := 10_000_000` = 千万円 (inclusive upper bound: 以下).
  `withinIncomeRequirement income := income ≤ incomeCeilingYen`.
  Here `income` denotes the 納税義務者's 前年の合計所得金額 (taxpayer's prior-year
  total income), NOT the spouse's income. Unit 円/year; domain Nat.
  「以下」 = ≤ (inclusive). Upper-bound-only (no lower bound in source).

Scope: only this taxpayer income-ceiling predicate is modeled. The defined term
控除対象配偶者, the cross-reference to 同一生計配偶者 (Item 7), other items,
other paragraphs and other articles are NOT MODELLED.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.LocalTaxDeductionSpouse

open JapanTaxLaw.TaxFinance

/-- 千万円 — inclusive upper bound (以下) for the taxpayer's prior-year total income. -/
def incomeCeilingYen : Money := 10_000_000

/-- 「納税義務者の前年の合計所得金額が千万円以下」: taxpayer income at most ¥10,000,000. -/
def withinIncomeRequirement (income : Money) : Prop :=
  income ≤ incomeCeilingYen

end JapanTaxLaw.LocalTaxDeductionSpouse
