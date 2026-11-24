import JapanTaxLaw.InvestigationExtensionSixMonths

/-!
# InvestigationExtensionSixMonthsSpec — independent spec

Declared statutory scope (Directive §1.5):

  Law id: 143AC0000000054 (関税定率法)
  Revision: 143AC0000000054_20260601_508AC0000000005
  Article: art. 7 (第七条) — the six-month ceiling on extending the
  investigation period. No other article or law is modelled here.

「六月以内に限り」 is transcribed independently as `¬ 6 < months`, not by
reusing the implementation's `months <= 6`. Agreement is proved in the kernel.
-/

namespace JapanTaxLaw.InvestigationExtensionSixMonthsSpec

def specWithin (months : Nat) : Bool :=
  decide (¬ 6 < months)

def agreeWithin (m : Nat) : Prop :=
  specWithin m = JapanTaxLaw.InvestigationExtensionSixMonths.withinExtension m

theorem agree_within (m : Nat) : agreeWithin m := by
  unfold agreeWithin specWithin JapanTaxLaw.InvestigationExtensionSixMonths.withinExtension
  unfold JapanTaxLaw.InvestigationExtensionSixMonths.maxExtensionMonths
  simp

end JapanTaxLaw.InvestigationExtensionSixMonthsSpec
