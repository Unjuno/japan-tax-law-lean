import JapanTaxLaw.CustomsTariffArt17ReexportGoodsDelegationSpec

/-!
# CustomsTariffArt17ReexportGoodsDelegationTests — kernel-checked checks

Verifies DELEGATION 「条約の規定により輸入の後一定の期間内に輸出されることを条件として関税を免除することとされている貨物で政令で定めるもの」: all three gates required, spec equivalence.
-/

namespace JapanTaxLaw.CustomsTariffArt17ReexportGoodsDelegation

example : inScope true true true = true := all_true_in_scope
example : inScope false true true = false := no_treaty_out_of_scope
example : inScope true false true = false := no_export_out_of_scope
example : inScope true true false = false := no_designation_out_of_scope
example : inScope true true true = true ↔ SpecInScope true true true := spec_agreement true true true
example : inScope false true true = true ↔ SpecInScope false true true := spec_agreement false true true
example : inScope true false true = true ↔ SpecInScope true false true := spec_agreement true false true
example : inScope true true false = true ↔ SpecInScope true true false := spec_agreement true true false
example : inScope false false false = true ↔ SpecInScope false false false := spec_agreement false false false

end JapanTaxLaw.CustomsTariffArt17ReexportGoodsDelegation
