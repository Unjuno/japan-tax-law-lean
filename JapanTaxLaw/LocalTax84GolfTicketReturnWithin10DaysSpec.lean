import JapanTaxLaw.LocalTax84GolfTicketReturnWithin10Days

/-
# LocalTax84GolfTicketReturnWithin10DaysSpec — independent spec for 地方税法 Num 84/5

Needle 「第二項の証票の交付を受けた者は、当該ゴルフ場に係るゴルフ場利用税の特別徴収の義務が消滅した場合においては、その消滅した日から十日以内にその証票を道府県知事に返さなければならない。」.
The implementation uses `days <= threshold`; the independent spec states
the statutory INCLUSIVE upper bound as `days <= 10`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以上」/「以下」/「以内」 are INCLUSIVE: the threshold itself qualifies.
-/
namespace JapanTaxLaw.LocalTax84GolfTicketReturnWithin10Days

open JapanTaxLaw.TaxFinance

def specInScope (days : Nat) : Prop := days <= 10

theorem agree_scope (days : Nat) : inScope days ↔ specInScope days := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.LocalTax84GolfTicketReturnWithin10Days
