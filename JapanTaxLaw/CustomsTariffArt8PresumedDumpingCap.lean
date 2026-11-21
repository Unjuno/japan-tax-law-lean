import JapanTaxLaw.TaxFinance

/-!
# CustomsTariffArt8PresumedDumpingCap — 関税定率法 第八条(9)（不当廉売関税）PRESUMPTION

Pinned source:
  Law id: 143AC0000000054
  Official title: 関税定率法
  Law number: 明治四十三年法律第五十四号
  Law type: Act (法律)
  Revision: 143AC0000000054_20260601_508AC0000000005
  Raw snapshot: data/raw/143AC0000000054_20260601_508AC0000000005.law.json
  sha256: 924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c
  Normative unit id: NORM|5cdae38077e32d914408ab1b404758a66e06527b3356598d85111dc8f185a9a5
  Source path: LawBody[1]/MainProvision/MainProvision[17]/Article:8/Article#8/
               Paragraph#9/Item#1/ItemSentence/Sentence#1
  Article caption: （不当廉売関税）

原文逐語（pinned, 一字一句改変なし）:
  「当該貨物の正常価格と推定される価格と不当廉売価格と推定される価格との差額に相当する額と同額以下の暫定的な関税を課すること。」

Norm kind: PRESUMPTION. The statute uses PRESUMED prices: 正常価格と推定される価格
(price presumed to be the normal price) and 不当廉売価格と推定される価格 (price presumed to
be the unfair low-sale price). 不当廉売 (dumping) is selling below the
normal price. The 暫定的な関税 (provisional duty) is capped at 同額以下 the
差額に相当する額 between the two presumed prices. The computable slice models: the two
presumed prices, their difference (dumping margin), and the cap on the duty.

Variable contract (meaning / unit / domain / type):
  Money = Nat (円). Unit of price and duty: 円. Domain: Nat (>= 0).
  正常価格と推定される価格 : presumed normal price (円).
  不当廉売価格と推定される価格 : presumed unfair-sale price (円).
  In dumping, the normal price exceeds the unfair-sale price; the margin is
  their difference.
  dumpingMargin := normal - unfair (Nat saturating subtraction).
  withinCap duty := duty ≤ dumpingMargin (同額以下 = at most the margin).

Faithfulness: the statute PRESUMES the two prices (推定される価格 = prices taken
as presumed for the investigation). How those presumed prices are determined
(the investigation method) is NOT MODELED — only their relationship and the
duty cap. The normal-price definition (an ordinance-defined price) is a
separate norm unit.

Scope: only this cap relationship. The investigation method, the normal-price
definition, other items/paragraphs, other articles and legal correctness are
NOT MODELLED. No legal-correctness claim; human legal review remains pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.CustomsTariffArt8PresumedDumpingCap

open JapanTaxLaw.TaxFinance

/-- 正常価格と推定される価格 and 不当廉売価格と推定される価格 (the two PRESUMED prices, 円). -/
structure PresumedPrices where
  normal : Money   -- 正常価格と推定される価格
  unfair : Money   -- 不当廉売価格と推定される価格

/-- 差額に相当する額: dumping margin = presumed normal - presumed unfair
    (Nat saturating subtraction yields 0 when unfair >= normal). -/
def dumpingMargin (p : PresumedPrices) : Money := p.normal - p.unfair

/-- 同額以下 暫定的な関税: provisional duty at most the margin. -/
def withinCap (p : PresumedPrices) (duty : Money) : Prop :=
  duty ≤ dumpingMargin p

end JapanTaxLaw.CustomsTariffArt8PresumedDumpingCap
