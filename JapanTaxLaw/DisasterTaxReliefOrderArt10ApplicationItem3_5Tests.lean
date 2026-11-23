import JapanTaxLaw.DisasterTaxReliefOrderArt10ApplicationItem3_5Spec

/-!
# DisasterTaxReliefOrderArt10ApplicationItem3_5Tests — kernel-checked checks

Verifies EFFECT 「法第三条第五項の規定の適用を受けようとする旨」: coordinates 3/5, listed item required.
-/

namespace JapanTaxLaw.DisasterTaxReliefOrderArt10ApplicationItem3_5

example : refArticle = 3 ∧ refParagraph = 5 := reference_coordinates
example : isRequiredItem ApplicationItem.actArt3Para5Intent = true := listed_item_required
example : isRequiredItem ApplicationItem.other = false := other_not_listed
example : SpecEffect ApplicationItem.actArt3Para5Intent refArticle refParagraph :=
  implementation_satisfies_spec

end JapanTaxLaw.DisasterTaxReliefOrderArt10ApplicationItem3_5
