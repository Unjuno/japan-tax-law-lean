import JapanTaxLaw.TaxFinance

/-
# LocalTax20_9_3UnavoidableReasonWithin2Months — pinned clause 「その他当該地方税の法定納期限後に生じた前二号に類する政令で定めるやむを得ない理由があるとき。　当該理由が生じた日の翌日から起算して二月以内」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 20_9_3, paragraph 2, item 3.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|75034509ba5d2231b887bb3c9b813cba6e2ade8221a8a42cb8d76f3a5d3a6ed5.
Source path: LawBody[2]/MainProvision/MainProvision[0]/Article:20_9_3/Article#20_9_3/Paragraph#2/Item#3/ItemSentence/Sentence#1.
原文逐語: 「その他当該地方税の法定納期限後に生じた前二号に類する政令で定めるやむを得ない理由があるとき。　当該理由が生じた日の翌日から起算して二月以内」
Scope: ONLY 政令で定めるやむを得ない理由が生じた日の翌日から起算して二月以内. The 第一号・第二号のやむを得ない理由, the 政令で定める理由の認定, the 第二号 parallel clause (modelled in batch 267) and all other items/articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax20_9_3UnavoidableReasonWithin2Months

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (2), INCLUSIVE. -/
def threshold : Nat := 2

/-- 「政令で定めるやむを得ない理由が生じた日の翌日から起算して二月以内」. -/
def inScope (months : Nat) : Prop := months ≤ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (months : Nat) : Bool := decide (months ≤ 2)

end JapanTaxLaw.LocalTax20_9_3UnavoidableReasonWithin2Months
