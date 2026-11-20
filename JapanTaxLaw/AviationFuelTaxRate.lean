import JapanTaxLaw.TaxFinance

/-!
# AviationFuelTaxRate — 航空機燃料税法 art.11（税率）

Pinned source:
  Law id: 347AC0000000007
  Revision: 347AC0000000007_20250601_504AC0000000068
  Enforcement: 2025-06-01
  Raw snapshot: data/raw/347AC0000000007_20250601_504AC0000000068.law.json
  sha256: de83a01b558cca9d07af779b71416c9d15d5e62ecabfefcb00eb9e1cd18dbbde
  Normative unit id: NORM|99061309435f403e991be4370b1f7f7970c0769f7b3d705d98e00de8673ed91b
  Source path: LawBody[2]/MainProvision/MainProvision[1]/Article:11/Article#11/
               Paragraph#1/ParagraphSentence/Sentence#1
  Statutory article: art. 11

原文逐語（pinned, 一字一句改変なし）:
  「航空機燃料税の税率は、航空機燃料一キロリットルにつき二万六千円とする。」

Variable contract:
  `kilolitres : Money` = 航空機燃料の数量, unit キロリットル (kL),
  domain Nat (non-negative integers).
  Result unit: 円 (Money = Nat).
  二万六千円 = 26,000 円 / キロリットル.

Scope: only the art.11 rate constant and its linear application to a
caller-supplied quantity. NOT MODELLED: 第八条 非課税, 第十条 課税標準,
第十四条 / 第十五条 申告・納付, and 附則 経過措置. This is a computable slice
of one norm unit, not an article-level or law-level completion claim.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.AviationFuelTaxRate

open JapanTaxLaw.TaxFinance

/-- art.11: 「航空機燃料一キロリットルにつき二万六千円」。単位: 円 / kL。 -/
def ratePerKilolitre : Money := 26_000

/-- 航空機燃料税額 = 数量(kL) × 26,000円/kL. -/
def taxForKilolitres (kilolitres : Money) : Money :=
  kilolitres * ratePerKilolitre

end JapanTaxLaw.AviationFuelTaxRate
