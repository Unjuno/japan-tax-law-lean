import JapanTaxLaw.LocalTaxEnforcementDelegatedAmount3000Spec

/-!
# LocalTaxEnforcementDelegatedAmount3000Tests — kernel-checked checks for 地方税法施行令 第八条の三
-/

namespace JapanTaxLaw.LocalTaxEnforcementDelegatedAmount3000

open JapanTaxLaw.TaxFinance

example : delegatedAmountYen = 3_000 := amount_decoded
example : specAmountPredecessor = 2_999 := rfl
example : Nat.succ specAmountPredecessor = delegatedAmountYen := agree_amount_successor

end JapanTaxLaw.LocalTaxEnforcementDelegatedAmount3000
