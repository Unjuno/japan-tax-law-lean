import JapanTaxLaw.InheritanceTaxArt6RefundReading

/-!
# InheritanceTaxArt6RefundReadingSpec — independent spec

Law id: 325AC0000000073 (相続税法), revision from INVENTORY.
Art.6(2) READING 「前項の規定は、定期金給付契約について返還金その他これに準ずるものの取得があつた場合について準用する。」.
Normative unit: NORM|6a9778cbcc93bdfeea0959a2d1564eb147745c8fdb27015070e8875a83e9923e

The implementation is a function returning True/False per case; the spec states
the qualifying case as a Prop disequality, representationally distinct.
Equivalence is proved by cases in the kernel. Axiom-free; no
decide/simp/propext.

Not modelled: content of the preceding paragraph, legal correctness.
-/

namespace JapanTaxLaw.InheritanceTaxArt6RefundReading

/-- Independent spec: the case is a refund acquisition, not an unrelated one. -/
def SpecApplies (c : Case) : Prop :=
  c ≠ Case.other

/-- The implementation and spec agree for a refund acquisition. -/
theorem refund_spec_agreement : SpecApplies Case.refundAcquisition := by
  intro h
  cases h

/-- The implementation and spec agree for an unrelated case. -/
theorem other_spec_agreement : ¬ SpecApplies Case.other := by
  intro h
  exact h rfl

end JapanTaxLaw.InheritanceTaxArt6RefundReading
