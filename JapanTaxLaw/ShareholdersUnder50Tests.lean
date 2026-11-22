import JapanTaxLaw.ShareholdersUnder50Spec

/-! Kernel-decided boundary examples: 0/49/50/51 人. -/

namespace JapanTaxLaw.ShareholdersUnder50Tests

open JapanTaxLaw.ShareholdersUnder50
open JapanTaxLaw.ShareholdersUnder50Spec

example : hasUnder50Shareholders 0 = true := by decide
example : hasUnder50Shareholders 49 = true := by decide
example : hasUnder50Shareholders 50 = false := by decide
example : hasUnder50Shareholders 51 = false := by decide
example : specWithin 49 = true := by decide
example : specWithin 50 = false := by decide
example : specWithin 51 = false := by decide
example : agree 0 := agree_thm 0
example : agree 49 := agree_thm 49
example : agree 50 := agree_thm 50
example : agree 51 := agree_thm 51

end JapanTaxLaw.ShareholdersUnder50Tests
