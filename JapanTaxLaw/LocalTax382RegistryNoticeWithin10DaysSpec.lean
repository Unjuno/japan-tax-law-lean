import JapanTaxLaw.LocalTax382RegistryNoticeWithin10Days

/-
# LocalTax382RegistryNoticeWithin10DaysSpec — independent spec for 地方税法 Num 382(1)

Needle 「登記所は、土地又は建物の表示に関する登記をしたときは、十日以内に、その旨その他総務省令で定める事項を当該土地又は家屋の所在地の市町村長に通知しなければならない。」.
The implementation uses `days ≤ threshold`; the independent spec states
the 十日以内 upper bound on the registry notice period as `days ≤ 10`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以内」 is INCLUSIVE: the threshold itself qualifies and one more does not.
-/
namespace JapanTaxLaw.LocalTax382RegistryNoticeWithin10Days

open JapanTaxLaw.TaxFinance

def specInScope (days : Nat) : Prop := days ≤ 10

theorem agree_scope (days : Nat) : inScope days ↔ specInScope days := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.LocalTax382RegistryNoticeWithin10Days
