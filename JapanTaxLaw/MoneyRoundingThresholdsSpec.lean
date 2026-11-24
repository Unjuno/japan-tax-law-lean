import JapanTaxLaw.MoneyRoundingThresholds

/-!
# MoneyRoundingThresholdsSpec — 独立仕様と普遍的な端数処理証明

The spec states the observable effect of 切り捨て without calling the
implementation: the result is not greater than the amount and the discarded
part is strictly below the threshold. `agreeRoundDown` proves this for ALL Nat
amount and threshold (zero threshold handled explicitly).
-/

namespace JapanTaxLaw.MoneyRoundingThresholds

def specRounded (amount threshold q : Nat) : Prop :=
  q ≤ amount ∧ (threshold = 0 ∨ amount - q < threshold)

/-- 実装 ≡ 独立仕様（amount と threshold の両方に渡る全称）。 -/
theorem agreeRoundDown (amount threshold : Nat) :
    specRounded amount threshold (roundDown amount threshold) := by
  unfold specRounded roundDown
  by_cases hz : threshold = 0
  · simp [hz]
  · simp [hz]
    rw [Nat.sub_sub_self (Nat.mod_le amount threshold)]
    exact Nat.mod_lt _ (Nat.pos_of_ne_zero hz)

/-- 切り上げの独立仕様: 結果は元額以上で、切り上げ分は閾値未満。 -/
def specRoundedUp (amount threshold q : Nat) : Prop :=
  amount ≤ q ∧ (threshold = 0 ∨ q - amount < threshold)

/-- 実装 ≡ 独立仕様（切り上げ、全称）。 -/
theorem agreeRoundUp (amount threshold : Nat) :
    specRoundedUp amount threshold (roundUp amount threshold) := by
  unfold specRoundedUp roundUp
  by_cases hz : threshold = 0
  · simp [hz]
  · by_cases hm : amount % threshold = 0
    · simp [hz, hm]
      exact Nat.pos_of_ne_zero hz
    · simp [hz, hm]
      have hpos : 0 < amount % threshold := Nat.pos_of_ne_zero hm
      omega

/-- 境界: 全額が閾値未満なら零。 -/
example : roundDown 99 100 = 0 := by decide
example : roundDown 100 100 = 100 := by decide
example : roundDown 150 100 = 100 := by decide

end JapanTaxLaw.MoneyRoundingThresholds
