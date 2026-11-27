import JapanTaxLaw.CustomsTariffArt15TreatyGoodsDelegationSpec

/-!
# CustomsTariffArt15TreatyGoodsDelegationTests — kernel-checked checks

Verifies DELEGATION 「条約の規定により輸入の後特定の用途に供されることを条件として関税を免除することとされている貨物で政令で定めるもの」: both gates required, spec equivalence.
-/

namespace JapanTaxLaw.CustomsTariffArt15TreatyGoodsDelegation

example : inScope true true = true := both_true_in_scope
example : inScope false true = false := no_treaty_out_of_scope
example : inScope true false = false := no_designation_out_of_scope
example : inScope true true = true ↔ SpecInScope true true := spec_agreement true true
example : inScope false true = true ↔ SpecInScope false true := spec_agreement false true
example : inScope true false = true ↔ SpecInScope true false := spec_agreement true false
example : inScope false false = true ↔ SpecInScope false false := spec_agreement false false

end JapanTaxLaw.CustomsTariffArt15TreatyGoodsDelegation
