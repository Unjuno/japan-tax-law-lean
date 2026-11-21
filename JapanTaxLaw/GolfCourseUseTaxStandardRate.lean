import JapanTaxLaw.TaxFinance

/-!
# GolfCourseUseTaxStandardRate — 地方税法 第七十六条(1)（ゴルフ場利用税の標準税率）

Pinned source:
  Law id: 325AC0000000226
  Official title: 地方税法
  Law number: 昭和二十五年法律第二百二十六号
  Law type: Act (法律)
  Revision: 325AC0000000226_20261101_508AC0000000002
  Raw snapshot: data/raw/325AC0000000226_20261101_508AC0000000002.law.json
  sha256: 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53
  Normative unit id: NORM|f345a99128087aed87634e8963422db557c8f7daa6b17adec119fe0aceb3cdfa
  Source path: LawBody[2]/MainProvision/MainProvision[1]/Article:76/Article#76/
               Paragraph#1/ParagraphSentence/Sentence#1
  Statutory article: 第七十六条(1) — ゴルフ場利用税の標準税率、一人一日につき八百円

原文逐語（pinned, 一字一句改変なし）:
  「ゴルフ場利用税の標準税率は、一人一日につき八百円とする。」

Variable contract:
  `standardRateYenPerPersonPerDay : Money := 800` = 八百円 (one person, one day).
  `standardTaxYen people days := standardRateYenPerPersonPerDay * people * days`.
  Unit 円/(人・日); domain Nat. This is the 標準税率 (standard rate) stated by
  the Act — not necessarily the actual rate a municipality may set (local
  variation / 税率の特例 out of scope).

Scope: only the ¥800 standard rate and its linear extension over people/days
are modeled. The tax base, rate-setting procedure, exemptions, other paragraphs
and other articles are NOT MODELLED.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.GolfCourseUseTaxStandardRate

open JapanTaxLaw.TaxFinance

/-- 八百円 — 標準税率 (one person, one day). -/
def standardRateYenPerPersonPerDay : Money := 800

/-- 標準税額 = 800 円 × 人日数 (people × days). -/
def standardTaxYen (people : Money) (days : Money) : Money :=
  standardRateYenPerPersonPerDay * (people * days)

end JapanTaxLaw.GolfCourseUseTaxStandardRate
