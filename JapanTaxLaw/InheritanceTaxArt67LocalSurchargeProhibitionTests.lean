import JapanTaxLaw.InheritanceTaxArt67LocalSurchargeProhibitionSpec

/-!
# InheritanceTaxArt67LocalSurchargeProhibitionTests — kernel-checked checks

Verifies EFFECT 「地方公共団体は、相続税又は贈与税の付加税を課することができない。」: local surcharge on inheritance/gift prohibited.
-/

namespace JapanTaxLaw.InheritanceTaxArt67LocalSurchargeProhibition

example : isProhibited true TaxKind.inheritance = true := local_inheritance_prohibited
example : isProhibited true TaxKind.gift = true := local_gift_prohibited
example : isProhibited false TaxKind.inheritance = false := non_local_not_prohibited
example : isProhibited true TaxKind.other = false := other_tax_not_prohibited
example : SpecProhibited true TaxKind.inheritance := spec_local_inheritance
example : SpecProhibited true TaxKind.inheritance := implementation_satisfies_spec
example : ¬ SpecProhibited false TaxKind.inheritance := non_local_not_satisfying

end JapanTaxLaw.InheritanceTaxArt67LocalSurchargeProhibition
