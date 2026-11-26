import JapanTaxLaw.TaxFinance

/-
# LocalTax63TwoPrefecturesNotification — pinned clause 「政府は、法人税に係る更正又は決定の通知をした場合には、遅滞なく、当該更正又は決定に係る所得の金額及び法人税額を当該更正又は決定に係る法人税額の課税標準の算定期間の末日における当該法人の事務所又は事業所（二以上の道府県において事務所又は事業所を有する法人にあつては、その主たる事務所又は事業所）所在地の道府県知事に通知しなければならない。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 63, paragraph 2.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|f29661b98943a9d9ab14d83cebe1757e28b3f65543276704cd3bd8611c780beb.
Source path: LawBody[2]/MainProvision/MainProvision[1]/Article:63/Article#63/Paragraph#2/ParagraphSentence/Sentence#1.
原文逐語: 「政府は、法人税に係る更正又は決定の通知をした場合には、遅滞なく、当該更正又は決定に係る所得の金額及び法人税額を当該更正又は決定に係る法人税額の課税標準の算定期間の末日における当該法人の事務所又は事業所（二以上の道府県において事務所又は事業所を有する法人にあつては、その主たる事務所又は事業所）所在地の道府県知事に通知しなければならない。」
Scope: ONLY 二以上の道府県において事務所又は事業所を有する法人の主たる事務所所在地への通知. The 更正又は決定の通知の遅滞なく行う義務, the 課税標準の算定期間の末日, the 第七十二条の二十四の五 parallel occurrence of 「二以上の道府県」 and all other articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax63TwoPrefecturesNotification

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (2), INCLUSIVE. -/
def threshold : Nat := 2

/-- 「二以上の道府県において事務所又は事業所を有する法人の主たる事務所所在地への通知」. -/
def inScope (prefectures : Nat) : Prop := threshold ≤ prefectures

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (prefectures : Nat) : Bool := decide (2 ≤ prefectures)

end JapanTaxLaw.LocalTax63TwoPrefecturesNotification
