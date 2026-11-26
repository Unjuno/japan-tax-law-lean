import JapanTaxLaw.HeaviestRecordedWeight

/-! Independent spec: `a + b - min a b` instead of `max a b`. The universal
omega bridge proves their equality for every Nat pair. No conditional,
therefore no Classical.choice. -/
namespace JapanTaxLaw.HeaviestRecordedWeight

def specHeaviest (a b : Nat) : Nat := a + b - min a b

theorem agreeHeaviest (a b : Nat) : specHeaviest a b = heaviest a b := by
  unfold specHeaviest heaviest
  omega

end JapanTaxLaw.HeaviestRecordedWeight
