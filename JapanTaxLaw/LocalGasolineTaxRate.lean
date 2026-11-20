import JapanTaxLaw.TaxFinance

/-!
# LocalGasolineTaxRate — 地方揮発油税法 art.4（税率）

Pinned source:
  Law id: 330AC0000000104
  Revision: 330AC0000000104_20260401_508AC0000000012
  Enforcement: 2026-04-01
  Raw snapshot: data/raw/330AC0000000104_20260401_508AC0000000012.law.json
  sha256: c37f8a705911e90745b865522b1040e3ede192c0a3fee7bbb95727320bc9900a
  Normative unit id: NORM|7eb549f9aeb97856ee098142bf07352e2d9dd52855e9afdd5db3e8c5236a64f8
  Source path: LawBody[1]/MainProvision/MainProvision[3]/Article:4/Article#4/
               Paragraph#1/ParagraphSentence/Sentence#1
  Statutory article: art. 4

原文逐語（pinned, 一字一句改変なし）:
  「地方揮発油税の税率は、揮発油一キロリットルにつき四千四百円とする。」

Variable contract:
  `kilolitres : Money` = 揮発油の数量, unit キロリットル (kL),
  domain Nat (non-negative integers).
  Result unit: 円 (Money = Nat).
  四千四百円 = 4,400 円 / キロリットル.

Scope: only the art.4 rate constant and its linear application to a
caller-supplied quantity. NOT MODELLED (exact captions from the pinned law):
第三条（課税標準）, 第五条（納税義務者）, 第六条（未納税移出等）,
第七条（申告及び納付等, including the 二百八十七分の四十四 rate interaction）,
第八条（担保の提供）, 第九条（戻入れの場合の地方揮発油税の控除等）,
第十条（延滞税）, 第十一条〜第十五条 (加算税・還付・端数計算・罰則),
and 附則 経過措置. This is a computable slice of one norm unit, not an
article-level or law-level completion claim.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.LocalGasolineTaxRate

open JapanTaxLaw.TaxFinance

/-- art.4: 「揮発油一キロリットルにつき四千四百円」。単位: 円 / kL。 -/
def ratePerKilolitre : Money := 4_400

/-- 地方揮発油税額 = 数量(kL) × 4,400円/kL. -/
def taxForKilolitres (kilolitres : Money) : Money :=
  kilolitres * ratePerKilolitre

end JapanTaxLaw.LocalGasolineTaxRate
