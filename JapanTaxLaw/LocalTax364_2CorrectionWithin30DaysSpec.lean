import JapanTaxLaw.LocalTax364_2CorrectionWithin30Days

/-
# LocalTax364_2CorrectionWithin30DaysSpec — independent spec for 地方税法 Num 364_2/1

Needle 「前条第五項の固定資産に係る当該年度分の固定資産税額が仮算定税額の二分の一に相当する額に満たないこととなると認められる場合においては、同項の規定によつて当該固定資産に係る固定資産税を徴収されることとなる者は、同条第七項の納税通知書の交付を受けた日から三十日以内に市町村長に同条第五項の規定によつて徴収される固定資産税額の修正を申し出ることができる。」.
The implementation uses `days <= 30`; this independent spec states the
statutory INCLUSIVE boundary as `days <= 30`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以上」/「以下」/「以内」 are INCLUSIVE: the threshold itself qualifies.
-/
namespace JapanTaxLaw.LocalTax364_2CorrectionWithin30Days

open JapanTaxLaw.TaxFinance

def specInScope (days : Nat) : Prop := days <= 30

theorem agree_scope (days : Nat) : inScope days ↔ specInScope days := by
  unfold inScope specInScope
  rfl
end JapanTaxLaw.LocalTax364_2CorrectionWithin30Days
