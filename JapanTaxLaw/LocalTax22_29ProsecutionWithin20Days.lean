import JapanTaxLaw.TaxFinance

/-
# LocalTax22_29ProsecutionWithin20Days — pinned clause 「地方団体の長は、犯則者が前条第一項の通告（同条第三項の規定による更正があつた場合には、当該更正。以下この条において「通告等」という。）を受けた場合において、当該通告等を受けた日の翌日から起算して二十日以内に当該通告の旨を履行しないときは、検察官に告発しなければならない。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 22_29, paragraph 1.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|a0d29eaffc5136b71dc88e39d943e51acdb5e27e3aba46f3a944e74c77185070.
Source path: LawBody[2]/MainProvision/MainProvision[0]/Article:22_29/Article#22_29/Paragraph#1/ParagraphSentence/Sentence#1.
原文逐語: 「地方団体の長は、犯則者が前条第一項の通告（同条第三項の規定による更正があつた場合には、当該更正。以下この条において「通告等」という。）を受けた場合において、当該通告等を受けた日の翌日から起算して二十日以内に当該通告の旨を履行しないときは、検察官に告発しなければならない。」
Scope: ONLY the 通告等を受けた日の翌日から起算して二十日以内に当該通告の旨を履行しないとき (days <= 20) INCLUSIVE ceiling for the 検察官への告発. 前条第一項の通告・同条第三項の更正・通告等の定義・告発の効果・他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax22_29ProsecutionWithin20Days

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (20), INCLUSIVE ceiling. -/
def threshold : Nat := 20

/-- 「地方団体の長は、犯則者が前条第一項の通告（同条第三項の規定による更正があつた場合には、当該更正。以下この条において「通告等」という。）を受けた場合において、当該通告等を受けた日の翌日から起算して二十日以内に当該通告の旨を履行しないときは、検察官に告発しなければならない。」. -/
def inScope (days : Nat) : Prop := days ≤ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (days : Nat) : Bool := decide (days ≤ 20)

end JapanTaxLaw.LocalTax22_29ProsecutionWithin20Days
