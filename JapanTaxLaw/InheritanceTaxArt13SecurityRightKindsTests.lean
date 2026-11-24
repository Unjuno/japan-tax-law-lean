import JapanTaxLaw.InheritanceTaxArt13SecurityRightKindsSpec

/-!
# InheritanceTaxArt13SecurityRightKindsTests — kernel-checked checks

Verifies EFFECT 「その財産を目的とする留置権、特別の先取特権、質権又は抵当権で担保される債務」: four enumerated rights listed; others not.
-/

namespace JapanTaxLaw.InheritanceTaxArt13SecurityRightKinds

example : isListedRight SecurityRight.retention = true := retention_listed
example : isListedRight SecurityRight.specialPriority = true := special_priority_listed
example : isListedRight SecurityRight.pledge = true := pledge_listed
example : isListedRight SecurityRight.mortgage = true := mortgage_listed
example : isListedRight SecurityRight.other = false := other_not_listed
example : SpecListedRight SecurityRight.retention := spec_retention
example : SpecListedRight SecurityRight.mortgage := spec_mortgage
example : (isListedRight SecurityRight.retention = true) ↔ SpecListedRight SecurityRight.retention := agree_retention
example : (isListedRight SecurityRight.other = false) ↔ ¬ SpecListedRight SecurityRight.other := agree_other

end JapanTaxLaw.InheritanceTaxArt13SecurityRightKinds
