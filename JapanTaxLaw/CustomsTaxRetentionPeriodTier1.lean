import JapanTaxLaw.TaxFinance

/-!
# CustomsTaxRetentionPeriodTier1 — 酒税法 附則第八条(3)1（税額 十万以下 → 二）

Pinned source:
  Law id: 328AC0000000006
  Official title: 酒税法
  Law number: 昭和二十八年法律第六号
  Law type: Act (法律)
  Revision: 328AC0000000006_20260525_506AC0000000052
  Raw snapshot: data/raw/328AC0000000006_20260525_506AC0000000052.law.json
  sha256: 01d87149a80f64fa70d8b6eafffead6341982d902c4d206630cbc3f91c781e70
  Normative unit id: NORM|bc51dc849add02245a14da178b3e8f3c6bbe070e2bd6da1783e7593c20b8c4cb
  Source path: LawBody[16]/SupplProvision/SupplProvision[5]/Article:8/Article#8/
               Paragraph#3/Item#1/ItemSentence/Sentence#1
  Article caption: （手持品課税）
  Tier 1: when the tax amount is at most 十万 (十万円以下 = inclusive),
  the period is 二. Both values derived programmatically from the
  verbatim needle. This is a 附則 unit: find_article_text sees MainProvision
  only, so the audit uses a file-kind transcription locator.

原文逐語（pinned, 一字一句改変なし）:
  「その税額が十万円以下のとき。　二月」

Variable contract (円 / months, domain Nat):
  taxAmountCeilingYen : Money := 100_000
  retentionMonths : Nat := 2
  withinTier tax := tax ≤ taxAmountCeilingYen (以下 = inclusive).

Scope: only this tier's numeric ceiling and period are modeled. The other tiers,
the retention procedure, the rest of the 附則 and other articles are NOT MODELLED.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.CustomsTaxRetentionPeriodTier1

open JapanTaxLaw.TaxFinance

/-- 税額上限 十万 (以下). Derived from verbatim source. -/
def taxAmountCeilingYen : Money := 100_000

/-- 保存期間 = 二 (月). -/
def retentionMonths : Nat := 2

/-- 当該税額区分か（境界値は上限内）. -/
def withinTier (tax : Money) : Prop := tax ≤ taxAmountCeilingYen

end JapanTaxLaw.CustomsTaxRetentionPeriodTier1
