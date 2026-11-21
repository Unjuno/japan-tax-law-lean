import JapanTaxLaw.TaxFinance

/-!
# LocalTaxCapitalOverFiveBillion — 地方税法 第五十二条(1)五（資本金 五十億円超）

Pinned source:
  Law id: 325AC0000000226
  Official title: 地方税法
  Law number: 昭和二十五年法律第二百二十六号
  Law type: Act (法律)
  Revision: 325AC0000000226_20261101_508AC0000000002
  Raw snapshot: data/raw/325AC0000000226_20261101_508AC0000000002.law.json
  sha256: 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53
  Normative unit id: NORM|7ad4bd2c2491460ddfddc4cf486a3f14e5d327ee265c5435e097fb7417198ff4
  Source path: LawBody[2]/MainProvision/MainProvision[1]/Article:52/Article#52/
               Paragraph#1/TableStruct/Table/TableRow/TableColumn/Sentence#1
  Article caption: （法人の均等割の税率）
  Category 五: a corporation whose 資本金等の額 strictly exceeds 五十億
  (五十億円を超える — strict >, NO upper bound). Threshold derived programmatically.

原文逐語（pinned, 一字一句改変なし）:
  「五　資本金等の額を有する法人で資本金等の額が五十億円を超えるもの」

Variable contract (円, domain Nat):
  capitalThresholdYen : Money := 5_000_000_000
  exceedsCapitalThreshold capital := capitalThresholdYen < capital (strict >; no upper bound).

Scope: only this lower-bound strict condition is modeled. The other categories
(二/三/四), the tax computation, other paragraphs and articles are NOT MODELLED.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.LocalTaxCapitalOverFiveBillion

open JapanTaxLaw.TaxFinance

/-- 五十億円 — strict lower bound (を超える). Derived from verbatim source. -/
def capitalThresholdYen : Money := 5_000_000_000

/-- 資本金等の額が五十億円を超える: capital strictly greater than ¥THRESHOLD. -/
def exceedsCapitalThreshold (capital : Money) : Prop :=
  capitalThresholdYen < capital

end JapanTaxLaw.LocalTaxCapitalOverFiveBillion
