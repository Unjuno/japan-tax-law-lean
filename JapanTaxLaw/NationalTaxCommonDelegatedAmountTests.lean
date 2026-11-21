import JapanTaxLaw.NationalTaxCommonDelegatedAmountSpec

/-!
# NationalTaxCommonDelegatedAmountTests — kernel-checked checks for 国税通則法施行規則 第一条の三(5)

All checks are `rfl` / `by decide` / theorem application, kernel-checked.
-/

namespace JapanTaxLaw.NationalTaxCommonDelegatedAmount

open JapanTaxLaw.TaxFinance

example : delegatedAmountYen = 100_000_000 := amount_decoded
example : specAmountPredecessor = 99_999_999 := rfl
example : Nat.succ specAmountPredecessor = delegatedAmountYen := agree_amount_successor

end JapanTaxLaw.NationalTaxCommonDelegatedAmount
