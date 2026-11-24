import JapanTaxLaw.DisasterTaxReliefArt9VehicleNumberReference

/-!
# DisasterTaxReliefArt9VehicleNumberReferenceSpec — independent spec

Law id: 322AC0000000175 (災害被害者租税減免法), revision from INVENTORY.
Article 9(2) item3 REFERENCE 「自動車重量税法第二条第一項第三号に規定する車両番号の指定をいう。」.
Normative unit: NORM|5bbe8f54b0c419b7fc98b824f274be232c9427117dac9d087a1d1e143eea7575

The implementation is a structure value; the spec states the resolved identity as
a Prop conjunction, representationally distinct. Axiom-free by rfl/And.intro.

Not modelled: external-law substantive definition, legal correctness.
-/

namespace JapanTaxLaw.DisasterTaxReliefArt9VehicleNumberReference

/-- Independent spec: the reference resolves to the pinned law identity. -/
def SpecResolvedRef (r : CrossLawRef) : Prop :=
  r.lawId = "346AC0000000089" ∧ r.lawName = "\u81ea\u52d5\u8eca\u91cd\u91cf\u7a0e\u6cd5" ∧
  r.article = "\u7b2c\u4e8c\u6761" ∧ r.enforcementVersion = "2022-04-01"

/-- The implementation satisfies the spec. -/
theorem implementation_satisfies_spec : SpecResolvedRef definitionReference := by
  unfold SpecResolvedRef definitionReference
  exact And.intro rfl (And.intro rfl (And.intro rfl rfl))

end JapanTaxLaw.DisasterTaxReliefArt9VehicleNumberReference
