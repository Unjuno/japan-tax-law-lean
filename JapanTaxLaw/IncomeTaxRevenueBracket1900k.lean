import JapanTaxLaw.TaxFinance

/-!
# IncomeTaxRevenueBracket1900k — 所得税法 第二十八条(3)1（収入金額 百九十万以下）

Pinned source:
  Law id: 340AC0000000033
  Official title: 所得税法
  Law number: 昭和四十年法律第三十三号
  Law type: Act (法律)
  Revision: 340AC0000000033_20261001_507AC0000000070
  Raw snapshot: data/raw/340AC0000000033_20261001_507AC0000000070.law.json
  sha256: 94c4a7ad83726cde60787967ed4e959585ad0af9279d25db9aa02264b3fe606b
  Normative unit id: NORM|29b80207cb1b9b303c8f2a8d3c08e25749e128999613e26b7902d375f1f78853
  Source path: LawBody[3]/MainProvision/MainProvision[1]/Article:28/Article#28/
               Paragraph#3/Item#1/ItemSentence/Column#1/Sentence#1
  Article caption: （給与所得）
  Tier 1: the revenue (収入金額) specified in the preceding paragraph is at most
  百九十万 (以下 = inclusive), derived programmatically from the verbatim needle.

原文逐語（pinned, 一字一句改変なし）:
  「前項に規定する収入金額が百九十万円以下である場合」

Variable contract (円, domain Nat):
  revenueCeilingYen : Money := 1_900_000
  inBracket revenue := revenue ≤ revenueCeilingYen (以下 = inclusive).

Scope: only this tier's numeric upper bound is modeled. The preceding paragraph's
revenue definition, the other tiers, the tax computation, other items/paragraphs
and other articles are NOT MODELLED.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.IncomeTaxRevenueBracket1900k

open JapanTaxLaw.TaxFinance

/-- 収入金額上限 百九十万 (以下). Derived from verbatim source. -/
def revenueCeilingYen : Money := 1_900_000

/-- 収入金額が上限内か（境界値は上限内）. -/
def inBracket (revenue : Money) : Prop := revenue ≤ revenueCeilingYen

end JapanTaxLaw.IncomeTaxRevenueBracket1900k
