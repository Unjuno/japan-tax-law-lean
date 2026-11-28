import JapanTaxLaw.InheritanceTaxArt32EquivalentCauseDelegationSpec

/-!
# InheritanceTaxArt32EquivalentCauseDelegationTests — kernel-checked checks

Verifies DELEGATION 「前各号に規定する事由に準ずるものとして政令で定める事由が生じたこと。」: both gates required, spec equivalence.
-/

namespace JapanTaxLaw.InheritanceTaxArt32EquivalentCauseDelegation

example : inScope true true = true := both_true_in_scope
example : inScope false true = false := no_cause_out_of_scope
example : inScope true false = false := no_designation_out_of_scope
example : inScope true true = true ↔ SpecInScope true true := spec_agreement true true
example : inScope false true = true ↔ SpecInScope false true := spec_agreement false true
example : inScope true false = true ↔ SpecInScope true false := spec_agreement true false
example : inScope false false = true ↔ SpecInScope false false := spec_agreement false false

end JapanTaxLaw.InheritanceTaxArt32EquivalentCauseDelegation
