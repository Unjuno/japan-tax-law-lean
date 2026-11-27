import JapanTaxLaw.TaxFinance

/-
# LocalTax92DemandWithin20Days — pinned clause 「特別徴収義務者が納期限（更正又は決定があつた場合においては、不足金額の納期限をいう。以下ゴルフ場利用税について同じ。）までにゴルフ場利用税に係る地方団体の徴収金を完納しない場合においては、道府県の徴税吏員は、納期限後二十日以内に、督促状を発しなければならない。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 92, paragraph 1.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|f60eb01c231c6702a10dd9134cbf69fc4462c99ce8ffcf99e16303641903a163.
Source path: LawBody[2]/MainProvision/MainProvision[1]/Article:92/Article#92/Paragraph#1/ParagraphSentence/Sentence#1.
原文逐語: 「特別徴収義務者が納期限（更正又は決定があつた場合においては、不足金額の納期限をいう。以下ゴルフ場利用税について同じ。）までにゴルフ場利用税に係る地方団体の徴収金を完納しない場合においては、道府県の徴税吏員は、納期限後二十日以内に、督促状を発しなければならない。」
Scope: ONLY the 納期限後二十日以内 (days ≤ 20) INCLUSIVE ceiling for issuing a 督促状 for ゴルフ場利用税. 完納の事実認定・更正決定時の納期限・督促状の内容・発付手続・他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax92DemandWithin20Days

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (20), INCLUSIVE ceiling. -/
def threshold : Nat := 20

/-- 「特別徴収義務者が納期限（更正又は決定があつた場合においては、不足金額の納期限をいう。以下ゴルフ場利用税について同じ。）までにゴルフ場利用税に係る地方団体の徴収金を完納しない場合においては、道府県の徴税吏員は、納期限後二十日以内に、督促状を発しなければならない。」. -/
def inScope (days : Nat) : Prop := days ≤ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (days : Nat) : Bool := decide (days ≤ 20)

end JapanTaxLaw.LocalTax92DemandWithin20Days
