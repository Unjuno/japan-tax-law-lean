import JapanTaxLaw.LandRatioRoundDown

/-!
# LandRatioRoundDownSpec — 独立仕様と普遍的な丸め対応証明

The spec states the rounded value q by three independent properties (largest
multiple of 10 not exceeding the ratio). The theorem proves, for ALL Nat, that
the implementation satisfies exactly those properties. No `decide`-over-a-list
shortcut: the proof is by `omega` on the division algorithm.
-/

namespace JapanTaxLaw.LandRatioRoundDown

/-- 独立仕様: q は ratio 以下で 10 の倍数、かつ残りが 10 未満。 -/
def specRounded (ratioTenths q : Nat) : Prop :=
  q ≤ ratioTenths ∧ q % step = 0 ∧ ratioTenths - q < step

/-- 実装は独立仕様を満たす（全称）。 -/
theorem agreeRoundDown (ratioTenths : Nat) :
    specRounded ratioTenths (roundDownTenths ratioTenths) := by
  unfold specRounded roundDownTenths step
  have hmod : ratioTenths % 10 < 10 := Nat.mod_lt _ (by decide)
  constructor
  · exact Nat.sub_le _ _
  constructor
  · have h : (ratioTenths - ratioTenths % 10) % 10 = 0 := by omega
    exact h
  · omega

/-- 境界: 10 の倍数はそのまま、9 は 0 に、11 は 10 に。 -/
example : roundDownTenths 0 = 0 := by decide
example : roundDownTenths 9 = 0 := by decide
example : roundDownTenths 10 = 10 := by decide
example : roundDownTenths 11 = 10 := by decide
example : roundDownTenths 47 = 40 := by decide

end JapanTaxLaw.LandRatioRoundDown
