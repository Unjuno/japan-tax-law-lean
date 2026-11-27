import JapanTaxLaw.CustomsTariffArt9ExtendedPeriodReading

/-!
# CustomsTariffArt9ExtendedPeriodReadingSpec — independent spec

Law id: 143AC0000000054 (関税定率法), revision from INVENTORY.
Art.9(11) READING 「第六項及び第七項の規定は、第一項の規定により指定された期間を前項の規定により延長する場合について準用する。」.
Normative unit: NORM|f55c47850f0fe15d2b1a966c8b34dda9488ecbc318966a97e974a14813bff0ad

The implementation states the gate as a Bool equality; the spec states it as a
Prop negation of the complementary case, representationally distinct.
Equivalence is proved by cases in the kernel. Axiom-free; no
decide/simp/propext.

Not modelled: content of paragraphs 6/7, legal correctness.
-/

namespace JapanTaxLaw.CustomsTariffArt9ExtendedPeriodReading

/-- Independent spec: the period is not unextended. -/
def SpecApplies (periodExtended : Bool) : Prop :=
  ¬ periodExtended = false

/-- The implementation and spec agree. -/
theorem applies_spec_agreement (b : Bool) : applies b ↔ SpecApplies b := by
  cases b with
  | false =>
      constructor
      · intro h
        cases h
      · intro h
        exact (h rfl).elim
  | true =>
      constructor
      · intro h
        intro hf
        cases hf
      · intro h
        rfl

end JapanTaxLaw.CustomsTariffArt9ExtendedPeriodReading
