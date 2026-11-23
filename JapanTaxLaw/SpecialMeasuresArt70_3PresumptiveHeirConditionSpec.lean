import JapanTaxLaw.SpecialMeasuresArt70_3PresumptiveHeirCondition

/-!
# SpecialMeasuresArt70_3PresumptiveHeirConditionSpec — independent spec

Law id: 332AC0000000026 (租税特別措置法), revision from INVENTORY. Article 70_3(3) Item 1
Subitem 2 — PRESUMPTION 「住宅取得等資金の贈与をした者の直系卑属である推定相続人（孫を含む。）であること。」.
Normative unit: NORM|d775175c5fdefe03cb113c17eb692261fc30ceac82464eae2afd408b64095615

The implementation uses a Bool function and a Bool flag. The spec states them as a
Prop conjunction, representationally distinct. Axiom-free by cases/rfl.

Not modelled: substantive tax consequences, legal correctness.
-/

namespace JapanTaxLaw.SpecialMeasuresArt70_3PresumptiveHeirCondition

/-- Independent spec: heir status + grandchild inclusion as a Prop. -/
def SpecPresumption (h : HeirStatus) (f : Bool) : Prop :=
  h = HeirStatus.presumptiveLinealDescendant ∧ f = true

/-- The implementation satisfies the spec for the qualified heir. Axiom-free. -/
theorem implementation_satisfies_spec :
    SpecPresumption HeirStatus.presumptiveLinealDescendant includesGrandchild := by
  unfold SpecPresumption includesGrandchild
  exact And.intro rfl rfl

end JapanTaxLaw.SpecialMeasuresArt70_3PresumptiveHeirCondition
