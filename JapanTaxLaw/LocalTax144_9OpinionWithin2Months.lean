import JapanTaxLaw.TaxFinance

/-
# LocalTax144_9OpinionWithin2Months — pinned clause 「ただし、関係道府県知事と意見を異にする場合においては、当該書類を受け取つた日から二月以内に、自己の意見を付して、当該書類を総務大臣に送付するとともに、その指示を求めなければならない。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 144_9, paragraph 5.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|c90ef816ff3c43e4ff6d397e8c1e9d833c132ad2ae0e639c47c9932e427b0aaf.
Source path: LawBody[2]/MainProvision/MainProvision[1]/Article:144_9/Article#144_9/Paragraph#5/ParagraphSentence/Sentence#2.
原文逐語: 「ただし、関係道府県知事と意見を異にする場合においては、当該書類を受け取つた日から二月以内に、自己の意見を付して、当該書類を総務大臣に送付するとともに、その指示を求めなければならない。」
Scope: ONLY 書類を受け取つた日から二月以内に自己の意見を付して総務大臣に送付. The 意見を異にする場合 condition, the 指示を求めなければならない effect, the other paragraphs of 第百四十四条の九 and all other articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax144_9OpinionWithin2Months

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (2), INCLUSIVE. -/
def threshold : Nat := 2

/-- 「書類を受け取つた日から二月以内に自己の意見を付して総務大臣に送付」. -/
def inScope (months : Nat) : Prop := months ≤ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (months : Nat) : Bool := decide (months ≤ 2)

end JapanTaxLaw.LocalTax144_9OpinionWithin2Months
