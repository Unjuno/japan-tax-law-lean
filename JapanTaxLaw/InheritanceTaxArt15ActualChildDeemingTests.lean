import JapanTaxLaw.InheritanceTaxArt15ActualChildDeemingSpec

/-!
# InheritanceTaxArt15ActualChildDeemingTests — kernel-checked checks

Verifies DEEMING 「前項の規定の適用については、次に掲げる者は実子とみなす。」: listed person deemed actual child, other not.
-/

namespace JapanTaxLaw.InheritanceTaxArt15ActualChildDeeming

example : classifiedAsActualChild PersonClass.listedPerson := listed_deemed_actual_child
example : classifiedAsActualChild PersonClass.actualChild := actual_child_unchanged
example : ¬ classifiedAsActualChild PersonClass.other := other_not_deemed
example : SpecDeeming PersonClass.listedPerson (deemAsActualChild PersonClass.listedPerson) := deeming_spec_agreement PersonClass.listedPerson
example : SpecDeeming PersonClass.listedPerson (deemAsActualChild PersonClass.listedPerson) := listed_spec_agreement

end JapanTaxLaw.InheritanceTaxArt15ActualChildDeeming
