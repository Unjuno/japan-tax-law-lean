import JapanTaxLaw.OilGasGrantTax

/-!
# OilGasGrantTax spec — 石油ガス譲与税法 art.1 の独立整数定式
Sources (pinned): law 340AC0000000157, revision 340AC0000000157_20090401_421AC0000000009.
Independent restatement: 譲与額 = 収入額 ÷ 2（自然数除算、切捨て）。
-/

namespace JapanTaxLaw.OilGasGrantTax

def specGrant (revenue : Nat) : Nat := revenue / 2

example : specGrant 100 = 50 := by decide
example : specGrant 1 = 0 := by decide

def agreeOilGasGrantTax : Bool :=
  [0, 1, 2, 3, 99, 100, 101, 1_000_000].all fun r => grantYen r == specGrant r

example : agreeOilGasGrantTax = true := by decide

end JapanTaxLaw.OilGasGrantTax
