import JapanTaxLaw.LocalTax73_27_6RealEstateTaxDeferralWithin5Years

/-
# LocalTax73_27_6RealEstateTaxDeferralWithin5YearsSpec — independent spec for 地方税法 Num 73_27_6/2

Needle 「道府県は、不動産の取得に対して課する不動産取得税を賦課徴収する場合において、当該不動産の取得者から、当該道府県の条例で定めるところにより、当該不動産取得税について前項の規定の適用があるべき旨の申告があり、当該申告が真実であると認められるときは、当該取得の日から五年以内の期間（当該不動産が同項に規定する土地改良事業に係るものである場合には、同日から同項に規定する一年を経過する日までの期間）を限つて、当該不動産に係る不動産取得税額を徴収猶予するものとする。」.
The implementation uses `years <= threshold`; the independent spec states
the statutory INCLUSIVE upper bound as `years <= 5`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以上」/「以下」/「以内」 are INCLUSIVE: the threshold itself qualifies.
-/
namespace JapanTaxLaw.LocalTax73_27_6RealEstateTaxDeferralWithin5Years

open JapanTaxLaw.TaxFinance

def specInScope (years : Nat) : Prop := years <= 5

theorem agree_scope (years : Nat) : inScope years ↔ specInScope years := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.LocalTax73_27_6RealEstateTaxDeferralWithin5Years
