import JapanTaxLaw.LocalTax63CovidRevenueCeiling70Percent

/-
# LocalTax63CovidRevenueCeiling70PercentSpec — independent spec for 地方税法 Num 63(1)

Needle 「新型コロナウイルス感染症及びそのまん延防止のための措置の影響により当該中小事業者等の事業収入割合が百分の七十以下となる場合（前号に掲げる場合を除く。）」.
The implementation uses `percent ≤ threshold`; the independent spec states
the 百分の七十以下 rate ceiling (70/100 exactly = the clause rate) as `percent ≤ 70`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以下」 is INCLUSIVE: the threshold itself qualifies and one more does not.
-/
namespace JapanTaxLaw.LocalTax63CovidRevenueCeiling70Percent

open JapanTaxLaw.TaxFinance

def specInScope (percent : Nat) : Prop := percent ≤ 70

theorem agree_scope (percent : Nat) : inScope percent ↔ specInScope percent := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.LocalTax63CovidRevenueCeiling70Percent
