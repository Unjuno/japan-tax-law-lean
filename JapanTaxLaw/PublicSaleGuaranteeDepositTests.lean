import JapanTaxLaw.PublicSaleGuaranteeDepositSpec

/-!
# PublicSaleGuaranteeDepositTests — kernel-checked checks for 国税徴収法施行令 第四十二条の五

All checks are `rfl` / `by decide` / theorem application, kernel-checked.
-/

namespace JapanTaxLaw.PublicSaleGuaranteeDeposit

open JapanTaxLaw.TaxFinance

example : publicSaleGuaranteeDepositYen = 500_000 := amount_decoded
example : specAmountPredecessor = 499_999 := rfl
example : Nat.succ specAmountPredecessor = publicSaleGuaranteeDepositYen := agree_amount_successor

end JapanTaxLaw.PublicSaleGuaranteeDeposit
