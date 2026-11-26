import JapanTaxLaw.TaxFinance

/-
# LocalTax63CovidRevenueCeiling70Percent — pinned clause 「新型コロナウイルス感染症及びそのまん延防止のための措置の影響により当該中小事業者等の事業収入割合が百分の七十以下となる場合（前号に掲げる場合を除く。）」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 63, paragraph 1.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|c35ee98744ccc80bb3d6b925eebf58da4cc987cb655bfc560ec17b229ffdd042.
Source path: LawBody[3]/SupplProvision/SupplProvision[201]/Article:63/Article#63/Paragraph#1/Item#2/ItemSentence/Column#1/Sentence#1.
原文逐語: 「新型コロナウイルス感染症及びそのまん延防止のための措置の影響により当該中小事業者等の事業収入割合が百分の七十以下となる場合（前号に掲げる場合を除く。）」
Scope: ONLY 附則第201条 新型コロナウイルス感染症の影響による中小事業者等の事業収入割合が百分の七十以下となる場合. The 前号に掲げる場合, 感染症の定義, 中小事業者等の範囲, the rate table of other items and all other articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax63CovidRevenueCeiling70Percent

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (70), INCLUSIVE. -/
def threshold : Nat := 70

/-- 「新型コロナウイルス感染症及びそのまん延防止のための措置の影響により当該中小事業者等の事業収入割合が百分の七十以下となる場合（前号に掲げる場合を除く。）」. -/
def inScope (percent : Nat) : Prop := percent ≤ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (percent : Nat) : Bool := decide (percent ≤ 70)

end JapanTaxLaw.LocalTax63CovidRevenueCeiling70Percent
