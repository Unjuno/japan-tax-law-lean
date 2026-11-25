import JapanTaxLaw.HalfUpRounding

/-!
# HalfUpRoundingSpec — 独立仕様（加算後整除）と全称対応証明

The implementation compares `2 * remainder` with the threshold. The
independent spec uses a different formulation: add half the threshold then
floor to a multiple (`(amount + threshold/2) / threshold * threshold`).
Universal theorems prove agreement for all Nat amounts at the two pinned
thresholds, with explicit `omega` arithmetic on the division algorithm.
-/

namespace JapanTaxLaw.HalfUpRounding

theorem agreeThousand (amount : Nat) :
    roundHalfUpThousand amount = (amount + 500) / 1000 * 1000 := by
  unfold roundHalfUpThousand roundHalfUp
  have hmod : amount % 1000 < 1000 := Nat.mod_lt _ (by decide)
  have hdecomp : amount = amount / 1000 * 1000 + amount % 1000 := by
    rw [Nat.mul_comm]
    exact (Nat.div_add_mod amount 1000).symm
  by_cases h : 2 * (amount % 1000) < 1000
  · simp [h]
    have hq : (amount + 500) / 1000 = amount / 1000 := by omega
    rw [hq, hdecomp]
    omega
  · simp [h]
    have hq : (amount + 500) / 1000 = amount / 1000 + 1 := by omega
    rw [hq, hdecomp]
    omega

theorem agreeMillion (amount : Nat) :
    roundHalfUpMillion amount = (amount + 500_000) / 1_000_000 * 1_000_000 := by
  unfold roundHalfUpMillion roundHalfUp
  have hmod : amount % 1_000_000 < 1_000_000 := Nat.mod_lt _ (by decide)
  have hdecomp : amount = amount / 1_000_000 * 1_000_000 + amount % 1_000_000 := by
    rw [Nat.mul_comm]
    exact (Nat.div_add_mod amount 1_000_000).symm
  by_cases h : 2 * (amount % 1_000_000) < 1_000_000
  · simp [h]
    have hq : (amount + 500_000) / 1_000_000 = amount / 1_000_000 := by omega
    rw [hq, hdecomp]
    omega
  · simp [h]
    have hq : (amount + 500_000) / 1_000_000 = amount / 1_000_000 + 1 := by omega
    rw [hq, hdecomp]
    omega

def specThousand (amount : Nat) := (amount + 500) / 1000 * 1000
def specMillion (amount : Nat) := (amount + 500_000) / 1_000_000 * 1_000_000

theorem thousand_agrees (amount : Nat) : roundHalfUpThousand amount = specThousand amount :=
  agreeThousand amount
theorem million_agrees (amount : Nat) : roundHalfUpMillion amount = specMillion amount :=
  agreeMillion amount

end JapanTaxLaw.HalfUpRounding
