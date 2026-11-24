import JapanTaxLaw.DeferralExceptionLimit

/-!
# Independent spec — art. 38(4) ただし書

Spec restates both `以下` caps as negated strict comparisons joined by Bool
AND, deliberately different from the implementation's chained `Nat` checks.
Agreement is proved for ALL pairs of `Nat`.
-/
namespace JapanTaxLaw.DeferralExceptionLimit

def specException (amountYen years : Nat) : Bool :=
  (!decide (amountCapYen < amountYen)) && (!decide (periodCapYears < years))

theorem agree_spec_impl (a y : Nat) : specException a y = exceptionApplies a y := by
  unfold specException exceptionApplies
  by_cases ha : a <= amountCapYen
  · by_cases hy : y <= periodCapYears
    · have hna : ¬ amountCapYen < a := Nat.not_lt.mpr ha
      have hny : ¬ periodCapYears < y := Nat.not_lt.mpr hy
      simp [ha, hy, hna, hny]
    · have hny : periodCapYears < y := Nat.lt_of_not_ge hy
      simp [ha, hy, hny]
  · have hna : amountCapYen < a := Nat.lt_of_not_ge ha
    simp [ha, hna]

end JapanTaxLaw.DeferralExceptionLimit
