import JapanTaxLaw.LocalTax37_2PriorPeriodWithin4Years

/-
# LocalTax37_2PriorPeriodWithin4YearsSpec — independent spec for 地方税法 Num 37_2/2

Needle 「都道府県等が指定対象期間の初日前四年以内（当該都道府県等が指定を受けていた期間に限る。次号において「特定期間」という。）において前各号に掲げる基準のうち適合すべきこととされていたものに適合していなかつた事実がないこと（当該事実により既に第五項の規定による指定の取消し（以下この条において「指定の取消し」という。）を受けた場合を除く。）。」.
The implementation uses `years <= 4`; this independent spec states the
statutory INCLUSIVE boundary as `years <= 4`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以上」/「以下」/「以内」 are INCLUSIVE: the threshold itself qualifies.
-/
namespace JapanTaxLaw.LocalTax37_2PriorPeriodWithin4Years

open JapanTaxLaw.TaxFinance

def specInScope (years : Nat) : Prop := years <= 4

theorem agree_scope (years : Nat) : inScope years ↔ specInScope years := by
  unfold inScope specInScope
  rfl
end JapanTaxLaw.LocalTax37_2PriorPeriodWithin4Years
