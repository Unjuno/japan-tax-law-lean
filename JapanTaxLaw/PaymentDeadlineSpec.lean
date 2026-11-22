import JapanTaxLaw.PaymentDeadline

/-!
# PaymentDeadline spec — 納付期限 20日以内 の独立整数定式
Sources (pinned): law 329M50000040039, revision 329M50000040039_20260924_508M60000040059.
Independent restatement: days <= 20（境界含む）。
-/

namespace JapanTaxLaw.PaymentDeadline

def specWithin (d : Nat) : Bool := d <= 20

example : specWithin 20 = true := by decide
example : specWithin 21 = false := by decide

def agreePaymentDeadline : Bool :=
  [0, 1, 19, 20, 21, 100].all fun d => isWithinDeadline d == specWithin d

example : agreePaymentDeadline = true := by decide

end JapanTaxLaw.PaymentDeadline
