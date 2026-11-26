import JapanTaxLaw.TaxFinance

/-
# LocalTax144_35LightOilReportWithin30Days — pinned clause 「前項に規定する者以外の者は、軽油の製造をした場合には、当該製造をした日から三十日以内に軽油の製造に関する事実及びその数量その他の総務省令で定める事項を、総務省令で定める道府県知事に報告しなければならない。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 144_35, paragraph 2.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|68f012fc552eb8c27456bcd4e8a1308a808cdfcc26e8d96b1ccc5084c3db665c.
Source path: LawBody[2]/MainProvision/MainProvision[1]/Article:144_35/Article#144_35/Paragraph#2/ParagraphSentence/Sentence#1.
原文逐語: 「前項に規定する者以外の者は、軽油の製造をした場合には、当該製造をした日から三十日以内に軽油の製造に関する事実及びその数量その他の総務省令で定める事項を、総務省令で定める道府県知事に報告しなければならない。」
Scope: ONLY 軽油の製造をした日から三十日以内に製造の事実及び数量その他の事項を報告する期間. The 前項の製造者自体, 総務省令で定める事項, 報告先の道府県知事, all other articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax144_35LightOilReportWithin30Days

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (30), INCLUSIVE. -/
def threshold : Nat := 30

/-- 「前項に規定する者以外の者は、軽油の製造をした場合には、当該製造をした日から三十日以内に軽油の製造に関する事実及びその数量その他の総務省令で定める事項を、総務省令で定める道府県知事に報告しなければならない。」. -/
def inScope (days : Nat) : Prop := days ≤ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (days : Nat) : Bool := decide (days ≤ 30)

end JapanTaxLaw.LocalTax144_35LightOilReportWithin30Days
