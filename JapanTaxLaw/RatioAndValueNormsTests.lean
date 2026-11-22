import JapanTaxLaw.RatioAndValueNorms
import JapanTaxLaw.RatioAndValueNormsSpec

/-!
# RatioAndValueNormsTests — 割合・価額算入
-/
namespace JapanTaxLaw.RatioAndValueNormsTests

open JapanTaxLaw.RatioAndValueNorms

theorem include_spec (i v : Nat) :
    includeInBase i v = JapanTaxLaw.RatioAndValueNormsSpec.includeSpec i v := by rfl

theorem tax_spec (v r : Nat) :
    taxOnProperty v r = JapanTaxLaw.RatioAndValueNormsSpec.taxSpec v r := by rfl

example (t : Nat) (h : 0 < t) : ratioAtLeast t t 100 = true := ratio_at_full t h
example : ratioAtMost 0 0 50 = true := ratio_zero_total
example (v : Nat) : includeInBase 1 v = v := include_when_flagged v
example (v : Nat) : includeInBase 0 v = 0 := exclude_when_unflagged v
example (r : Nat) : taxOnProperty 0 r = 0 := tax_zero_value r
example : ratioValueDeclared = true := ratio_value_is_declaration

end JapanTaxLaw.RatioAndValueNormsTests
