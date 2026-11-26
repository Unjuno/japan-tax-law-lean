import JapanTaxLaw.LocalTax4PrefecturalIncomeOver30M

/-
# LocalTax4PrefecturalIncomeOver30MSpec — independent spec for 地方税法 第四条(4) (附則)

Needle 「ただし、当該納税義務者の前年の合計所得金額が三千万円を超える年度分の道府県民税の所得割については、この限りでない。」.
The implementation uses `30_000_000 < income`; the independent spec rewrites the
strict lower bound as `Nat.succ 30_000_000 ≤ income`, built from statutory
literals only with no implementation identifier. Universal axiom-free bridge.
「を超え」 is STRICT: ¥30,000,000 is excluded, ¥30,000,001 qualifies.
-/
namespace JapanTaxLaw.LocalTax4PrefecturalIncomeOver30M

open JapanTaxLaw.TaxFinance

def specInScope (income : Nat) : Prop := Nat.succ 30_000_000 ≤ income

theorem agree_scope (income : Nat) : inScope income ↔ specInScope income := by
  unfold inScope specInScope threshold
  constructor
  · intro h
    exact Nat.succ_le_of_lt h
  · intro h
    exact Nat.lt_of_succ_le h

end JapanTaxLaw.LocalTax4PrefecturalIncomeOver30M
