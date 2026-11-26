import JapanTaxLaw.LocalTax144_35LightOilReportWithin30Days

/-
# LocalTax144_35LightOilReportWithin30DaysSpec — independent spec for 地方税法 Num 144_35(2)

Needle 「前項に規定する者以外の者は、軽油の製造をした場合には、当該製造をした日から三十日以内に軽油の製造に関する事実及びその数量その他の総務省令で定める事項を、総務省令で定める道府県知事に報告しなければならない。」.
The implementation uses `days ≤ threshold`; the independent spec states
the 三十日以内 upper bound on the light-oil manufacture report period as `days ≤ 30`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以内」 is INCLUSIVE: the threshold itself qualifies and one more does not.
-/
namespace JapanTaxLaw.LocalTax144_35LightOilReportWithin30Days

open JapanTaxLaw.TaxFinance

def specInScope (days : Nat) : Prop := days ≤ 30

theorem agree_scope (days : Nat) : inScope days ↔ specInScope days := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.LocalTax144_35LightOilReportWithin30Days
