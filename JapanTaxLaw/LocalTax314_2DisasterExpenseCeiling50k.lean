import JapanTaxLaw.TaxFinance

/-
# LocalTax314_2DisasterExpenseCeiling50k — pinned clause 「損失の金額に含まれる災害関連支出の金額（損失の金額のうち災害に直接関連して支出をした金額として政令で定める金額をいう。以下この号において同じ。）が五万円以下である場合（災害関連支出の金額がない場合を含む。）」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 314_2, paragraph 1, item 1.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|d8d7b0c15d19914c08c6a785dbc3f29d7ccddc822b57d955b319f2593243cc7c.
Source path: LawBody[2]/MainProvision/MainProvision[2]/Article:314_2/Article#314_2/Paragraph#1/Item#1/Subitem1#1/Subitem1Sentence/Column#1/Sentence#1.
原文逐語: 「損失の金額に含まれる災害関連支出の金額（損失の金額のうち災害に直接関連して支出をした金額として政令で定める金額をいう。以下この号において同じ。）が五万円以下である場合（災害関連支出の金額がない場合を含む。）」
Scope: ONLY 災害関連支出の金額が五万円以下である場合（金額がない場合を含む）. The 五万円を超える部分 subtraction rule, the 災害関連支出の金額がない場合 inclusion, the 第三十四条 parallel occurrence and all other subitems are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax314_2DisasterExpenseCeiling50k

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (50000), INCLUSIVE. -/
def threshold : Nat := 50000

/-- 「災害関連支出の金額が五万円以下である場合（金額がない場合を含む）」. -/
def inScope (expense : Nat) : Prop := expense ≤ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (expense : Nat) : Bool := decide (expense ≤ 50000)

end JapanTaxLaw.LocalTax314_2DisasterExpenseCeiling50k
