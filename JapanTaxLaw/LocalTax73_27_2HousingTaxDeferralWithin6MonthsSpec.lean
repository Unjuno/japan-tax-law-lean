import JapanTaxLaw.LocalTax73_27_2HousingTaxDeferralWithin6Months

/-
# LocalTax73_27_2HousingTaxDeferralWithin6MonthsSpec — independent spec for 地方税法 Num 73_27_2/2

Needle 「道府県は、住宅の取得に対して課する不動産取得税を賦課徴収する場合において、当該住宅の取得者から、当該道府県の条例で定めるところにより、当該不動産取得税について前項の規定の適用があるべき旨の申告があり、当該申告が真実であると認められるときは、当該取得の日から六月以内の期間を限つて、当該住宅に係る不動産取得税額のうち同項の規定により減額すべき額に相当する税額を徴収猶予するものとする。」.
The implementation uses `months ≤ threshold`; the independent spec states
the statutory INCLUSIVE ceiling as `months ≤ 6`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以下」/「以内」 is INCLUSIVE: the threshold itself qualifies and one more does not.
-/
namespace JapanTaxLaw.LocalTax73_27_2HousingTaxDeferralWithin6Months

open JapanTaxLaw.TaxFinance

def specInScope (months : Nat) : Prop := months ≤ 6

theorem agree_scope (months : Nat) : inScope months ↔ specInScope months := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.LocalTax73_27_2HousingTaxDeferralWithin6Months
