import JapanTaxLaw.TaxFinance

/-
# LocalTax144_49LightOilDemandWithin20Days — pinned clause 「軽油引取税の特別徴収義務者又は納税者が納期限（更正又は決定があつた場合においては、不足金額の納期限をいう。以下この節において同じ。）までに軽油引取税に係る地方団体の徴収金を完納しない場合においては、道府県の徴税吏員は、納期限後二十日以内に、督促状を発しなければならない。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 144_49, paragraph 1.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|6c828ca046a2a3c665bd07b7480cf1c8c6e49eeb1352c85a4817bbcc84151623.
Source path: LawBody[2]/MainProvision/MainProvision[1]/Article:144_49/Article#144_49/Paragraph#1/ParagraphSentence/Sentence#1.
原文逐語: 「軽油引取税の特別徴収義務者又は納税者が納期限（更正又は決定があつた場合においては、不足金額の納期限をいう。以下この節において同じ。）までに軽油引取税に係る地方団体の徴収金を完納しない場合においては、道府県の徴税吏員は、納期限後二十日以内に、督促状を発しなければならない。」
Scope: ONLY the 納期限後二十日以内 (days ≤ 20) INCLUSIVE ceiling for issuing a 督促状 for 軽油引取税. 更正又は決定の有無・完納認定・督促状の内容・発付手続・他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax144_49LightOilDemandWithin20Days

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (20), INCLUSIVE ceiling. -/
def threshold : Nat := 20

/-- 「軽油引取税の特別徴収義務者又は納税者が納期限（更正又は決定があつた場合においては、不足金額の納期限をいう。以下この節において同じ。）までに軽油引取税に係る地方団体の徴収金を完納しない場合においては、道府県の徴税吏員は、納期限後二十日以内に、督促状を発しなければならない。」. -/
def inScope (days : Nat) : Prop := days ≤ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (days : Nat) : Bool := decide (days ≤ 20)

end JapanTaxLaw.LocalTax144_49LightOilDemandWithin20Days
