import JapanTaxLaw.TaxFinance

/-
# LocalTax166DemandWithin20Days — pinned clause 「納税者が納期限までに自動車税に係る地方団体の徴収金を完納しない場合には、道府県の徴税吏員は、納期限後二十日以内に、督促状を発しなければならない。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 166, paragraph 1.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|96f5bbdae1475e92ed620ff4b6bc654cdc9f4eeb053208e5dd10880a2b0e83bd.
Source path: LawBody[2]/MainProvision/MainProvision[1]/Article:166/Article#166/Paragraph#1/ParagraphSentence/Sentence#1.
原文逐語: 「納税者が納期限までに自動車税に係る地方団体の徴収金を完納しない場合には、道府県の徴税吏員は、納期限後二十日以内に、督促状を発しなければならない。」
Scope: ONLY 納期限後二十日以内に督促状を発する期間. The 納期限の定義, 完納判定, 督促状の記載事項, the 不動産取得税/軽自動車税/固定資産税 parallel 二十日 clauses and all other articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax166DemandWithin20Days

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (20), INCLUSIVE. -/
def threshold : Nat := 20

/-- 「納税者が納期限までに自動車税に係る地方団体の徴収金を完納しない場合には、道府県の徴税吏員は、納期限後二十日以内に、督促状を発しなければならない。」. -/
def inScope (days : Nat) : Prop := days ≤ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (days : Nat) : Bool := decide (days ≤ 20)

end JapanTaxLaw.LocalTax166DemandWithin20Days
