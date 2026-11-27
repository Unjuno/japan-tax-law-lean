import JapanTaxLaw.LocalTax72_38_2ExtensionWithin3Years

/-
# LocalTax72_38_2ExtensionWithin3YearsSpec — independent spec for 地方税法 Num 72_38_2/5

Needle 「道府県知事は、第一項の規定により徴収を猶予した場合において、その猶予をした期間内にその猶予をした金額を納付することができないやむを得ない理由があると認めるときは、当該法人の申請により、三年以内の期間を限りその期間を延長することができる。」.
The implementation uses `years ≤ threshold`; the independent spec states
the statutory INCLUSIVE ceiling as `years ≤ 3`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以内」/「以下」 is INCLUSIVE: the threshold itself qualifies and one more does not.
-/
namespace JapanTaxLaw.LocalTax72_38_2ExtensionWithin3Years

open JapanTaxLaw.TaxFinance

def specInScope (years : Nat) : Prop := years ≤ 3

theorem agree_scope (years : Nat) : inScope years ↔ specInScope years := by
  unfold inScope specInScope threshold
  rfl
end JapanTaxLaw.LocalTax72_38_2ExtensionWithin3Years
