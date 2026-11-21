import JapanTaxLaw.TaxFinance

/-!
# LiquorTaxSakeAlcoholBracket15_16 — 酒税法 附則第三十八条(1)（清酒に関する特例: アルコール分 十五度以上十六度未満）

Pinned source:
  Law id: 328AC0000000006
  Official title: 酒税法
  Law number: 昭和二十八年法律第六号
  Law type: Act (法律)
  Revision: 328AC0000000006_20260525_506AC0000000052
  Raw snapshot: data/raw/328AC0000000006_20260525_506AC0000000052.law.json
  sha256: 01d87149a80f64fa70d8b6eafffead6341982d902c4d206630cbc3f91c781e70
  Normative unit id: NORM|20df6a4420603ab9709d60a910136e38180bd27752be45e45997a943ffa1f7c2
  Source path: LawBody[27]/SupplProvision/SupplProvision[3]/Article:38/Article#38/
               Paragraph#1/ParagraphSentence/Sentence#2/QuoteStruct/List/ListSentence/
               Column#2/Sentence#1
  Statutory article: 附則第三十八条 — caption （清酒に関する特例）. This is a
    transitional provision applying the OLD 酒税法 (pre-amendment) rate table;
    the needle is the イ特級（１） row: alcohol 十五度以上十六度未満 → 五十七万六百円.

原文逐語（pinned, 一字一句改変なし）:
  「アルコール分が十五度以上十六度未満のもの　五十七万六百円」

Variable contract:
  alcoholLowerInclusiveDegrees : Nat := 15 (十五度以上 — inclusive lower bound)
  alcoholUpperExclusiveDegrees : Nat := 16 (十六度未満 — exclusive upper bound)
  taxAmountYen : Money := 570_600 (五十七万六百円)
  inBracket degrees := 15 ≤ degrees ∧ degrees < 16
  「以上」 = ≥ (inclusive); 「未満」 = < (exclusive).

Scope: only this alcohol-degree bracket and its paired amount are modeled. The
transition period, new/old law comparison, other classes (特級/二級 etc.), other
bracket rows and other articles are NOT MODELLED. This is a 附則 (transitional)
unit — find_article_text sees MainProvision only, so the audit uses a file-kind
transcription locator for the verbatim needle.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.LiquorTaxSakeAlcoholBracket15_16

open JapanTaxLaw.TaxFinance

/-- 十五度 — inclusive lower bound (以上). -/
def alcoholLowerInclusiveDegrees : Nat := 15

/-- 十六度 — exclusive upper bound (未満). -/
def alcoholUpperExclusiveDegrees : Nat := 16

/-- 五十七万六百円 — amount paired with this bracket. -/
def taxAmountYen : Money := 570_600

/-- アルコール分が十五度以上十六度未満のもの. -/
def inBracket (degrees : Nat) : Prop :=
  alcoholLowerInclusiveDegrees ≤ degrees ∧ degrees < alcoholUpperExclusiveDegrees

end JapanTaxLaw.LiquorTaxSakeAlcoholBracket15_16
