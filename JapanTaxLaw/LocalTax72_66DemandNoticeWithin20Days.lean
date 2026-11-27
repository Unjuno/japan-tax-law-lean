import JapanTaxLaw.TaxFinance

/-
# LocalTax72_66DemandNoticeWithin20Days — pinned clause 「納税者が納期限（法人の行う事業に対する事業税について更正又は決定があつた場合においては、不足税額の納期限をいう。以下法人の行う事業に対する事業税について同じ。）までに事業税に係る地方団体の徴収金を完納しない場合においては、道府県の徴税吏員は、納期限後二十日以内に、督促状を発しなければならない。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 72_66, paragraph 1.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|08797f1dc55dcad9efa1c8fbc50505c9009e4d6cb4715d269dc7dfc4af313117.
Source path: LawBody[2]/MainProvision/MainProvision[1]/Article:72_66/Article#72_66/Paragraph#1/ParagraphSentence/Sentence#1.
原文逐語: 「納税者が納期限（法人の行う事業に対する事業税について更正又は決定があつた場合においては、不足税額の納期限をいう。以下法人の行う事業に対する事業税について同じ。）までに事業税に係る地方団体の徴収金を完納しない場合においては、道府県の徴税吏員は、納期限後二十日以内に、督促状を発しなければならない。」
Scope: ONLY the 納期限後二十日以内 (days ≤ 20) ceiling. 完納の事実認定・督促状の内容・発付手続・他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax72_66DemandNoticeWithin20Days

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (20), INCLUSIVE ceiling. -/
def threshold : Nat := 20

/-- 「納税者が納期限（法人の行う事業に対する事業税について更正又は決定があつた場合においては、不足税額の納期限をいう。以下法人の行う事業に対する事業税について同じ。）までに事業税に係る地方団体の徴収金を完納しない場合においては、道府県の徴税吏員は、納期限後二十日以内に、督促状を発しなければならない。」. -/
def inScope (days : Nat) : Prop := days ≤ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (days : Nat) : Bool := decide (days ≤ 20)

end JapanTaxLaw.LocalTax72_66DemandNoticeWithin20Days
