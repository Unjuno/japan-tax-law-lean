import JapanTaxLaw.TaxFinance

/-
# LocalTax8_2SuccessorMunicipalitiesTwoOrMore — pinned clause 「前項の規定によつて消滅市町村の徴収金に係る権利を承継する承継市町村が二以上ある場合において、当該承継市町村がそれぞれ承継すべき当該消滅市町村の徴収金に係る権利について当該承継市町村の長の間において意見を異にし、その協議がととのわないときは、道府県知事（当該承継市町村が二以上の道府県の区域にわたる場合においては、総務大臣）に対し、その決定を求める旨を申し出なければならない。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 8_2, paragraph 2.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|89c650f9534ab2e9b9799e0f28360499115842268f6025843a75720d1e080b6b.
Source path: LawBody[2]/MainProvision/MainProvision[0]/Article:8_2/Article#8_2/Paragraph#2/ParagraphSentence/Sentence#1.
原文逐語: 「前項の規定によつて消滅市町村の徴収金に係る権利を承継する承継市町村が二以上ある場合において、当該承継市町村がそれぞれ承継すべき当該消滅市町村の徴収金に係る権利について当該承継市町村の長の間において意見を異にし、その協議がととのわないときは、道府県知事（当該承継市町村が二以上の道府県の区域にわたる場合においては、総務大臣）に対し、その決定を求める旨を申し出なければならない。」
Scope: ONLY the 承継市町村が二以上 (successor municipalities ≥ 2) INCLUSIVE lower bound for requesting a 道府県知事 decision. 意見の異同・協議の不成立・道府県をまたぐ場合の総務大臣への申出先・他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax8_2SuccessorMunicipalitiesTwoOrMore

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (2), INCLUSIVE lower bound. -/
def threshold : Nat := 2

/-- 「前項の規定によつて消滅市町村の徴収金に係る権利を承継する承継市町村が二以上ある場合において、当該承継市町村がそれぞれ承継すべき当該消滅市町村の徴収金に係る権利について当該承継市町村の長の間において意見を異にし、その協議がととのわないときは、道府県知事（当該承継市町村が二以上の道府県の区域にわたる場合においては、総務大臣）に対し、その決定を求める旨を申し出なければならない。」. -/
def inScope (municipalities : Nat) : Prop := threshold ≤ municipalities

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (municipalities : Nat) : Bool := decide (2 ≤ municipalities)

end JapanTaxLaw.LocalTax8_2SuccessorMunicipalitiesTwoOrMore
