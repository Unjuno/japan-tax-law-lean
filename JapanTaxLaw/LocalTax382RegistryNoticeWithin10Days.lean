import JapanTaxLaw.TaxFinance

/-
# LocalTax382RegistryNoticeWithin10Days — pinned clause 「登記所は、土地又は建物の表示に関する登記をしたときは、十日以内に、その旨その他総務省令で定める事項を当該土地又は家屋の所在地の市町村長に通知しなければならない。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 382, paragraph 1.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|5caf843beaf39506ec441ad9aac4efc5fefee5659817016975740e4a8dcbd948.
Source path: LawBody[2]/MainProvision/MainProvision[2]/Article:382/Article#382/Paragraph#1/ParagraphSentence/Sentence#1.
原文逐語: 「登記所は、土地又は建物の表示に関する登記をしたときは、十日以内に、その旨その他総務省令で定める事項を当該土地又は家屋の所在地の市町村長に通知しなければならない。」
Scope: ONLY 登記をした日から十日以内に登記所が市町村長へ通知する期間. The 登記の種別, 総務省令で定める事項, 通知先の市町村長の範囲, all other articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax382RegistryNoticeWithin10Days

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (10), INCLUSIVE. -/
def threshold : Nat := 10

/-- 「登記所は、土地又は建物の表示に関する登記をしたときは、十日以内に、その旨その他総務省令で定める事項を当該土地又は家屋の所在地の市町村長に通知しなければならない。」. -/
def inScope (days : Nat) : Prop := days ≤ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (days : Nat) : Bool := decide (days ≤ 10)

end JapanTaxLaw.LocalTax382RegistryNoticeWithin10Days
