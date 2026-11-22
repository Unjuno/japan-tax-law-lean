import JapanTaxLaw.TaxNoticeDeadline

/-!
# TaxNoticeDeadline spec — 納期限10日前 の独立定式
Sources (pinned): law 327AC0000000119, revision 327AC0000000119_20260401_508AC0000000002.
Independent restatement: meetsNoticeDeadline(d)=d>=10。
-/

namespace JapanTaxLaw.TaxNoticeDeadline

def specDeadline (d : Nat) : Bool := d >= 10

example : specDeadline 9 = false := by decide
example : specDeadline 10 = true := by decide

def agreeTaxNoticeDeadline : Bool :=
  [0, 1, 9, 10, 11, 100].all fun d => meetsNoticeDeadline d == specDeadline d

example : agreeTaxNoticeDeadline = true := by decide

end JapanTaxLaw.TaxNoticeDeadline
