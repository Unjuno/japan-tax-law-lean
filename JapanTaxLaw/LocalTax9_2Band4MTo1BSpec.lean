import JapanTaxLaw.LocalTax9_2Band4MTo1B

/-
# LocalTax9_2Band4MTo1BSpec — independent spec for 地方税法 第九条の二(1)

Needle 「各事業年度の所得のうち年四百万円を超え年十億円以下の金額」.
The implementation uses `4,000,000 < amount ∧ amount ≤ 1,000,000,000`; the
independent spec uses the inclusive-≤ complement of the strict lower bound
(`Nat.succ 4,000,000 ≤ amount`) together with the inclusive upper bound — a
distinct formulation built from statutory literals only, with no impl
identifier. Kernel proves equivalence for ALL amounts, axiom-free.

Boundaries: ¥4,000,000 excluded (を超え strict); ¥1,000,000,000 included (以下).
-/
namespace JapanTaxLaw.LocalTax9_2Band4MTo1B

open JapanTaxLaw.TaxFinance

def specInScope (amount : Nat) : Prop :=
  Nat.succ 4_000_000 ≤ amount ∧ amount ≤ 1_000_000_000

theorem agree_scope (amount : Nat) : inScope amount ↔ specInScope amount := by
  unfold inScope specInScope lower upper
  constructor
  · intro h
    exact ⟨Nat.succ_le_of_lt h.1, h.2⟩
  · intro h
    exact ⟨Nat.lt_of_succ_le h.1, h.2⟩

end JapanTaxLaw.LocalTax9_2Band4MTo1B
