import JapanTaxLaw.LocalTax73_30EvadedTaxAboveOneMillion

/-
# LocalTax73_30EvadedTaxAboveOneMillionSpec — independent spec for 地方税法 Num 73_30/2

Needle 「前項の免れた税額が百万円を超える場合には、情状により、同項の罰金の額は、同項の規定にかかわらず、百万円を超える額でその免れた税額に相当する額以下の額とすることができる。」.
The implementation uses `threshold < evaded`; the independent spec states
the statutory STRICT lower bound as `1000000 < evaded`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「を超える」 is STRICT: the threshold itself does NOT qualify; only a value strictly above it does.
-/
namespace JapanTaxLaw.LocalTax73_30EvadedTaxAboveOneMillion

open JapanTaxLaw.TaxFinance

def specInScope (evaded : Nat) : Prop := 1000000 < evaded

theorem agree_scope (evaded : Nat) : inScope evaded ↔ specInScope evaded := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.LocalTax73_30EvadedTaxAboveOneMillion
