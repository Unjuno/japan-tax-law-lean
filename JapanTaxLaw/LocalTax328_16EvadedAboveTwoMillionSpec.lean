import JapanTaxLaw.LocalTax328_16EvadedAboveTwoMillion

/-
# LocalTax328_16EvadedAboveTwoMillionSpec — independent spec for 地方税法 Num 328_16/3

Needle 「第一項の納入しなかつた金額が二百万円を超える場合には、情状により、同項の罰金の額は、同項の規定にかかわらず、二百万円を超える額でその納入しなかつた金額に相当する額以下の額とすることができる。」.
The implementation uses `threshold < evaded`; the independent spec states
the statutory STRICT lower bound as `2000000 < evaded`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「を超える」 is STRICT: the threshold itself does NOT qualify; only a value strictly above it does.
-/
namespace JapanTaxLaw.LocalTax328_16EvadedAboveTwoMillion

open JapanTaxLaw.TaxFinance

def specInScope (evaded : Nat) : Prop := 2000000 < evaded

theorem agree_scope (evaded : Nat) : inScope evaded ↔ specInScope evaded := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.LocalTax328_16EvadedAboveTwoMillion
