import JapanTaxLaw.DisasterTaxReliefOrderArt15_6PassengerCarReference

/-!
# DisasterTaxReliefOrderArt15_6PassengerCarReferenceSpec — independent spec

Law id: 322CO0000000268 (災害被害者租税減免法施行政令), revision from INVENTORY.
Article 15-6(2) REFERENCE 「自動車重量税法第七条第二項第一号に規定する乗用自動車」.
Normative unit: NORM|bf32b450dd578f2d29c8f6300ab9b5391a68134bb72afe9d30dd84a9314e8ce1

The implementation is a structure value; the spec states the resolved identity as
a Prop conjunction, representationally distinct. Axiom-free by rfl/And.intro.

Not modelled: external-law substantive definition, legal correctness.
-/

namespace JapanTaxLaw.DisasterTaxReliefOrderArt15_6PassengerCarReference

/-- Independent spec: the reference resolves to the pinned law identity. -/
def SpecResolvedRef (r : CrossLawRef) : Prop :=
  r.lawId = "346AC0000000089" ∧ r.lawName = "\u81ea\u52d5\u8eca\u91cd\u91cf\u7a0e\u6cd5" ∧
  r.article = "\u7b2c\u4e03\u6761" ∧ r.enforcementVersion = "2022-04-01"

/-- The implementation satisfies the spec. -/
theorem implementation_satisfies_spec : SpecResolvedRef definitionReference := by
  unfold SpecResolvedRef definitionReference
  exact And.intro rfl (And.intro rfl (And.intro rfl rfl))

end JapanTaxLaw.DisasterTaxReliefOrderArt15_6PassengerCarReference
