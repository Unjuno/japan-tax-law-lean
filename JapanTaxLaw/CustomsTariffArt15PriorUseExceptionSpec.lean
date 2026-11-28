import JapanTaxLaw.CustomsTariffArt15PriorUseException

/-!
# CustomsTariffArt15PriorUseExceptionSpec — independent typed specification

Pinned source identical to the implementation module (関税定率法 art.15(1)(9)).
The one-year threshold is restated as a plain `Nat` literal in years read
independently from 「一年以上」. The specification uses years rather than the
implementation's months and a complementary formulation (zero years is not
prior use) so it does not reuse the implementation's predicate.
-/

namespace JapanTaxLaw.CustomsTariffArt15PriorUseException

/-- Independent restatement of 「一年」 (years). -/
def specOneYear : Nat := 1

/-- Independent formulation in years: vessel/aircraft need >= one year. -/
def specPriorUse (vesselOrAircraft : Bool) (years : Nat) : Bool :=
  if vesselOrAircraft then specOneYear <= years else years != 0

example : specOneYear = 1 := by decide
example : specPriorUse false 0 = false := by decide
example : specPriorUse false 1 = true := by decide
example : specPriorUse true 0 = false := by decide
example : specPriorUse true 1 = true := by decide
example : specPriorUse true 2 = true := by decide

/-- Kernel-decided agreement: months = years * 12 (finite, not universal). -/
def agreeCustomsTariffArt15PriorUseException : Bool :=
  let years := [0, 1, 2, 5]
  let categories := [false, true]
  years.all fun y =>
    categories.all fun c =>
      inPriorUseException c (y * 12) == specPriorUse c y

example : agreeCustomsTariffArt15PriorUseException = true := by decide

end JapanTaxLaw.CustomsTariffArt15PriorUseException
