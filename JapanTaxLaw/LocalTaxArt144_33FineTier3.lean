import JapanTaxLaw.TaxFinance

/-!
# LocalTaxArt144_33FineTier3 — 地方税法 第百四十四条の三十三(6)3（罰金 一億以下）

Pinned source:
  Law id: 325AC0000000226
  Official title: 地方税法
  Law number: 昭和二十五年法律第二百二十六号
  Law type: Act (法律)
  Revision: 325AC0000000226_20261101_508AC0000000002
  Raw snapshot: data/raw/325AC0000000226_20261101_508AC0000000002.law.json
  sha256: 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53
  Normative unit id: NORM|0959740800d3f276a35a9b6893c69379d386135b93a0cda6a4a877fa425ae308
  Source path: LawBody[2]/MainProvision/MainProvision[1]/Article:144_33/Article#144_33/
               Paragraph#6/Item#3/ItemSentence/Column#2/Sentence#1
  Article caption: （製造等の承認を受ける義務等に関する罪）
  Fine ceiling 一億 (以下 = inclusive), derived programmatically from verbatim needle.

原文逐語（pinned, 一字一句改変なし）:
  「一億円以下の罰金刑」

Variable contract (円, domain Nat):
  maxFineYen : Money := 100_000_000
  withinFineLimit fine := fine ≤ maxFineYen (以下 = inclusive).

Scope: only this fine ceiling is modeled. The offense conditions, other fine
tiers (items 1/2), other paragraphs and articles are NOT MODELLED.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.LocalTaxArt144_33FineTier3

open JapanTaxLaw.TaxFinance

/-- 罰金上限 一億 (以下). Derived from verbatim source. -/
def maxFineYen : Money := 100_000_000

/-- 罰金が上限内か（境界値は上限内）. -/
def withinFineLimit (fine : Money) : Prop := fine ≤ maxFineYen

end JapanTaxLaw.LocalTaxArt144_33FineTier3
