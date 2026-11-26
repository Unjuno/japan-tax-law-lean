import JapanTaxLaw.PerPersonDeduction

/-!
# PerPersonDeductionSpec — 独立仕様（加算回数への分解）

The independent spec regroups the addition as `(count + 1) * amount` in the
case where the statutory base equals the per-person amount (six of the pinned
units), and proves the generic identity `base + count*amount = count*amount + base`.
A monotonicity theorem in the person count is also proved for all Nat.
-/

namespace JapanTaxLaw.PerPersonDeduction

theorem base_eq_amount (count amount : Nat) :
    perPersonDeduction amount count amount = (count + 1) * amount := by
  unfold perPersonDeduction
  rw [Nat.add_mul]
  omega

theorem commute (base count amount : Nat) :
    perPersonDeduction base count amount = count * amount + base := by
  unfold perPersonDeduction
  omega

theorem monotone_count (base amount : Nat) :
    ∀ a b, a ≤ b → perPersonDeduction base a amount ≤ perPersonDeduction base b amount := by
  intro a b h
  unfold perPersonDeduction
  exact Nat.add_le_add_left (Nat.mul_le_mul_right amount h) base

end JapanTaxLaw.PerPersonDeduction
