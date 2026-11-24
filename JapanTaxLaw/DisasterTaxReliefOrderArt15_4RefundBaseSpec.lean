import JapanTaxLaw.DisasterTaxReliefOrderArt15_4RefundBase

/-!
# DisasterTaxReliefOrderArt15_4RefundBaseSpec — independent spec

Law id: 322CO0000000268 (災害被害者租税減免法施行政令), revision from INVENTORY.
Article 15-4(1) item 2 EFFECT 「還付を受けようとする自動車重量税の額に相当する金額」.
Normative unit: NORM|beaa62718d9817915074146fe618eb76b36fa3647c372ba793c4f2a85d27d58e

The implementation is a Nat function; the spec states the correspondence as a Prop
equality, representationally distinct. Axiom-free by rfl.

Not modelled: refund eligibility, tax computation, legal correctness.
-/

namespace JapanTaxLaw.DisasterTaxReliefOrderArt15_4RefundBase

/-- Independent spec: the base amount equals the tax amount. -/
def SpecRefundBase (taxAmount base : Nat) : Prop := base = taxAmount

/-- The implementation satisfies the spec for every tax amount. -/
theorem implementation_satisfies_spec (a : Nat) :
    SpecRefundBase a (refundBaseAmount a) := by
  unfold SpecRefundBase refundBaseAmount
  rfl

end JapanTaxLaw.DisasterTaxReliefOrderArt15_4RefundBase
