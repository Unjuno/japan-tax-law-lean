import JapanTaxLaw.ProgressiveSurchargeBrackets

/-!
# ProgressiveSurchargeBracketsSpec — 独立仕様（約分率・slice 定式）

The implementation uses `15/100, 20/100, 30/100, 10/100` and `min` on
already-subtracted amounts. This spec uses reduced rates `3/20, 1/5, 3/10,
1/10` and a uniform `slice n lo hi` function. Universal theorems prove
agreement for ALL `base` and `tax`, including a bracket-identity proof.
-/

namespace JapanTaxLaw.ProgressiveSurchargeBrackets

theorem pct15 (x : Nat) : x * 15 / 100 = x * 3 / 20 := by
  rw [show x * 15 = (x * 3) * 5 by omega]
  rw [show 100 = 20 * 5 by decide]
  exact Nat.mul_div_mul_right (x * 3) 20 (by decide)

theorem pct20 (x : Nat) : x * 20 / 100 = x / 5 := by
  rw [show 100 = 5 * 20 by decide]
  exact Nat.mul_div_mul_right x 5 (by decide)

theorem pct30 (x : Nat) : x * 30 / 100 = x * 3 / 10 := by
  rw [show x * 30 = (x * 3) * 10 by omega]
  rw [show 100 = 10 * 10 by decide]
  exact Nat.mul_div_mul_right (x * 3) 10 (by decide)

theorem pct10 (x : Nat) : x * 10 / 100 = x / 10 := by
  rw [show 100 = 10 * 10 by decide]
  exact Nat.mul_div_mul_right x 10 (by decide)

def slice (n lo hi : Nat) : Nat := min n hi - lo

/-- 2 番目の帯域: min(base-50万, 250万) = slice(base, 50万, 300万). -/
theorem sliceMid (base : Nat) :
    min (base - 500_000) 2_500_000 = slice base 500_000 3_000_000 := by
  unfold slice
  by_cases h1 : base ≤ 500_000
  · have hz : base - 500_000 = 0 := Nat.sub_eq_zero_of_le h1
    have hm : min base 3_000_000 = base := Nat.min_eq_left (by omega)
    rw [hz, hm]
    omega
  · by_cases h2 : base ≤ 3_000_000
    · have hle : base - 500_000 ≤ 2_500_000 := by omega
      rw [Nat.min_eq_left hle]
      have hm : min base 3_000_000 = base := Nat.min_eq_left (by omega)
      rw [hm]
    · have hge : 2_500_000 ≤ base - 500_000 := by omega
      rw [Nat.min_eq_right hge]
      have hm : min base 3_000_000 = 3_000_000 := Nat.min_eq_right (by omega)
      rw [hm]

def specSurcharge (base : Nat) : Nat :=
  slice base 0 500_000 * 3 / 20
  + slice base 500_000 3_000_000 / 5
  + (base - 3_000_000) * 3 / 10

def specWithAdditional (base tax : Nat) : Nat :=
  specSurcharge base + tax / 10

theorem agreeSurcharge (base : Nat) :
    progressiveSurcharge base = specSurcharge base := by
  unfold progressiveSurcharge specSurcharge
  rw [sliceMid base]
  simp [slice, pct15, pct20, pct30]

theorem agreeWithAdditional (base tax : Nat) :
    withAdditional base tax = specWithAdditional base tax := by
  unfold withAdditional specWithAdditional
  rw [agreeSurcharge, pct10]

end JapanTaxLaw.ProgressiveSurchargeBrackets
