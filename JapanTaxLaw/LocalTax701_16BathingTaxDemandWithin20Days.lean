import JapanTaxLaw.TaxFinance

/-
# LocalTax701_16BathingTaxDemandWithin20Days — pinned clause 「特別徴収義務者が納期限（更正又は決定があつた場合においては、不足金額の納期限をいう。以下入湯税について同じ。）までに入湯税に係る地方団体の徴収金を完納しない場合においては、市町村の徴税吏員は、納期限後二十日以内に、督促状を発しなければならない。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 701_16, paragraph 1.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|cf61e618cbcd19ce040da9aae8d6138c285cd207d1a6c42d7c97c3a895897a78.
Source path: LawBody[2]/MainProvision/MainProvision[3]/Article:701_16/Article#701_16/Paragraph#1/ParagraphSentence/Sentence#1.
原文逐語: 「特別徴収義務者が納期限（更正又は決定があつた場合においては、不足金額の納期限をいう。以下入湯税について同じ。）までに入湯税に係る地方団体の徴収金を完納しない場合においては、市町村の徴税吏員は、納期限後二十日以内に、督促状を発しなければならない。」
Scope: ONLY the 納期限後二十日以内 (days ≤ 20) INCLUSIVE ceiling for issuing a 督促状 for 入湯税. 完納の事実認定・督促状の内容・発付手続・他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax701_16BathingTaxDemandWithin20Days

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (20), INCLUSIVE ceiling. -/
def threshold : Nat := 20

/-- 「特別徴収義務者が納期限（更正又は決定があつた場合においては、不足金額の納期限をいう。以下入湯税について同じ。）までに入湯税に係る地方団体の徴収金を完納しない場合においては、市町村の徴税吏員は、納期限後二十日以内に、督促状を発しなければならない。」。 -/
def inScope (days : Nat) : Prop := days ≤ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (days : Nat) : Bool := decide (days ≤ 20)

end JapanTaxLaw.LocalTax701_16BathingTaxDemandWithin20Days
