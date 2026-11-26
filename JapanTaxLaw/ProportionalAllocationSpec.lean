import JapanTaxLaw.ProportionalAllocation

/-! Independent spec: quotient/remainder decomposition of the allocation. -/

namespace JapanTaxLaw.ProportionalAllocation

theorem aux (q r total : Nat) (hw : 0 < 1000) :
    (1000 * q + r) * total / 1000 = q * total + r * total / 1000 := by
  rw [Nat.add_mul, Nat.mul_assoc, Nat.mul_add_div hw]

-- Generic denominator version (proved with the same division lemma).
theorem allocate_decomposition (total part whole : Nat) (hw : 0 < whole) :
    allocate total part whole = total / whole * part + total % whole * part / whole := by
  unfold allocate
  have hdec := Nat.div_add_mod total whole
  have haux : (whole * (total / whole) + total % whole) * part / whole =
      (total / whole) * part + (total % whole) * part / whole := by
    rw [Nat.add_mul, Nat.mul_assoc, Nat.mul_add_div hw]
  rw [hdec] at haux
  exact haux

def specAllocate (total part whole : Nat) := total / whole * part + total % whole * part / whole

theorem agrees (total part whole : Nat) (hw : 0 < whole) :
    allocate total part whole = specAllocate total part whole :=
  allocate_decomposition total part whole hw

end JapanTaxLaw.ProportionalAllocation
