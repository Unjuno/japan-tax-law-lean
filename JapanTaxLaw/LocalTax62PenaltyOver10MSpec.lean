import JapanTaxLaw.LocalTax62PenaltyOver10M

/-
# LocalTax62PenaltyOver10MSpec — independent spec for 地方税法 Num 62/2

Needle 「前項の免れた税額が千万円を超える場合には、情状により、同項の罰金の額は、同項の規定にかかわらず、千万円を超える額でその免れた税額に相当する額以下の額とすることができる。」.
The implementation uses `threshold < yen`; the independent spec states
the statutory STRICT lower bound as `10000000 < yen`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「を超える」 is STRICT: the threshold itself does NOT qualify; only a value strictly above it does.
-/
namespace JapanTaxLaw.LocalTax62PenaltyOver10M

open JapanTaxLaw.TaxFinance

def specInScope (yen : Nat) : Prop := 10000000 < yen

theorem agree_scope (yen : Nat) : inScope yen ↔ specInScope yen := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.LocalTax62PenaltyOver10M
