import JapanTaxLaw.NationalTaxCommonDelegatedAmount

/-!
# NationalTaxCommonDelegatedAmountSpec — independent spec for 国税通則法施行規則 第一条の三(5)

Law id: 337M50000040028 (国税通則法施行規則, MinisterialOrdinance)
Revision: 337M50000040028_20261101_507M60000040025
Article: 第一条の三(5) — 財務省令で定める金額 ¥100,000,000 (delegated)
Normative unit: NORM|81fcecfaad1e405b864c4c594c99d6f9861e6155e9f59de04aa96a9ffd9b62f9

The implementation stores the amount with an rfl decode theorem. The
independent spec expresses the amount via a successor boundary:
`succ (amount - 1) = amount` with predecessor 99,999,999 — a distinct
formulation. The kernel checks it axiom-free.

Not modelled: underlying Act provision 法第三十四条第二項, rest of article 1-3,
other paragraphs and other articles.
-/

namespace JapanTaxLaw.NationalTaxCommonDelegatedAmount

open JapanTaxLaw.TaxFinance

/-- Independent spec: predecessor boundary of the delegated amount. -/
def specAmountPredecessor : Money := 99_999_999

/-- Boundary decomposition: succ(predecessor) = amount. Axiom-free. -/
theorem agree_amount_successor :
    Nat.succ specAmountPredecessor = delegatedAmountYen := by
  unfold specAmountPredecessor delegatedAmountYen
  decide

end JapanTaxLaw.NationalTaxCommonDelegatedAmount
