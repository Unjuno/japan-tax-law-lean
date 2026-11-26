import JapanTaxLaw.TaxFinance

/-
# LocalTax701_31Population300kPlus — pinned clause 「イ及びロに掲げる市以外の市で人口（官報で公示された最近の国勢調査の結果による人口その他これに準ずるものとして政令で定める人口をいう。）三十万以上のもののうち政令で指定するもの」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 701_31, paragraph 1.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|acdb4e25bdeee7c97f6e0cfaf9ad27c874dd29d631e81b310298b74a52e07611.
Source path: LawBody[2]/MainProvision/MainProvision[3]/Article:701_31/Article#701_31/Paragraph#1/Item#1/Subitem1#3/Subitem1Sentence/Sentence#1.
原文逐語: 「イ及びロに掲げる市以外の市で人口（官報で公示された最近の国勢調査の結果による人口その他これに準ずるものとして政令で定める人口をいう。）三十万以上のもののうち政令で指定するもの」
Scope: ONLY 人口三十万以上の市のうち政令で指定するものの指定条件. The イ及びロに掲げる市, 国勢調査の結果以外の人口, 政令指定の手続, all other items and articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax701_31Population300kPlus

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (300000), INCLUSIVE. -/
def threshold : Nat := 300000

/-- 「イ及びロに掲げる市以外の市で人口（官報で公示された最近の国勢調査の結果による人口その他これに準ずるものとして政令で定める人口をいう。）三十万以上のもののうち政令で指定するもの」. -/
def inScope (population : Nat) : Prop := threshold ≤ population

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (population : Nat) : Bool := decide (300000 ≤ population)

end JapanTaxLaw.LocalTax701_31Population300kPlus
