import JapanTaxLaw.LocalTax62EvadedOver5M

/-
# LocalTax62EvadedOver5MSpec — independent spec for 地方税法 第六十二条(4)

Needle 「前項の免れた税額が五百万円を超える場合には、情状により、同項の罰金の額は、同項の規定にかかわらず、五百万円を超える額でその免れた税額に相当する額以下の額とすることができる。」.
The implementation uses `5_000_000 < evaded`; the independent spec rewrites the
strict lower bound as `Nat.succ 5_000_000 ≤ evaded`, built from statutory
literals only with no implementation identifier. Universal axiom-free bridge.
「を超え」 is STRICT: ¥5,000,000 is excluded, ¥5,000,001 qualifies.
-/
namespace JapanTaxLaw.LocalTax62EvadedOver5M

open JapanTaxLaw.TaxFinance

def specInScope (evaded : Nat) : Prop := Nat.succ 5_000_000 ≤ evaded

theorem agree_scope (evaded : Nat) : inScope evaded ↔ specInScope evaded := by
  unfold inScope specInScope threshold
  constructor
  · intro h
    exact Nat.succ_le_of_lt h
  · intro h
    exact Nat.lt_of_succ_le h

end JapanTaxLaw.LocalTax62EvadedOver5M
