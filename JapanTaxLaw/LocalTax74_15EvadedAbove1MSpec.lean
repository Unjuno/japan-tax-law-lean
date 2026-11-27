import JapanTaxLaw.LocalTax74_15EvadedAbove1M

/-
# LocalTax74_15EvadedAbove1MSpec — independent spec for 地方税法 Num 74_15/3

Needle 「第一項の免れた税額又は前項の還付を受けた金額が百万円を超える場合には、情状により、当該各項の罰金の額は、当該各項の規定にかかわらず、百万円を超える額でその免れた税額又は還付を受けた金額に相当する額以下の額とすることができる。」.
The implementation uses `threshold < evaded`; the independent spec states
the statutory STRICT lower bound as `1000000 < evaded`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「を超える」 is STRICT: the threshold itself does NOT qualify; only a value strictly above it does.
-/
namespace JapanTaxLaw.LocalTax74_15EvadedAbove1M

open JapanTaxLaw.TaxFinance

def specInScope (evaded : Nat) : Prop := 1000000 < evaded

theorem agree_scope (evaded : Nat) : inScope evaded ↔ specInScope evaded := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.LocalTax74_15EvadedAbove1M
