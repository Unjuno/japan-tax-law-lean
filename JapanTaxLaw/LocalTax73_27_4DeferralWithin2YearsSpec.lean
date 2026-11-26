import JapanTaxLaw.LocalTax73_27_4DeferralWithin2Years

/-
# LocalTax73_27_4DeferralWithin2YearsSpec — independent spec for 地方税法 Num 73_27_4(2)

Needle 「道府県は、不動産の取得に対して課する不動産取得税を賦課徴収する場合において、当該不動産の取得者から、当該道府県の条例で定めるところにより、当該不動産取得税について前項の規定の適用があるべき旨の申告があり、当該申告が真実であると認められるときは、当該取得の日から二年以内の期間を限つて、当該不動産に係る不動産取得税額を徴収猶予するものとする。」.
The implementation uses `≤ threshold years`; the independent spec states the same
inclusive bound as `≤ 2 years`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以内」/「以下」 is INCLUSIVE: the threshold itself qualifies and one more does not.
-/
namespace JapanTaxLaw.LocalTax73_27_4DeferralWithin2Years

open JapanTaxLaw.TaxFinance

def specInScope (years : Nat) : Prop := years ≤ 2

theorem agree_scope (years : Nat) : inScope years ↔ specInScope years := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.LocalTax73_27_4DeferralWithin2Years
