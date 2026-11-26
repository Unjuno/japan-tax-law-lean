import JapanTaxLaw.TaxFinance

/-!
# AmountSelection — 83 の いずれか多い／少ない金額 規定

Pinned provisions select the larger or smaller of two amounts:
「税額に相当する金額と五十万円とのいずれか多い金額」,
「相続税額に相当する税額と…税額とのいずれか少ない税額」.
The implementations are Nat max / min over caller-established amounts.
Which amounts are compared, and any surrounding rate or rounding, are NOT MODELLED.
Not legal advice.
-/

namespace JapanTaxLaw.AmountSelection

def greaterAmount (a b : Nat) : Nat := max a b
def lesserAmount (a b : Nat) : Nat := min a b

example : greaterAmount 500_000 300_000 = 500_000 := by decide
example : greaterAmount 500_000 700_000 = 700_000 := by decide
example : lesserAmount 500_000 300_000 = 300_000 := by decide
example : lesserAmount 500_000 700_000 = 500_000 := by decide

end JapanTaxLaw.AmountSelection
