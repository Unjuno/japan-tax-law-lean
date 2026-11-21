import JapanTaxLaw.PublicSaleGuaranteeDeposit

/-!
# PublicSaleGuaranteeDepositSpec — independent spec for 国税徴収法施行令 第四十二条の五

Law id: 334CO0000000329 (国税徴収法施行令, CabinetOrder)
Revision: 334CO0000000329_20260525_507CO0000000244
Article: 第四十二条の五 — 公売保証金 ¥500,000 (delegated by CabinetOrder)
Normative unit: NORM|7e9db39251bc28440bf2799c75e0a9d152df7bb0d0dcc984788e68b272d6befd

The implementation stores the amount as a Nat constant with an rfl decode theorem.
The independent spec reformulates the amount via a successor-count: it asserts
`Nat.succ (publicSaleGuaranteeDepositYen - 1) = 500_000` (a boundary decomposition
claim, distinct from plain rfl). The kernel checks it axiom-free.

Not modelled: underlying Act provision 法第百条, auction procedure, other paragraphs
and other articles.
-/

namespace JapanTaxLaw.PublicSaleGuaranteeDeposit

open JapanTaxLaw.TaxFinance

/-- Independent spec: the amount expressed as a successor boundary. -/
def specAmountPredecessor : Money := 499_999

/-- Boundary decomposition: succ(predecessor) = amount. Axiom-free. -/
theorem agree_amount_successor :
    Nat.succ specAmountPredecessor = publicSaleGuaranteeDepositYen := by
  unfold specAmountPredecessor publicSaleGuaranteeDepositYen
  decide

end JapanTaxLaw.PublicSaleGuaranteeDeposit
