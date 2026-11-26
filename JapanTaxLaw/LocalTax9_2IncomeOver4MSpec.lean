import JapanTaxLaw.LocalTax9_2IncomeOver4M

/-
# LocalTax9_2IncomeOver4MSpec — independent spec for 地方税法 Num 9_2(1)

Needle 「各事業年度の所得のうち年四百万円を超える金額」.
The implementation uses `threshold < income`; the independent spec states the same
strict bound as `Nat.succ 4000000 ≤ income`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「を超え」 is STRICT: the threshold is excluded and one more qualifies.
-/
namespace JapanTaxLaw.LocalTax9_2IncomeOver4M

open JapanTaxLaw.TaxFinance

def specInScope (income : Nat) : Prop := Nat.succ 4000000 ≤ income

theorem agree_scope (income : Nat) : inScope income ↔ specInScope income := by
  unfold inScope specInScope threshold
  constructor
  · intro h
    exact Nat.succ_le_of_lt h
  · intro h
    exact Nat.lt_of_succ_le h

end JapanTaxLaw.LocalTax9_2IncomeOver4M
