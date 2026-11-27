import JapanTaxLaw.TaxFinance

/-
# LocalTax321_15DecisionWithin60Days — pinned clause 「総務大臣は、第四項の申出を受けた場合においては、その日から六十日以内にその裁決をしなければならない。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 321_15, paragraph 7.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|e01d783fb8d9ceb468891417d069528301ba2d99882403c4b595b16b17549e29.
Source path: LawBody[2]/MainProvision/MainProvision[2]/Article:321_15/Article#321_15/Paragraph#7/ParagraphSentence/Sentence#1.
原文逐語: 「総務大臣は、第四項の申出を受けた場合においては、その日から六十日以内にその裁決をしなければならない。」
Scope: ONLY the 総務大臣が第四項の申出を受けた日から六十日以内 (days <= 60) INCLUSIVE ceiling for the 裁決. 第四項の申出の要件・裁決の内容・不服申立ての手続・他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax321_15DecisionWithin60Days

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (60), INCLUSIVE ceiling. -/
def threshold : Nat := 60

/-- 「総務大臣は、第四項の申出を受けた場合においては、その日から六十日以内にその裁決をしなければならない。」. -/
def inScope (days : Nat) : Prop := days ≤ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (days : Nat) : Bool := decide (days ≤ 60)

end JapanTaxLaw.LocalTax321_15DecisionWithin60Days
