import JapanTaxLaw.TaxFinance

/-
# LocalTax458LightVehicleDemandWithin20Days — pinned clause 「納税者が納期限までに軽自動車税に係る地方団体の徴収金を完納しない場合には、市町村の徴税吏員は、納期限後二十日以内に、督促状を発しなければならない。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 458, paragraph 1.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|fb1eda70cad1d60754855910428afd28796008909ad18852f979510e80de12ed.
Source path: LawBody[2]/MainProvision/MainProvision[2]/Article:458/Article#458/Paragraph#1/ParagraphSentence/Sentence#1.
原文逐語: 「納税者が納期限までに軽自動車税に係る地方団体の徴収金を完納しない場合には、市町村の徴税吏員は、納期限後二十日以内に、督促状を発しなければならない。」
Scope: ONLY the 納期限後二十日以内 (days ≤ 20) INCLUSIVE ceiling for issuing a 督促状 for 軽自動車税. 完納の事実認定・督促状の内容・発付手続・他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax458LightVehicleDemandWithin20Days

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (20), INCLUSIVE ceiling. -/
def threshold : Nat := 20

/-- 「納税者が納期限までに軽自動車税に係る地方団体の徴収金を完納しない場合には、市町村の徴税吏員は、納期限後二十日以内に、督促状を発しなければならない。」. -/
def inScope (days : Nat) : Prop := days ≤ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (days : Nat) : Bool := decide (days ≤ 20)

end JapanTaxLaw.LocalTax458LightVehicleDemandWithin20Days
