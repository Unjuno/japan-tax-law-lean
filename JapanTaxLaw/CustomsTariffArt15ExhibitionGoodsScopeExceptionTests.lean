import JapanTaxLaw.CustomsTariffArt15ExhibitionGoodsScopeExceptionSpec

/-!
# CustomsTariffArt15ExhibitionGoodsScopeExceptionTests — kernel-checked checks

Verifies EXCEPTION 「ただし、博覧会等の開催の期間及び規模、物品の種類及び価格その他の事情を勘案して相当と認められるものに限る。」: all three gates required, spec equivalence.
-/

namespace JapanTaxLaw.CustomsTariffArt15ExhibitionGoodsScopeException

example : inScope true true true = true := all_true_in_scope
example : inScope false true true = false := bad_period_scale_out_of_scope
example : inScope true false true = false := bad_kind_price_out_of_scope
example : inScope true true false = false := bad_other_out_of_scope
example : inScope true true true = true ↔ SpecInScope true true true := spec_agreement true true true
example : inScope false true true = true ↔ SpecInScope false true true := spec_agreement false true true
example : inScope true false true = true ↔ SpecInScope true false true := spec_agreement true false true
example : inScope true true false = true ↔ SpecInScope true true false := spec_agreement true true false
example : inScope false false false = true ↔ SpecInScope false false false := spec_agreement false false false

end JapanTaxLaw.CustomsTariffArt15ExhibitionGoodsScopeException
