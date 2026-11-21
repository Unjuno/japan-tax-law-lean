import JapanTaxLaw.CustomsTariffArt8PresumedDumpingCapSpec

/-!
# CustomsTariffArt8PresumedDumpingCapTests — kernel-checked checks for 関税定率法 第八条(9)

Verifies the provisional-duty cap: duty ≤ presumed-normal − presumed-unfair
(dumping margin), with the additive-form independent spec and boundary cases.
-/

namespace JapanTaxLaw.CustomsTariffArt8PresumedDumpingCap

open JapanTaxLaw.TaxFinance

-- Dumping case: normal 1000, unfair 600 -> margin 400.
example : dumpingMargin (PresumedPrices.mk 1000 600) = 400 := rfl
example : withinCap (PresumedPrices.mk 1000 600) 400 := by
  unfold withinCap dumpingMargin
  decide
example : ¬ withinCap (PresumedPrices.mk 1000 600) 401 := by
  unfold withinCap dumpingMargin
  decide

-- Boundary: duty equal to the margin is allowed (同額以下 = at most).
example : withinCap (PresumedPrices.mk 1000 600) 400 := by
  unfold withinCap dumpingMargin
  decide

-- No dumping (unfair >= normal): saturating subtraction yields margin 0.
example : dumpingMargin (PresumedPrices.mk 600 1000) = 0 := rfl
example : dumpingMargin (PresumedPrices.mk 600 1000) = 0 :=
  margin_zero_when_no_dumping (PresumedPrices.mk 600 1000) (by decide)

-- Universal agreement with the independent additive spec.
example (p : PresumedPrices) (duty : Money) :
    withinCap p duty ↔ specWithinCap p duty :=
  agree_within_cap p duty

end JapanTaxLaw.CustomsTariffArt8PresumedDumpingCap
