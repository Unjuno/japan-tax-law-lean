import JapanTaxLaw.AviationFuelTaxRate

/-!
# AviationFuelTaxRateSpec — independent spec for 航空機燃料税法 art.11

Law id: 347AC0000000007
Revision: 347AC0000000007_20250601_504AC0000000068
Statutory article: art. 11
Normative unit: NORM|99061309435f403e991be4370b1f7f7970c0769f7b3d705d98e00de8673ed91b

The spec is deliberately a different formulation from the implementation:
the implementation multiplies the quantity by the rate, while the spec
expresses the amount as primitive-recursive repeated addition of ¥26,000.
The kernel proves their agreement for ALL quantities (not a finite sample).

Variable contract: `kilolitres : Money` = 航空機燃料の数量, unit キロリットル,
domain Nat. Result unit: 円.

Not modelled: 第八条 非課税, 第十条 課税標準, 第十四条 / 第十五条 申告・納付,
附則 経過措置.
-/

namespace JapanTaxLaw.AviationFuelTaxRate

open JapanTaxLaw.TaxFinance

/-- Spec: 26,000円をキロリットル数だけ加算した額 (recursive formulation). -/
def specSum : Money → Money
  | 0 => 0
  | n + 1 => specSum n + 26_000

/-- Soundness/correspondence: implementation agrees with the independent spec
    for every quantity. Universal, kernel-checked; no `sorry`/`admit`. -/
theorem agree_aviation_fuel_tax (kilolitres : Money) :
    taxForKilolitres kilolitres = specSum kilolitres := by
  induction kilolitres with
  | zero =>
      simp [taxForKilolitres, specSum]
  | succ n ih =>
      unfold taxForKilolitres at ih ⊢
      simp [ratePerKilolitre] at ih
      simp [ratePerKilolitre, specSum, Nat.succ_mul, ih]

/-- Boundary: zero quantity gives zero tax. -/
theorem specSum_zero : specSum 0 = 0 := rfl

/-- Boundary: one kilolitre gives exactly ¥26,000. -/
example : specSum 1 = 26_000 := by decide

/-- Boundary: two kilolitres give exactly ¥52,000. -/
example : specSum 2 = 52_000 := by decide

/-- Boundary: strictly positive quantity gives strictly positive tax. -/
theorem specSum_pos_of_pos (n : Money) (h : 0 < n) : 0 < specSum n := by
  cases n with
  | zero => contradiction
  | succ k =>
      change 0 < specSum k + 26_000
      exact Nat.lt_of_lt_of_le (by decide : 0 < 26_000)
        (Nat.le_add_left 26_000 (specSum k))

/-- Monotonicity: more fuel never lowers the tax. -/
theorem taxForKilolitres_mono {a b : Money} (h : a ≤ b) :
    taxForKilolitres a ≤ taxForKilolitres b := by
  unfold taxForKilolitres
  exact Nat.mul_le_mul_right 26_000 h

/-- Rejects a ten-fold transcription error (二十六万円) and a ten-fold
    understatement (二千六百円), both kernel-decided. -/
theorem rate_not_scaled : ratePerKilolitre ≠ 260_000 ∧ ratePerKilolitre ≠ 2_600 := by
  decide

/-- Finite smoke check only; `agree_aviation_fuel_tax` is the proof. -/
def agreeAviationFuelTax : Bool :=
  [0, 1, 2, 3, 5, 10].all fun n =>
    taxForKilolitres n == specSum n

example : agreeAviationFuelTax = true := by decide

end JapanTaxLaw.AviationFuelTaxRate
