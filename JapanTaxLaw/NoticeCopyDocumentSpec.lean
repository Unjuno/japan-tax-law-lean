import JapanTaxLaw.NoticeCopyDocument

/-!
# NoticeCopyDocument spec — 通知書の写し の独立定式
Sources (pinned): law 422M60000040052, revision 422M60000040052_20101029_000000000000000.
Independent restatement: 指定書類 = {通知書写し(0)}、その他(1) 対象外。
-/

namespace JapanTaxLaw.NoticeCopyDocument

def specDocument (d : Nat) : Bool := d == 0

example : specDocument 0 = true := by decide
example : specDocument 1 = false := by decide

def agreeNoticeCopyDocument : Bool :=
  [0, 1, 2].all fun d => isSpecifiedDocument d == specDocument d

example : agreeNoticeCopyDocument = true := by decide

end JapanTaxLaw.NoticeCopyDocument
