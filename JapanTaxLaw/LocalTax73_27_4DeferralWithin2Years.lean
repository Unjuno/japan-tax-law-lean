import JapanTaxLaw.TaxFinance

/-
# LocalTax73_27_4DeferralWithin2Years — pinned clause 「道府県は、不動産の取得に対して課する不動産取得税を賦課徴収する場合において、当該不動産の取得者から、当該道府県の条例で定めるところにより、当該不動産取得税について前項の規定の適用があるべき旨の申告があり、当該申告が真実であると認められるときは、当該取得の日から二年以内の期間を限つて、当該不動産に係る不動産取得税額を徴収猶予するものとする。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 73_27_4, paragraph 2.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|c02a507f8ab5cdf636c40c43bb7672cbf336b5dd346bc969f362dc48aa4339cd.
Source path: LawBody[2]/MainProvision/MainProvision[1]/Article:73_27_4/Article#73_27_4/Paragraph#2/ParagraphSentence/Sentence#1.
原文逐語: 「道府県は、不動産の取得に対して課する不動産取得税を賦課徴収する場合において、当該不動産の取得者から、当該道府県の条例で定めるところにより、当該不動産取得税について前項の規定の適用があるべき旨の申告があり、当該申告が真実であると認められるときは、当該取得の日から二年以内の期間を限つて、当該不動産に係る不動産取得税額を徴収猶予するものとする。」
Scope: ONLY 当該取得の日から二年以内の期間を限つて不動産取得税額を徴収猶予する. The 前項の適用があるべき旨の申告の真実性認定, the 市町村の条例で定めるところ, the 徴収猶予の手続一般 and all other paragraphs/articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax73_27_4DeferralWithin2Years

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (2), INCLUSIVE. -/
def threshold : Nat := 2

/-- 「当該取得の日から二年以内の期間を限つて不動産取得税額を徴収猶予する」. -/
def inScope (years : Nat) : Prop := years ≤ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (years : Nat) : Bool := decide (years ≤ 2)

end JapanTaxLaw.LocalTax73_27_4DeferralWithin2Years
