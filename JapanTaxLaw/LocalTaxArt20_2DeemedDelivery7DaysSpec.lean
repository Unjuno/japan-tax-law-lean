import JapanTaxLaw.LocalTaxArt20_2DeemedDelivery7Days

/-!
# LocalTaxArt20_2DeemedDelivery7DaysSpec — independent typed specification

Pinned source identical to the implementation module (地方税法 art.20の2(3)).
The seven-day threshold is restated as a plain `Nat` literal read independently
from 「七日」. The specification uses the complementary form (if the threshold
is strictly greater than elapsed days, delivery is not yet deemed) so it does
not reuse the implementation's `>=` predicate.
-/

namespace JapanTaxLaw.LocalTaxArt20_2DeemedDelivery7Days

/-- Independent restatement of 「七日」 (days). -/
def specDays : Nat := 7

/-- Complementary formulation: not (7 > elapsedDays). -/
def specDeemed (elapsedDays : Nat) : Bool :=
  if specDays > elapsedDays then false else true

example : specDays = 7 := by decide
example : specDeemed 0 = false := by decide
example : specDeemed 6 = false := by decide
example : specDeemed 7 = true := by decide
example : specDeemed 8 = true := by decide

/-- Kernel-decided agreement on an enumerated grid (finite, not universal). -/
def agreeLocalTaxArt20_2DeemedDelivery7Days : Bool :=
  let days := [0, 1, 5, 6, 7, 8, 13, 14]
  days.all fun d => isDeemedDelivered d == specDeemed d

example : agreeLocalTaxArt20_2DeemedDelivery7Days = true := by decide

end JapanTaxLaw.LocalTaxArt20_2DeemedDelivery7Days
