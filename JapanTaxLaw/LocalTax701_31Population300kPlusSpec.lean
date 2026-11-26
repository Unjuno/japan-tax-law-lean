import JapanTaxLaw.LocalTax701_31Population300kPlus

/-
# LocalTax701_31Population300kPlusSpec — independent spec for 地方税法 Num 701_31(1)

Needle 「イ及びロに掲げる市以外の市で人口（官報で公示された最近の国勢調査の結果による人口その他これに準ずるものとして政令で定める人口をいう。）三十万以上のもののうち政令で指定するもの」.
The implementation uses `threshold ≤ population`; the independent spec states
the 三十万以上 lower bound on population as `300000 ≤ population`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以上」 is INCLUSIVE: the threshold itself qualifies and one below does not.
-/
namespace JapanTaxLaw.LocalTax701_31Population300kPlus

open JapanTaxLaw.TaxFinance

def specInScope (population : Nat) : Prop := 300000 ≤ population

theorem agree_scope (population : Nat) : inScope population ↔ specInScope population := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.LocalTax701_31Population300kPlus
