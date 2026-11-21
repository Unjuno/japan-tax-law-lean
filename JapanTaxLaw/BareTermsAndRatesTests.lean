import JapanTaxLaw.BareTermsAndRates
import JapanTaxLaw.BareTermsAndRatesSpec

/-!
# BareTermsAndRatesTests — 税率・参照・最小選択
-/
namespace JapanTaxLaw.BareTermsAndRatesTests

open JapanTaxLaw.BareTermsAndRates

theorem rate_spec (r b : Nat) :
    rateApply r b = JapanTaxLaw.BareTermsAndRatesSpec.rateSpec r b := by rfl

theorem ref_spec (d : Nat) :
    actRefDate d = JapanTaxLaw.BareTermsAndRatesSpec.actRefSpec d := by rfl

theorem min_spec (a b : Nat) :
    minAmount a b = JapanTaxLaw.BareTermsAndRatesSpec.minSpec a b := by rfl

example (b : Nat) : rateApply 100000 b = b := rate_identity_zero b
example (d : Nat) : actRefDate d = d := act_ref_identity d
example : applicationHeadingDeclared = true := heading_is_declaration
example (a b : Nat) (h : a <= b) : minAmount a b = a := min_left a b h
example (a b : Nat) (h : b < a) : minAmount a b = b := min_right a b h
example : termDeclared = true := term_is_declaration

end JapanTaxLaw.BareTermsAndRatesTests
