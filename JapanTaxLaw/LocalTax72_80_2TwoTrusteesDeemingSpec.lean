import JapanTaxLaw.LocalTax72_80_2TwoTrusteesDeeming

/-
# LocalTax72_80_2TwoTrusteesDeemingSpec — independent spec for 地方税法 Num 72_80_2/4

Needle 「一の法人課税信託等の受託者が二以上ある場合には、各受託者の当該法人課税信託等に係る信託資産等は、当該法人課税信託等の信託事務を主宰する受託者（次項において「主宰受託者」という。）の信託資産等とみなして、この節の規定を適用する。」.
The implementation uses `threshold ≤ trustees`; the independent spec states
the statutory INCLUSIVE lower bound as `2 ≤ trustees`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以上」 is INCLUSIVE: the threshold itself qualifies and one below does not.
-/
namespace JapanTaxLaw.LocalTax72_80_2TwoTrusteesDeeming

open JapanTaxLaw.TaxFinance

def specInScope (trustees : Nat) : Prop := 2 ≤ trustees

theorem agree_scope (trustees : Nat) : inScope trustees ↔ specInScope trustees := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.LocalTax72_80_2TwoTrusteesDeeming
