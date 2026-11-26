import JapanTaxLaw.LocalTax71_16UnpaidOver2M

/-
# LocalTax71_16UnpaidOver2MSpec — independent spec for 地方税法 第七十一条の十六(2)

Needle 「前項の納入しなかつた金額が二百万円を超える場合には、情状により、同項の罰金の額は、同項の規定にかかわらず、二百万円を超える額でその納入しなかつた金額に相当する額以下の額とすることができる。」.
The implementation uses `2_000_000 < unpaid`; the independent spec rewrites the
strict lower bound as `Nat.succ 2_000_000 ≤ unpaid`, built from statutory
literals only with no implementation identifier. Universal axiom-free bridge.
「を超え」 is STRICT: ¥2,000,000 is excluded, ¥2,000,001 qualifies.
-/
namespace JapanTaxLaw.LocalTax71_16UnpaidOver2M

open JapanTaxLaw.TaxFinance

def specInScope (unpaid : Nat) : Prop := Nat.succ 2_000_000 ≤ unpaid

theorem agree_scope (unpaid : Nat) : inScope unpaid ↔ specInScope unpaid := by
  unfold inScope specInScope threshold
  constructor
  · intro h
    exact Nat.succ_le_of_lt h
  · intro h
    exact Nat.lt_of_succ_le h

end JapanTaxLaw.LocalTax71_16UnpaidOver2M
