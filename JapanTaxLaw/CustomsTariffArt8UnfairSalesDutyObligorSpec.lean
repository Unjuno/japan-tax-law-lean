import JapanTaxLaw.CustomsTariffArt8UnfairSalesDutyObligor

/-!
# CustomsTariffArt8UnfairSalesDutyObligorSpec — independent spec

Law id: 143AC0000000054 (関税定率法), revision from INVENTORY.
Art.8(3) EFFECT 「前項の不当廉売関税は、当該不当廉売関税を課されることとなる貨物の輸入者が納める義務があるものとする。」.
Normative unit: NORM|c28c6f86eb781a5292f44784e7290218444ae1d396cd8a0b2a9af18b35bf9c14

The implementation uses an inductive value and a derived equality; the spec
states the obligor selection as a Prop equality, representationally distinct.
Agreements are proved by rfl/cases in the kernel. Axiom-free; no
decide/simp/propext.

Not modelled: duty computation, legal correctness.
-/

namespace JapanTaxLaw.CustomsTariffArt8UnfairSalesDutyObligor

/-- Independent spec: the obligor is the importer. -/
def SpecObligor (o : Obligor) : Prop :=
  o = Obligor.importer

/-- The implementation satisfies the spec. -/
theorem implementation_satisfies_spec : SpecObligor obligor := rfl

/-- Another obligor does not satisfy the spec. -/
theorem other_not_satisfying : ¬ SpecObligor Obligor.other := by
  intro h
  cases h

end JapanTaxLaw.CustomsTariffArt8UnfairSalesDutyObligor
