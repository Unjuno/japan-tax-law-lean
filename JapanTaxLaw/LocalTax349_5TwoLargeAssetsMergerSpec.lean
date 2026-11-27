import JapanTaxLaw.LocalTax349_5TwoLargeAssetsMerger

/-
# LocalTax349_5TwoLargeAssetsMergerSpec — independent spec for 地方税法 Num 349_5/1

Needle 「この場合において、一の納税義務者が一の市町村の区域内において第一適用年度を同じくする二以上の新設大規模償却資産を所有するときは、これらの新設大規模償却資産を合わせて一の新設大規模償却資産とみなす。」.
The implementation uses `threshold ≤ assets`; the independent spec states
the statutory INCLUSIVE lower bound as `2 ≤ assets`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以上」 is INCLUSIVE: the threshold itself qualifies and one below does not.
-/
namespace JapanTaxLaw.LocalTax349_5TwoLargeAssetsMerger

open JapanTaxLaw.TaxFinance

def specInScope (assets : Nat) : Prop := 2 ≤ assets

theorem agree_scope (assets : Nat) : inScope assets ↔ specInScope assets := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.LocalTax349_5TwoLargeAssetsMerger
