import JapanTaxLaw.DonationAggregateStrictLimitSpec

/-!
# DonationAggregateStrictLimitTests — kernel-checked checks for 租税特別措置法施行規則 十九条の十の五

All checks are `rfl` / `by decide` / theorem application, kernel-checked.
-/

namespace JapanTaxLaw.DonationAggregateStrictLimit

open JapanTaxLaw.TaxFinance

example : strictLimitYen = 1_000 := rfl
example : withinStrictLimit 999 := below_limit
example : ¬ withinStrictLimit 1_000 := at_limit
example (t : Money) : withinStrictLimit t ↔ specWithinStrictLimit t := agree_strict_limit t

end JapanTaxLaw.DonationAggregateStrictLimit
