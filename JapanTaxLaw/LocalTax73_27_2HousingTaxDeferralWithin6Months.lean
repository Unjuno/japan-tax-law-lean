import JapanTaxLaw.TaxFinance

/-
# LocalTax73_27_2HousingTaxDeferralWithin6Months — pinned clause 「道府県は、住宅の取得に対して課する不動産取得税を賦課徴収する場合において、当該住宅の取得者から、当該道府県の条例で定めるところにより、当該不動産取得税について前項の規定の適用があるべき旨の申告があり、当該申告が真実であると認められるときは、当該取得の日から六月以内の期間を限つて、当該住宅に係る不動産取得税額のうち同項の規定により減額すべき額に相当する税額を徴収猶予するものとする。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 73_27_2, paragraph 2.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|c168278a98a5e0a24ca6f3e4afc9fe43c1702de97aef1f0c2178d7fd8d16d64f.
Source path: LawBody[2]/MainProvision/MainProvision[1]/Article:73_27_2/Article#73_27_2/Paragraph#2/ParagraphSentence/Sentence#1.
原文逐語: 「道府県は、住宅の取得に対して課する不動産取得税を賦課徴収する場合において、当該住宅の取得者から、当該道府県の条例で定めるところにより、当該不動産取得税について前項の規定の適用があるべき旨の申告があり、当該申告が真実であると認められるときは、当該取得の日から六月以内の期間を限つて、当該住宅に係る不動産取得税額のうち同項の規定により減額すべき額に相当する税額を徴収猶予するものとする。」
Scope: ONLY the 住宅の取得の日から六月以内の期間 (months ≤ 6) INCLUSIVE ceiling for 徴収猶予 of 不動産取得税. 申告の真実性・減額すべき額の算定・条例の定め・他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax73_27_2HousingTaxDeferralWithin6Months

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (6), INCLUSIVE ceiling. -/
def threshold : Nat := 6

/-- 「道府県は、住宅の取得に対して課する不動産取得税を賦課徴収する場合において、当該住宅の取得者から、当該道府県の条例で定めるところにより、当該不動産取得税について前項の規定の適用があるべき旨の申告があり、当該申告が真実であると認められるときは、当該取得の日から六月以内の期間を限つて、当該住宅に係る不動産取得税額のうち同項の規定により減額すべき額に相当する税額を徴収猶予するものとする。」. -/
def inScope (months : Nat) : Prop := months ≤ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (months : Nat) : Bool := decide (months ≤ 6)

end JapanTaxLaw.LocalTax73_27_2HousingTaxDeferralWithin6Months
