import JapanTaxLaw.LocalTax37_2DesignationBanWithin3Years

/-
# LocalTax37_2DesignationBanWithin3YearsSpec — independent spec for 地方税法 Num 37_2(6)

Needle 「総務大臣は、前項の規定により指定を取り消すときは、指定の取消しを受ける都道府県等について、三年以内の期間を定めて指定を行わない旨の決定をしなければならない。」.
The implementation uses `years ≤ threshold`; the independent spec states
the 三年以内 upper bound on the designation-ban period as `years ≤ 3`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以内」 is INCLUSIVE: the threshold itself qualifies and one more does not.
-/
namespace JapanTaxLaw.LocalTax37_2DesignationBanWithin3Years

open JapanTaxLaw.TaxFinance

def specInScope (years : Nat) : Prop := years ≤ 3

theorem agree_scope (years : Nat) : inScope years ↔ specInScope years := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.LocalTax37_2DesignationBanWithin3Years
