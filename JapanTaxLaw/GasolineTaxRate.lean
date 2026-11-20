import JapanTaxLaw.TaxFinance
import JapanTaxLaw.LocalGasolineTaxRate

/-!
# GasolineTaxRate — 揮発油税法 art.9（税率）

Pinned source:
  Law id: 332AC0000000055
  Revision: 332AC0000000055_20260525_506AC0000000052
  Enforcement: 2026-05-25
  Raw snapshot: data/raw/332AC0000000055_20260525_506AC0000000052.law.json
  sha256: e5e7d4286963a6424652cc86c75341a6c64d972e4e3e7ef22670ddcf2801de9a
  Normative unit id: NORM|8bf684764da81b921477924a5e17db0d25d2ddfae535431c99302894578f927c
  Source path: LawBody[3]/MainProvision/MainProvision[1]/Article:9/Article#9/
               Paragraph#1/ParagraphSentence/Sentence#1
  Statutory article: art. 9

原文逐語（pinned, 一字一句改変なし）:
  「揮発油税の税率は、揮発油一キロリットルにつき二万四千三百円とする。」

Variable contract:
  `kilolitres : Money` = 揮発油の数量, unit キロリットル (kL),
  domain Nat (non-negative integers).
  Result unit: 円 (Money = Nat).
  二万四千三百円 = 24,300 円 / キロリットル.

Scope: only the art.9 rate constant and its linear application to a
caller-supplied quantity. NOT MODELLED (exact captions from the pinned law):
第三条（納税義務者）, 第八条（課税標準）, 第十条 / 第十一条（申告）,
第十四条（未納税移出）, 第十五条（輸出免税）,
第十六条（移出に係る灯油の免税）, 第十七条（戻入れの場合の揮発油税の控除等）,
第十八条（保全担保）, and 附則・経過措置. This is a computable slice of one
norm unit, not an article-level or law-level completion claim.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.GasolineTaxRate

open JapanTaxLaw.TaxFinance

/-- art.9: 「揮発油一キロリットルにつき二万四千三百円」。単位: 円 / kL。 -/
def ratePerKilolitre : Money := 24_300

/-- 揮発油税額 = 数量(kL) × 24,300円/kL. -/
def taxForKilolitres (kilolitres : Money) : Money :=
  kilolitres * ratePerKilolitre

end JapanTaxLaw.GasolineTaxRate
