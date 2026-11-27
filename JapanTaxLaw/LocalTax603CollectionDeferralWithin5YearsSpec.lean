import JapanTaxLaw.LocalTax603CollectionDeferralWithin5Years

/-
# LocalTax603CollectionDeferralWithin5YearsSpec — independent spec for 地方税法 Num 603/3

Needle 「市町村長は、土地の所有者等から前二項の規定の適用があるべき旨の申告があり、当該申告が真実であると認められるときは、当該土地の取得の日から五年以内で政令で定める期間を限つて、当該土地に係る特別土地保有税に係る地方団体の徴収金の徴収を猶予するものとする。」.
The implementation uses `years <= threshold`; the independent spec states
the statutory INCLUSIVE upper bound as `years <= 5`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以上」/「以下」/「以内」 are INCLUSIVE: the threshold itself qualifies.
-/
namespace JapanTaxLaw.LocalTax603CollectionDeferralWithin5Years

open JapanTaxLaw.TaxFinance

def specInScope (years : Nat) : Prop := years <= 5

theorem agree_scope (years : Nat) : inScope years ↔ specInScope years := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.LocalTax603CollectionDeferralWithin5Years
