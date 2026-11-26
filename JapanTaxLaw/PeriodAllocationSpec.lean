import JapanTaxLaw.PeriodAllocation

/-! Independent relational spec: the per-period amount is the UNIQUE integer q
    satisfying `count*q ≤ amount < count*(q+1)`. This characterises the
    quotient without referring to Nat.div in the spec itself. -/

namespace JapanTaxLaw.PeriodAllocation

def PerUnitSpec (amount count q : Nat) : Prop :=
  count * q ≤ amount ∧ amount < count * (q + 1)

theorem perUnit_satisfies (amount count : Nat) (hc : 0 < count) :
    PerUnitSpec amount count (perUnit amount count) := by
  unfold PerUnitSpec perUnit
  constructor
  · simpa [Nat.mul_comm] using (Nat.div_mul_le_self amount count)
  · have h := Nat.lt_div_mul_add (a := amount) hc
    simpa [Nat.mul_comm, Nat.mul_add, Nat.add_comm, Nat.add_left_comm, Nat.add_assoc] using h

theorem perUnit_unique (amount count q : Nat) (hc : 0 < count)
    (hq : PerUnitSpec amount count q) : q = perUnit amount count := by
  unfold PerUnitSpec at hq
  unfold perUnit
  have hp := perUnit_satisfies amount count hc
  apply Nat.le_antisymm
  · have hlt : count * q < count * (amount / count + 1) := Nat.lt_of_le_of_lt hq.1 hp.2
    have : q < amount / count + 1 := (Nat.mul_lt_mul_left hc).mp hlt
    omega
  · have hlt : count * (amount / count) < count * (q + 1) := Nat.lt_of_le_of_lt hp.1 hq.2
    have : amount / count < q + 1 := (Nat.mul_lt_mul_left hc).mp hlt
    omega

end JapanTaxLaw.PeriodAllocation
