import JapanTaxLaw.LocalGasolineArt7PaymentAllocation287Spec

/-!
# LocalGasolineArt7PaymentAllocation287 tests — kernel-decided boundary checks

Pinned to law 330AC0000000104 / revision 330AC0000000104_20260401_508AC0000000012.
境界: 286/287/288（分母）と 574（287×2）。
-/

namespace JapanTaxLaw.LocalGasolineArt7PaymentAllocation287

example : localShare 0 = 0 := by decide
example : nationalShare 0 = 0 := by decide
example : localShare 286 = 43 := by decide
example : nationalShare 286 = 242 := by decide
example : localShare 287 = 44 := by decide
example : nationalShare 287 = 243 := by decide
example : localShare 288 = 44 := by decide
example : localShare 574 = 88 := by decide
example : specLocal 287 = localShare 287 := by decide
example : specNational 288 = nationalShare 288 := by decide

end JapanTaxLaw.LocalGasolineArt7PaymentAllocation287
