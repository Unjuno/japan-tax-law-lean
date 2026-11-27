import JapanTaxLaw.LocalTax37_2ReturnCostCeiling30Percent

/-
# LocalTax37_2ReturnCostCeiling30PercentSpec — independent spec for 地方税法 Num 37_2/2/3

Needle 「都道府県等が個別の第一号寄附金の受領に伴い提供する返礼品等の調達に要する費用の額として総務大臣が定めるところにより算定した額が、いずれも当該都道府県等が受領する当該第一号寄附金の額の百分の三十に相当する金額以下であること。」.
The implementation uses `percent ≤ threshold`; the independent spec states
the statutory INCLUSIVE ceiling as `percent ≤ 30`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以内」/「以下」 is INCLUSIVE: the threshold itself qualifies and one more does not.
-/
namespace JapanTaxLaw.LocalTax37_2ReturnCostCeiling30Percent

open JapanTaxLaw.TaxFinance

def specInScope (percent : Nat) : Prop := percent ≤ 30

theorem agree_scope (percent : Nat) : inScope percent ↔ specInScope percent := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.LocalTax37_2ReturnCostCeiling30Percent
