import JapanTaxLaw.DisasterIncomeTaxRelief

/-!
# DisasterIncomeTaxReliefSpec — independent spec for 災害減免法 art. 2 (full-relief band)

Scoped claim: this spec independently expresses the FIRST band of art. 2
("合計所得金額が五百万円以下であるとき当該所得税の額の全部"). The other two bands are
implemented and kernel-tested in the implementation module, but their
source-correspondence is NOT claimed here.

The independent definition uses the raw statute numeral only; agreement with
the implementation is proved in the Lean kernel.
-/

namespace JapanTaxLaw.DisasterIncomeTaxReliefSpec

def specFullRelief (x : Nat) : Prop :=
  x <= 5_000_000

def agreeFullRelief (x : Nat) : Prop :=
  specFullRelief x ↔ (JapanTaxLaw.DisasterIncomeTaxRelief.reliefFraction x).1 = 10

theorem agree_full_relief (x : Nat) : agreeFullRelief x := by
  unfold agreeFullRelief specFullRelief
  unfold JapanTaxLaw.DisasterIncomeTaxRelief.reliefFraction
  unfold JapanTaxLaw.DisasterIncomeTaxRelief.fullReliefThreshold
  unfold JapanTaxLaw.DisasterIncomeTaxRelief.halfReliefThreshold
  by_cases h : x <= 5_000_000
  · simp [h]
  · by_cases h2 : x <= 7_500_000
    · simp [h, h2]
    · simp [h, h2]

end JapanTaxLaw.DisasterIncomeTaxReliefSpec
