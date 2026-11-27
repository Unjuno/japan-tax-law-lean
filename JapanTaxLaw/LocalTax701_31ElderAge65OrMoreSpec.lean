import JapanTaxLaw.LocalTax701_31ElderAge65OrMore

/-
# LocalTax701_31ElderAge65OrMoreSpec — independent spec for 地方税法 Num 701_31/2

Needle 「前項第五号の場合において、障害者、年齢六十五歳以上の者又は雇用改善助成対象者であるかどうかの判定は、その者に対して給与等が支払われる時の現況によるものとする。」.
The implementation uses `threshold <= age`; the independent spec states
the statutory INCLUSIVE lower bound as `65 <= age`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以上」/「以下」/「以内」 are INCLUSIVE: the threshold itself qualifies.
-/
namespace JapanTaxLaw.LocalTax701_31ElderAge65OrMore

open JapanTaxLaw.TaxFinance

def specInScope (age : Nat) : Prop := 65 <= age

theorem agree_scope (age : Nat) : inScope age ↔ specInScope age := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.LocalTax701_31ElderAge65OrMore
