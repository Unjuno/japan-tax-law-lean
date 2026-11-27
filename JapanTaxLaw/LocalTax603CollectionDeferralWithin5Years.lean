import JapanTaxLaw.TaxFinance

/-
# LocalTax603CollectionDeferralWithin5Years — pinned clause 「市町村長は、土地の所有者等から前二項の規定の適用があるべき旨の申告があり、当該申告が真実であると認められるときは、当該土地の取得の日から五年以内で政令で定める期間を限つて、当該土地に係る特別土地保有税に係る地方団体の徴収金の徴収を猶予するものとする。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 603, paragraph 3.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|2f54baade3b1536a963886b5ee761456894f741158f39c87934ccb9785745a9f.
原文逐語: 「市町村長は、土地の所有者等から前二項の規定の適用があるべき旨の申告があり、当該申告が真実であると認められるときは、当該土地の取得の日から五年以内で政令で定める期間を限つて、当該土地に係る特別土地保有税に係る地方団体の徴収金の徴収を猶予するものとする。」
Scope: ONLY the 取得の日から五年以内 (years <= 5) INCLUSIVE upper bound on the deferral period. 政令で定める期間・申告の真実性判定・前二項・他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax603CollectionDeferralWithin5Years

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (5), INCLUSIVE upper bound. -/
def threshold : Nat := 5

/-- 「市町村長は、土地の所有者等から前二項の規定の適用があるべき旨の申告があり、当該申告が真実であると認められるときは、当該土地の取得の日から五年以内で政令で定める期間を限つて、当該土地に係る特別土地保有税に係る地方団体の徴収金の徴収を猶予するものとする。」. -/
def inScope (years : Nat) : Prop := years <= threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (years : Nat) : Bool := decide (years <= 5)

end JapanTaxLaw.LocalTax603CollectionDeferralWithin5Years
