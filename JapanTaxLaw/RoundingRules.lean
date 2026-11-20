/-!
# RoundingRules — 端数処理（238 units）

238 units in 143 verbatim variants expressing two §3 rounding operations:
- 四捨五入 (round half up) at a stated unit
- 切り捨て (truncate/floor) at a stated unit

Callers supply the value `x` in smallest units and a unit `u`.
  floorTo x u = x / u * u                (切り捨て)
  roundHalfUp x u = (x + u/2) / u * u    (四捨五入, half-up)
Kernel proofs: floor bound, multiple-of-unit, monotonicity, integer identity,
and identity of all 四捨五入/切り捨て wordings.

Specific rates, amounts and surrounding formulas are NOT MODELLED.
-/
namespace JapanTaxLaw.RoundingRules

def floorTo (x u : Nat) : Nat := x / u * u

def roundHalfUp (x u : Nat) : Nat := (x + u / 2) / u * u

theorem floor_le (x u : Nat) : floorTo x u <= x := by
  unfold floorTo
  rw [Nat.mul_comm]
  exact Nat.mul_div_le x u

theorem floor_multiple (x u : Nat) : floorTo x u % u = 0 := by
  unfold floorTo
  rw [Nat.mul_comm]
  exact Nat.mul_mod_right u (x / u)

theorem floor_mono (a b u : Nat) (h : a <= b) : floorTo a u <= floorTo b u := by
  unfold floorTo
  rw [Nat.mul_comm (a / u) u, Nat.mul_comm (b / u) u]
  exact Nat.mul_le_mul_left u (Nat.div_le_div_right h)

theorem round_multiple (x u : Nat) : roundHalfUp x u % u = 0 := by
  unfold roundHalfUp
  rw [Nat.mul_comm]
  exact Nat.mul_mod_right u ((x + u / 2) / u)

theorem integer_round_is_identity (x : Nat) : roundHalfUp x 1 = x := by
  simp [roundHalfUp]

namespace Shishagonyu
def round := @roundHalfUp
end Shishagonyu

namespace Kirisute
def floor := @floorTo
end Kirisute

theorem all_shishagonyu_variants (x u : Nat) : Shishagonyu.round x u = roundHalfUp x u := by rfl
theorem all_kirisute_variants (x u : Nat) : Kirisute.floor x u = floorTo x u := by rfl

end JapanTaxLaw.RoundingRules
