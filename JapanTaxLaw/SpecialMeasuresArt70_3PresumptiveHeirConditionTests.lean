import JapanTaxLaw.SpecialMeasuresArt70_3PresumptiveHeirConditionSpec

/-!
# SpecialMeasuresArt70_3PresumptiveHeirConditionTests — kernel-checked checks

Verifies PRESUMPTION 「住宅取得等資金の贈与をした者の直系卑属である推定相続人（孫を含む。）であること。」: presumptive lineal descendant, grandchild included.
-/

namespace JapanTaxLaw.SpecialMeasuresArt70_3PresumptiveHeirCondition

example : includesGrandchild = true := grandchild_included
example : isQualifiedHeir HeirStatus.presumptiveLinealDescendant = true := presumptive_qualifies
example : isQualifiedHeir HeirStatus.other = false := other_not_qualifies
example : SpecPresumption HeirStatus.presumptiveLinealDescendant includesGrandchild :=
  implementation_satisfies_spec

end JapanTaxLaw.SpecialMeasuresArt70_3PresumptiveHeirCondition
