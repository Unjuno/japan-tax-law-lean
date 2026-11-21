import JapanTaxLaw.TaxFinance

/-!
# LocalTaxPerCapitaStandardRate — 地方税法 第三百十条（個人の均等割 標準税率 三千）

Pinned source:
  Law id: 325AC0000000226
  Official title: 地方税法
  Law number: 昭和二十五年法律第二百二十六号
  Law type: Act (法律)
  Revision: 325AC0000000226_20261101_508AC0000000002
  Raw snapshot: data/raw/325AC0000000226_20261101_508AC0000000002.law.json
  sha256: 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53
  Normative unit id: NORM|6c043582d2da5058b6951c3490ea577d84a5afd9b21669f9a8c4c5d579a77f5e
  Source path: LawBody[2]/MainProvision/MainProvision[2]/Article:310/Article#310/
               Paragraph#1/ParagraphSentence/Sentence#1
  Article caption: （個人の均等割の税率）
  The standard rate (標準税率) for 個人の均等割 is 三千, derived programmatically
  from the verbatim needle. All statutory terms injected from the source.

原文逐語（pinned, 一字一句改変なし）:
  「個人の均等割の標準税率は、三千円とする。」

Variable contract (円, domain Nat):
  standardRateYen : Money := 3_000
  standardTaxYen persons := standardRateYen * persons.

Scope: only the standard rate and its linear extension are modeled. Local
rate variation, the tax base, other paragraphs and articles are NOT MODELLED.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.LocalTaxPerCapitaStandardRate

open JapanTaxLaw.TaxFinance

/-- 標準税率 = 三千. Derived from verbatim source. -/
def standardRateYen : Money := 3_000

/-- 税額 = 標準税率 × 人数. -/
def standardTaxYen (persons : Money) : Money := standardRateYen * persons

end JapanTaxLaw.LocalTaxPerCapitaStandardRate
