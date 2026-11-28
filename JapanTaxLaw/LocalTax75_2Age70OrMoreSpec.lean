import JapanTaxLaw.LocalTax75_2Age70OrMore

/-
# LocalTax75_2Age70OrMoreSpec — independent spec for 地方税法 Num 75_2/1

Needle 「年齢七十歳以上の者」.
The implementation uses `age >= 70`; this independent spec states the
statutory boundary from statutory literals only, with no implementation identifier.
The formula below is the sole statutory literal site; the bridge is universal and axiom-free.
「以上」/「以下」/「以内」 are INCLUSIVE; 「を超える」 is STRICT.
-/
namespace JapanTaxLaw.LocalTax75_2Age70OrMore

open JapanTaxLaw.TaxFinance

def specInScope (age : Nat) : Prop := age >= 70

theorem agree_scope (age : Nat) : inScope age ↔ specInScope age := by
  unfold inScope specInScope
  rfl
end JapanTaxLaw.LocalTax75_2Age70OrMore
