import JapanTaxLaw.LocalTaxProvisionalTaxHalfCap

/-
# LocalTaxProvisionalTaxHalfCapSpec — independent spec for 地方税法 Num 364/5

Needle 「ただし、当該徴収することができる額の総額は、仮算定税額の二分の一に相当する額を超えることができない。」.
The implementation uses `2 * amount > base`; this independent spec states the
statutory boundary from statutory literals only, with no implementation identifier.
The formula below is the sole statutory literal site; the bridge is universal and axiom-free.
「以上」/「以下」/「以内」 are INCLUSIVE; 「を超える」 is STRICT.
-/
namespace JapanTaxLaw.LocalTaxProvisionalTaxHalfCap

open JapanTaxLaw.TaxFinance

def specInScope (amount base : Nat) : Prop := 2 * amount > base

theorem agree_scope (amount base : Nat) : inScope amount base ↔ specInScope amount base := by
  unfold inScope specInScope
  rfl
end JapanTaxLaw.LocalTaxProvisionalTaxHalfCap
