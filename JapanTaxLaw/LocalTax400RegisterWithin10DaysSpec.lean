import JapanTaxLaw.LocalTax400RegisterWithin10Days

/-
# LocalTax400RegisterWithin10DaysSpec — independent spec for 地方税法 Num 400/1

Needle 「市町村長は、前条の規定による通知を受けた場合においては、その通知を受けた日から十日以内に道府県知事又は総務大臣の決定に係る当該価格等を固定資産課税台帳に登録しなければならない。」.
The implementation uses `days ≤ threshold`; the independent spec states
the statutory INCLUSIVE ceiling as `days ≤ 10`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以内」/「以下」 is INCLUSIVE: the threshold itself qualifies and one more does not.
-/
namespace JapanTaxLaw.LocalTax400RegisterWithin10Days

open JapanTaxLaw.TaxFinance

def specInScope (days : Nat) : Prop := days ≤ 10

theorem agree_scope (days : Nat) : inScope days ↔ specInScope days := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.LocalTax400RegisterWithin10Days
