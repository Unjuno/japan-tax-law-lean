import JapanTaxLaw.InheritanceTaxOrderArt1_2MutualAidContractReferenceSpec

/-!
# InheritanceTaxOrderArt1_2MutualAidContractReferenceTests — kernel-checked checks

Verifies REFERENCE 「法第十二条第一項第五号に規定する共済制度に係る契約」: coordinates 12/1/5, act-prescribed.
-/

namespace JapanTaxLaw.InheritanceTaxOrderArt1_2MutualAidContractReference

example : refArticle = 12 ∧ refParagraph = 1 ∧ refItem = 5 := reference_coordinates
example : isActPrescribed MutualAidSystem.actPrescribed = true := act_prescribed_true
example : isActPrescribed MutualAidSystem.other = false := other_false
example : SpecReference MutualAidSystem.actPrescribed refArticle refParagraph refItem :=
  implementation_satisfies_spec

end JapanTaxLaw.InheritanceTaxOrderArt1_2MutualAidContractReference
