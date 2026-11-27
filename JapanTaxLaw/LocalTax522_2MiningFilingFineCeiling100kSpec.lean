import JapanTaxLaw.LocalTax522_2MiningFilingFineCeiling100k

/-
# LocalTax522_2MiningFilingFineCeiling100kSpec — independent spec for 地方税法 Num 522_2/1

Needle 「市町村は、鉱産税の納税者が正当な事由がなくて前条の規定による申告書を同条に規定する申告書の提出期限までに提出しなかつた場合においては、その者に対し、当該市町村の条例で十万円以下の過料を科する旨の規定を設けることができる。」.
The implementation uses `fine ≤ threshold`; the independent spec states
the statutory INCLUSIVE ceiling as `fine ≤ 100000`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以内」/「以下」 is INCLUSIVE: the threshold itself qualifies and one more does not.
-/
namespace JapanTaxLaw.LocalTax522_2MiningFilingFineCeiling100k

open JapanTaxLaw.TaxFinance

def specInScope (fine : Nat) : Prop := fine ≤ 100000

theorem agree_scope (fine : Nat) : inScope fine ↔ specInScope fine := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.LocalTax522_2MiningFilingFineCeiling100k
