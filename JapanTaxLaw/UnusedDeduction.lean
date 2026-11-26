import JapanTaxLaw.TaxFinance

/-!
# UnusedDeduction — 62 の 控除しきれない金額 規定

Pinned provisions state an undeducted remainder: 「給与特別控除額を控除前
源泉徴収税額から控除してもなお控除しきれない金額」, 「損失の金額は、
まず…所得金額から控除し、なお控除しきれない損失の金額があるときは…」.
In every case the remainder is `max(0, deduction - base)`: `deduction` is the
amount being deducted (credit limit / loss / special deduction) and `base` is
what it is deducted against. Nat arithmetic clamps subtraction at zero.
The identity of the two operands, the carry-forward period and any surrounding
percentage rule are caller-established and NOT MODELLED.
Not legal advice.
-/

namespace JapanTaxLaw.UnusedDeduction

def undeducted (deduction base : Nat) : Nat :=
  if base ≤ deduction then deduction - base else 0

example : undeducted 100 40 = 60 := by decide
example : undeducted 100 100 = 0 := by decide
example : undeducted 100 140 = 0 := by decide

end JapanTaxLaw.UnusedDeduction
