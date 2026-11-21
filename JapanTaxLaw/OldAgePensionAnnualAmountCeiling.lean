import JapanTaxLaw.TaxFinance

/-!
# OldAgePensionAnnualAmountCeiling — 地方税法施行令 附則第三条(1)5（老齢等年金 年額 十八万未満）

Pinned source:
  Law id: 325CO0000000245
  Official title: 地方税法施行令
  Law number: 昭和二十五年政令第二百四十五号
  Law type: CabinetOrder (政令)
  Revision: 325CO0000000245_20261101_508CO0000000083
  Raw snapshot: data/raw/325CO0000000245_20261101_508CO0000000083.law.json
  sha256: 9bc03b230fb0ed1039e33a1544cd53772939ee25d6d4648a386400ea269dfb17
  Normative unit id: NORM|ce36009183d70cb6fbd8f7c665ef5c61f4a650f71c3d0715a220c72f780eb0ce
  Source path: LawBody[499]/SupplProvision/SupplProvision[2]/Article:3/Article#3/
               Paragraph#1/Item#5/ItemSentence/Sentence#1
  Article caption: （国民健康保険税の特別徴収の開始に伴う経過措置）
  The case where the recipient's old-age pension annual amount is LESS THAN
  十八万 (十八万円未満 — strict <, boundary excluded), derived programmatically
  from the verbatim needle. This is a 附則 (supplementary) provision: find_article_text
  sees MainProvision only, so the audit uses a file-kind transcription locator.

原文逐語（pinned, 一字一句改変なし）:
  「当該世帯主の老齢等年金給付の年額が十八万円未満である場合」

Variable contract (円/year, domain Nat):
  annualCeilingYen : Money := 180_000
  belowAnnualCeiling amount := amount < annualCeilingYen (未満 = strict <).

Scope: only this strict ceiling is modeled. The rest of the 附則 provision,
the recipient definition, other items and other articles are NOT MODELLED.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.OldAgePensionAnnualAmountCeiling

open JapanTaxLaw.TaxFinance

/-- 十八万円 — strict upper bound (未満). Derived from verbatim source. -/
def annualCeilingYen : Money := 180_000

/-- 老齢等年金の年額が十八万円未満: amount strictly less than ¥180,000. -/
def belowAnnualCeiling (amount : Money) : Prop :=
  amount < annualCeilingYen

end JapanTaxLaw.OldAgePensionAnnualAmountCeiling
