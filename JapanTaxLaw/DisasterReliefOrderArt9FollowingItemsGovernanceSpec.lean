import JapanTaxLaw.DisasterReliefOrderArt9FollowingItemsGovernance

/-!
# DisasterReliefOrderArt9FollowingItemsGovernanceSpec — independent spec

Law id: 322CO0000000268 (災害被害者租税減免法施行政令), revision from INVENTORY.
Art.9(3) DELEGATION 「前二項の規定を適用する場合においては、次の各号の定めるところによる。」.
Normative unit: NORM|d0cb856a57842506990aec41a0c757458ed28f8db7c4057f954c919440bd54f0

The implementation is an inductive value; the spec states the selection as a
Prop equality, representationally distinct. Axiom-free by rfl/cases.

Not modelled: content of the following items, legal correctness.
-/

namespace JapanTaxLaw.DisasterReliefOrderArt9FollowingItemsGovernance

/-- Independent spec: the governing source is the following items. -/
def SpecGoverningSource (s : GoverningSource) : Prop :=
  s = GoverningSource.followingItems

/-- The implementation satisfies the spec. -/
theorem implementation_satisfies_spec : SpecGoverningSource governingSource := rfl

/-- An unspecified alternative does not satisfy the spec. -/
theorem other_not_satisfying : ¬ SpecGoverningSource GoverningSource.other := by
  intro h
  cases h

end JapanTaxLaw.DisasterReliefOrderArt9FollowingItemsGovernance
