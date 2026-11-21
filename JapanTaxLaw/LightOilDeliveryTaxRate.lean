import JapanTaxLaw.TaxFinance

/-!
# LightOilDeliveryTaxRate — 地方税法 第百四十四条の十（軽油引取税の税率）

Pinned source:
  Law id: 325AC0000000226
  Official title: 地方税法
  Law number: 昭和二十五年法律第二百二十六号
  Law type: Act (法律)
  Revision: 325AC0000000226_20261101_508AC0000000002
  Raw snapshot: data/raw/325AC0000000226_20261101_508AC0000000002.law.json
  sha256: 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53
  Normative unit id: NORM|1f1e4ed103a791c1b9d4b42f6e04fe784e392a84286e09d3396eba710c8773e2
  Source path: LawBody[2]/MainProvision/MainProvision[1]/Article:144_10/Article#144_10/
               Paragraph#1/ParagraphSentence/Sentence#1
  Article caption: （軽油引取税の税率）
  The 軽油引取税 rate is 一万五千 per kilolitre (一キロリットルにつき), derived
  programmatically from the verbatim needle.

原文逐語（pinned, 一字一句改変なし）:
  「軽油引取税の税率は、一キロリットルにつき、一万五千円とする。」

Variable contract (円/kilolitre, domain Nat for whole kilolitres):
  rateYenPerKilolitre : Money := 15_000
  taxYen kilolitres := rateYenPerKilolitre * kilolitres.

Scope: only the rate and its linear extension over whole kilolitres are modeled.
Fractional kilolitres, exemptions, the tax base, other paragraphs and other
articles are NOT MODELLED.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.LightOilDeliveryTaxRate

open JapanTaxLaw.TaxFinance

/-- 軽油引取税の税率 = 一万五千 / kilolitre. Derived from verbatim source. -/
def rateYenPerKilolitre : Money := 15_000

/-- 税額 = 税率 × キロリットル数. -/
def taxYen (kilolitres : Money) : Money := rateYenPerKilolitre * kilolitres

end JapanTaxLaw.LightOilDeliveryTaxRate
