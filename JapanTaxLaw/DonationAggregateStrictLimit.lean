import JapanTaxLaw.TaxFinance

/-!
# DonationAggregateStrictLimit — 租税特別措置法施行規則 第十九条の十の五(1)8?（寄附金合計額 千円未満）

Pinned source:
  Law id: 332M50000040015
  Official title: 租税特別措置法施行規則
  Law number: 昭和三十二年大蔵省令第十五号
  Law type: MinisterialOrdinance (省令)
  Revision: 332M50000040015_20261101_507M60000040026
  Raw snapshot: data/raw/332M50000040015_20261101_507M60000040026.law.json
  sha256: 2e5d3e585b99e15ffb030c8b6fa0dcc6ccf7cc9532924fa5b6438a68cc05767c
  Normative unit id: NORM|f9d7893b78c08532ce572d0c5aae7b2d0e7d7c8519ae58683652401a1808c3a7
  Source path: LawBody[4]/MainProvision/MainProvision[1]/Article:19_10_5/Article#19_10_5/
               Paragraph#8/Item#2/ItemSentence/Sentence#1
  Article caption: （公益社団法人等に寄附をした場合の所得税額の特別控除）
  The needle defines the case where the aggregate donation from one person during
  the assessment period is LESS THAN 千 (千円に満たない — strict <, unlike 以下).
  LIMIT derived programmatically from the verbatim needle.

原文逐語（pinned, 一字一句改変なし）:
  「実績判定期間における同一の者から受け入れた寄附金の額の合計額が千円に満たない場合の当該合計額」

Variable contract (円, domain Nat):
  strictLimitYen : Money := 1_000
  withinStrictLimit total := total < strictLimitYen  (千円に満たない = strict <).

Scope: only this strict upper bound is modeled. The assessment-period definition,
the donation acceptance rules, other items/paragraphs and other articles are NOT MODELLED.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.DonationAggregateStrictLimit

open JapanTaxLaw.TaxFinance

/-- 千円に満たない — strict upper bound. Derived from verbatim source. -/
def strictLimitYen : Money := 1_000

/-- 合計額が千円に満たない: total strictly less than ¥LIMIT. -/
def withinStrictLimit (total : Money) : Prop :=
  total < strictLimitYen

end JapanTaxLaw.DonationAggregateStrictLimit
