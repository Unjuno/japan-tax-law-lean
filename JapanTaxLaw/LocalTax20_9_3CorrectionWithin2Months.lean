import JapanTaxLaw.TaxFinance

/-
# LocalTax20_9_3CorrectionWithin2Months — pinned clause 「その申告、更正又は決定に係る課税標準等又は税額等の計算に当たつてその申告をし、又は決定を受けた者に帰属するものとされていた所得その他課税物件が他の者に帰属するものとする当該他の者に係る地方税の更正、決定又は賦課決定があつたとき。　当該更正、決定又は賦課決定があつた日の翌日から起算して二月以内」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 20_9_3, paragraph 2, item 2.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|c1671aa77270fba7d496c43306f648c02b94b91a89400cdf4c4e8b82477646fc.
Source path: LawBody[2]/MainProvision/MainProvision[0]/Article:20_9_3/Article#20_9_3/Paragraph#2/Item#2/ItemSentence/Sentence#1.
原文逐語: 「その申告、更正又は決定に係る課税標準等又は税額等の計算に当たつてその申告をし、又は決定を受けた者に帰属するものとされていた所得その他課税物件が他の者に帰属するものとする当該他の者に係る地方税の更正、決定又は賦課決定があつたとき。　当該更正、決定又は賦課決定があつた日の翌日から起算して二月以内」
Scope: ONLY 当該更正、決定又は賦課決定があつた日の翌日から起算して二月以内. The 課税標準等又は税額等の計算への帰属, the 第三号 parallel clause, the 更正決定の認定 and all other items/articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax20_9_3CorrectionWithin2Months

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (2), INCLUSIVE. -/
def threshold : Nat := 2

/-- 「当該更正、決定又は賦課決定があつた日の翌日から起算して二月以内」. -/
def inScope (months : Nat) : Prop := months ≤ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (months : Nat) : Bool := decide (months ≤ 2)

end JapanTaxLaw.LocalTax20_9_3CorrectionWithin2Months
