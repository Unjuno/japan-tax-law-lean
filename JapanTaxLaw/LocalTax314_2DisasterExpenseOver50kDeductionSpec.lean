import JapanTaxLaw.LocalTax314_2DisasterExpenseOver50kDeduction

/-
# LocalTax314_2DisasterExpenseOver50kDeductionSpec — independent spec for 地方税法 Num 314_2(1)

Needle 「損失の金額の合計額から災害関連支出の金額のうち五万円を超える部分の金額を控除した金額とイに定める金額とのいずれか低い金額」.
The implementation uses `threshold < excess`; the independent spec states the same
strict bound as `Nat.succ 50000 ≤ excess`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「を超え」 is STRICT: the threshold is excluded and one more qualifies.
-/
namespace JapanTaxLaw.LocalTax314_2DisasterExpenseOver50kDeduction

open JapanTaxLaw.TaxFinance

def specInScope (excess : Nat) : Prop := Nat.succ 50000 ≤ excess

theorem agree_scope (excess : Nat) : inScope excess ↔ specInScope excess := by
  unfold inScope specInScope threshold
  constructor
  · intro h
    exact Nat.succ_le_of_lt h
  · intro h
    exact Nat.lt_of_succ_le h

end JapanTaxLaw.LocalTax314_2DisasterExpenseOver50kDeduction
