import JapanTaxLaw.LocalTaxEnforcementDelegatedAmount3000

/-!
# LocalTaxEnforcementDelegatedAmount3000Spec — independent spec for 地方税法施行令 第八条の三

Law id: 325CO0000000245 (地方税法施行令, CabinetOrder)
Revision: 325CO0000000245_20261101_508CO0000000083
Article: 第八条の三 — 政令で定める金額 ¥3,000 (delegated)
Normative unit: NORM|92588e30e308fe82f1159ad13f75bfdaa96ba59a454b7739c70ead26f70ef7c7

The implementation stores the delegated amount with an rfl decode theorem.
The independent spec expresses it via a successor boundary:
`succ (amount - 1) = amount` with predecessor 2,999 — a distinct formulation.
Kernel checks it axiom-free.

Not modelled: underlying Act provision, rest of article 8-3, other paragraphs/articles.
-/

namespace JapanTaxLaw.LocalTaxEnforcementDelegatedAmount3000

open JapanTaxLaw.TaxFinance

/-- Independent spec: predecessor boundary of the delegated amount. -/
def specAmountPredecessor : Money := 2_999

/-- Boundary decomposition: succ(predecessor) = amount. Axiom-free. -/
theorem agree_amount_successor :
    Nat.succ specAmountPredecessor = delegatedAmountYen := by
  unfold specAmountPredecessor delegatedAmountYen
  decide

end JapanTaxLaw.LocalTaxEnforcementDelegatedAmount3000
