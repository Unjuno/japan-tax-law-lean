import JapanTaxLaw.TaxFinance

/-!
# LocalTaxArt144_33FineTier1 — 地方税法 第百四十四条の三十三(6)1（罰金 三億以下）

Pinned source:
  Law id: 325AC0000000226
  Official title: 地方税法
  Law number: 昭和二十五年法律第二百二十六号
  Law type: Act (法律)
  Revision: 325AC0000000226_20261101_508AC0000000002
  Raw snapshot: data/raw/325AC0000000226_20261101_508AC0000000002.law.json
  sha256: 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53
  Normative unit id: NORM|042d10f4f42521d77cc2888f4ef79647deb304ffc5dbcb5e0f0a2440c4d35ce1
  Source path: LawBody[2]/MainProvision/MainProvision[1]/Article:144_33/Article#144_33/
               Paragraph#6/Item#1/ItemSentence/Column#2/Sentence#1
  Article caption: （製造等の承認を受ける義務等に関する罪）
  Fine ceiling 三億 (以下 = inclusive), derived programmatically from the verbatim needle.

原文逐語（pinned, 一字一句改変なし）:
  「三億円以下の罰金刑」

Variable contract (円, domain Nat):
  maxFineYen : Money := 300_000_000
  withinFineLimit fine := fine ≤ maxFineYen (以下 = inclusive).

Scope: only this fine ceiling is modeled. The offense conditions, the other fine
tiers (items 2/3), other paragraphs and articles are NOT MODELLED.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.LocalTaxArt144_33FineTier1

open JapanTaxLaw.TaxFinance

/-- 罰金上限 三億 (以下). Derived from verbatim source. -/
def maxFineYen : Money := 300_000_000

/-- 罰金が上限内か（境界値は上限内）. -/
def withinFineLimit (fine : Money) : Prop := fine ≤ maxFineYen

end JapanTaxLaw.LocalTaxArt144_33FineTier1
