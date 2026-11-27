import JapanTaxLaw.LocalTax86UnpaidAbove1M

/-
# LocalTax86UnpaidAbove1MSpec — independent spec for 地方税法 Num 86/2

Needle 「前項の納入しなかつた金額が百万円を超える場合には、情状により、同項の罰金の額は、同項の規定にかかわらず、百万円を超える額でその納入しなかつた金額に相当する額以下の額とすることができる。」.
The implementation uses `threshold < unpaid`; the independent spec states
the statutory STRICT lower bound as `1000000 < unpaid`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「を超える」 is STRICT: the threshold itself does NOT qualify; only a value strictly above it does.
-/
namespace JapanTaxLaw.LocalTax86UnpaidAbove1M

open JapanTaxLaw.TaxFinance

def specInScope (unpaid : Nat) : Prop := 1000000 < unpaid

theorem agree_scope (unpaid : Nat) : inScope unpaid ↔ specInScope unpaid := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.LocalTax86UnpaidAbove1M
