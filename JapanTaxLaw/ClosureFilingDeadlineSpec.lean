import JapanTaxLaw.ClosureFilingDeadline

/-!
# ClosureFilingDeadline spec — 一月以前（30日） の独立定式
Sources (pinned): law 346M50000040057, revision 346M50000040057_20120401_424M60000040035.
Independent restatement: meetsDeadline(d)=d>=30。
-/

namespace JapanTaxLaw.ClosureFilingDeadline

def specDeadline (d : Nat) : Bool := d >= 30

example : specDeadline 29 = false := by decide
example : specDeadline 30 = true := by decide

def agreeClosureFilingDeadline : Bool :=
  [0, 1, 29, 30, 31, 100].all fun d => meetsDeadline d == specDeadline d

example : agreeClosureFilingDeadline = true := by decide

end JapanTaxLaw.ClosureFilingDeadline
