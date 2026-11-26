import JapanTaxLaw.LocalTax144_33FineCeiling7M

/-
# LocalTax144_33FineCeiling7MSpec — independent spec for 地方税法 第百四十四条の三十三(2)

Needle 「情を知つて、前項の罪に当たる行為に要する資金、土地、建物、艦船、車両、設備、機械、器具、原材料又は薬品を提供し、又は運搬したときは、その違反行為をした者は、七年以下の拘禁刑若しくは七百万円以下の罰金に処し、又はこれを併科する。」.
The implementation uses `fine ≤ 7_000_000`; the independent spec states the same
inclusive ceiling as `fine ≤ 7_000_000`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge. 「以下」 is
INCLUSIVE: ¥7,000,000 qualifies, ¥7,000,001 is outside the ceiling.
-/
namespace JapanTaxLaw.LocalTax144_33FineCeiling7M

open JapanTaxLaw.TaxFinance

def specInScope (fine : Nat) : Prop := fine ≤ 7_000_000

theorem agree_scope (fine : Nat) : inScope fine ↔ specInScope fine := by
  unfold inScope specInScope threshold
  rfl

end JapanTaxLaw.LocalTax144_33FineCeiling7M
