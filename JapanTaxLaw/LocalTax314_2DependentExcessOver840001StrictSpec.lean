import JapanTaxLaw.LocalTax314_2DependentExcessOver840001Strict

/-
# LocalTax314_2DependentExcessOver840001StrictSpec — independent spec for 地方税法 Num 314_2/1

Needle 「六十三万円から当該特定親族の前年の合計所得金額のうち八十四万一円を超える部分の金額に二を乗じた金額（当該乗じた金額が十万円の整数倍の金額から八万円を控除した金額でないときは、十万円の整数倍の金額から八万円を控除した金額で当該乗じた金額に満たないもののうち最も多い金額とする。）を控除した金額」.
The implementation uses `840_001 < yen`; this independent spec states the
statutory STRICT boundary as `840_001 < yen`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「を超える」/「超え」 are STRICT: the threshold itself does NOT qualify.
-/
namespace JapanTaxLaw.LocalTax314_2DependentExcessOver840001Strict

open JapanTaxLaw.TaxFinance

def specInScope (yen : Nat) : Prop := 840_001 < yen

theorem agree_scope (yen : Nat) : inScope yen ↔ specInScope yen := by
  unfold inScope specInScope
  rfl
end JapanTaxLaw.LocalTax314_2DependentExcessOver840001Strict
