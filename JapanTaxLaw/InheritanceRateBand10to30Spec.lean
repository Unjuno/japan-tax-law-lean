import JapanTaxLaw.InheritanceRateBand10to30

/-!
# Independent spec — 相続税法 art.16 ¥10M<amount≤¥30M band

The spec expresses membership as two negated inequalities joined by Bool AND,
deliberately different in formulation from the implementation's chained
`Nat` comparisons. Agreement is proved for ALL `Nat` inputs.
-/
namespace JapanTaxLaw.InheritanceRateBand10to30

def specInBand (amountYen : Nat) : Bool :=
  (!decide (amountYen <= lowerYen)) && (!decide (upperYen < amountYen))

theorem agree_spec_impl (n : Nat) : specInBand n = inBand n := by
  unfold specInBand inBand
  by_cases hlo : n <= lowerYen
  · have h1 : decide (lowerYen < n) = false := by
      have : ¬ lowerYen < n := Nat.not_lt.mpr hlo
      simp [this]
    simp [hlo, h1]
  · have hlo' : lowerYen < n := Nat.lt_of_not_ge hlo
    by_cases hup : n <= upperYen
    · have h2 : decide (upperYen < n) = false := by
        have : ¬ upperYen < n := Nat.not_lt.mpr hup
        simp [this]
      simp [hlo, hup, hlo', h2]
    · have hup' : upperYen < n := Nat.lt_of_not_ge hup
      have h2 : decide (upperYen < n) = true := by simp [hup']
      simp [hlo, hup, h2]

end JapanTaxLaw.InheritanceRateBand10to30
