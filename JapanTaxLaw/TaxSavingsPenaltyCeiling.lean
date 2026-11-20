import JapanTaxLaw.TaxFinance

/-!
# TaxSavingsPenaltyCeiling — 納税貯蓄組合法 art.14（十万円以下の過料）

Pinned source:
  Law id: 326AC1000000145
  Law number: 昭和二十六年法律第百四十五号
  Revision: 326AC1000000145_20211122_503AC0000000046
  Raw snapshot: data/raw/326AC1000000145_20211122_503AC0000000046.law.json
  sha256: fc6c4ca152291c10c1218a62303a879195bfbbe95a056d0e264ee0315bbc4e2b
  Normative unit id: NORM|91349ec2d835e0fe4fdd63ea17f15c1ce9a98c22d91c36f03bea07410596f64e
  Source path: LawBody[1]/MainProvision/MainProvision[14]/Article:14/Article#14/
               Paragraph#1/ParagraphSentence/Sentence#1
  Statutory article: art.14(1) — 次の各号のいずれかに該当する者は、十万円以下の過料に処する。

Law identity verified: INVENTORY official_title = 納税貯蓄組合法;
raw JSON revision_info/law_title = 納税貯蓄組合法 (both checked after the
earlier wrong-law finding on a different unit).

原文逐語（pinned, 一字一句改変なし）:
  「次の各号のいずれかに該当する者は、十万円以下の過料に処する。」

Variable contract:
  `penaltyAmount : Money` = the 過料 (administrative fine) imposed, unit 円,
  domain Nat. `penaltyCeilingYen : Money := 100_000` = 十万円.
  The clause sets an upper bound: the 過料 must not exceed ¥100,000
  (「十万円以下」 is inclusive). Which persons fall under the 各号 is NOT
  modelled — this slice is the numeric ceiling only.

Scope: only the penalty ceiling. The enumerated 各号 (who is liable), the
fine-imposition procedure, other paragraphs and 政令 details are NOT MODELLED.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.TaxSavingsPenaltyCeiling

open JapanTaxLaw.TaxFinance

/-- 十万円. Unit 円; domain Nat. -/
def penaltyCeilingYen : Money := 100_000

/-- 「十万円以下の過料」: the fine amount is at most ¥100,000 (inclusive). -/
def withinPenaltyCeiling (penaltyAmount : Money) : Prop :=
  penaltyAmount ≤ penaltyCeilingYen

end JapanTaxLaw.TaxSavingsPenaltyCeiling
