import JapanTaxLaw.LocalTax328_8SeparationFineCeiling100k

/-
# LocalTax328_8SeparationFineCeiling100kSpec — independent spec for 地方税法 Num 328_8/1

Needle 「市町村は、分離課税に係る所得割の納税義務者が退職所得申告書を正当な理由がなくて提出しなかつた場合には、その者に対し、当該市町村の条例で十万円以下の過料を科する旨の規定を設けることができる。」.
The implementation uses `fine ≤ threshold`; the independent spec states
the statutory INCLUSIVE ceiling as `fine ≤ 100000`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以内」/「以下」 is INCLUSIVE: the threshold itself qualifies and one more does not.
-/
namespace JapanTaxLaw.LocalTax328_8SeparationFineCeiling100k

open JapanTaxLaw.TaxFinance

def specInScope (fine : Nat) : Prop := fine ≤ 100000

theorem agree_scope (fine : Nat) : inScope fine ↔ specInScope fine := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.LocalTax328_8SeparationFineCeiling100k
