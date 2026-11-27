import JapanTaxLaw.TaxFinance

/-
# LocalTax73_27_6RealEstateTaxDeferralWithin5Years — pinned clause 「道府県は、不動産の取得に対して課する不動産取得税を賦課徴収する場合において、当該不動産の取得者から、当該道府県の条例で定めるところにより、当該不動産取得税について前項の規定の適用があるべき旨の申告があり、当該申告が真実であると認められるときは、当該取得の日から五年以内の期間（当該不動産が同項に規定する土地改良事業に係るものである場合には、同日から同項に規定する一年を経過する日までの期間）を限つて、当該不動産に係る不動産取得税額を徴収猶予するものとする。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 73_27_6, paragraph 2.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|b42f738e6ba9ca28a29e93d26cd569610fb7fc4f7952a7e9fd31649cd068c41b.
原文逐語: 「道府県は、不動産の取得に対して課する不動産取得税を賦課徴収する場合において、当該不動産の取得者から、当該道府県の条例で定めるところにより、当該不動産取得税について前項の規定の適用があるべき旨の申告があり、当該申告が真実であると認められるときは、当該取得の日から五年以内の期間（当該不動産が同項に規定する土地改良事業に係るものである場合には、同日から同項に規定する一年を経過する日までの期間）を限つて、当該不動産に係る不動産取得税額を徴収猶予するものとする。」
Scope: ONLY the 取得の日から五年以内 (years <= 5) INCLUSIVE upper bound on the 徴収猶予 period. 条例で定める申告・真実性判定・土地改良事業の一年特例・他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax73_27_6RealEstateTaxDeferralWithin5Years

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (5), INCLUSIVE upper bound. -/
def threshold : Nat := 5

/-- 「道府県は、不動産の取得に対して課する不動産取得税を賦課徴収する場合において、当該不動産の取得者から、当該道府県の条例で定めるところにより、当該不動産取得税について前項の規定の適用があるべき旨の申告があり、当該申告が真実であると認められるときは、当該取得の日から五年以内の期間（当該不動産が同項に規定する土地改良事業に係るものである場合には、同日から同項に規定する一年を経過する日までの期間）を限つて、当該不動産に係る不動産取得税額を徴収猶予するものとする。」. -/
def inScope (years : Nat) : Prop := years <= threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (years : Nat) : Bool := decide (years <= 5)

end JapanTaxLaw.LocalTax73_27_6RealEstateTaxDeferralWithin5Years
