import JapanTaxLaw.CustomsTariffArt7DumpingDutyObligor

/-!
# CustomsTariffArt7DumpingDutyObligorSpec — independent spec

Law id: 143AC0000000054 (関税定率法), revision from INVENTORY.
Art.7(4) EFFECT 「前項の相殺関税は、当該相殺関税を課されることとなる貨物の輸入者が納める義務があるものとする。」.
Normative unit: NORM|55732d61aadf34d9ec30275f6f3461c7eb7c5699b8d8647180d92c9bc8124760

The implementation uses an inductive value and a derived equality; the spec
states the obligor selection as a Prop equality, representationally distinct.
Agreements are proved by rfl/cases in the kernel. Axiom-free; no
decide/simp/propext.

Not modelled: duty computation, legal correctness.
-/

namespace JapanTaxLaw.CustomsTariffArt7DumpingDutyObligor

/-- Independent spec: the obligor is the importer. -/
def SpecObligor (o : Obligor) : Prop :=
  o = Obligor.importer

/-- The implementation satisfies the spec. -/
theorem implementation_satisfies_spec : SpecObligor obligor := rfl

/-- Another obligor does not satisfy the spec. -/
theorem other_not_satisfying : ¬ SpecObligor Obligor.other := by
  intro h
  cases h

end JapanTaxLaw.CustomsTariffArt7DumpingDutyObligor
