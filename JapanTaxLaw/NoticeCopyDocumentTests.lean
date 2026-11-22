import JapanTaxLaw.NoticeCopyDocument

/-!
# NoticeCopyDocument tests — 通知書の写し smoke checks
Decidable smoke tests, pinned to law 422M60000040052 / revision 422M60000040052_20101029_000000000000000.
通知書写し(0)→true、その他(1,2)→false。
-/

namespace JapanTaxLaw.NoticeCopyDocument

example : isSpecifiedDocument 0 = true := by decide
example : isSpecifiedDocument 1 = false := by decide
example : isSpecifiedDocument 2 = false := by decide

end JapanTaxLaw.NoticeCopyDocument
