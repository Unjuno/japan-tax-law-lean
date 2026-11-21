import JapanTaxLaw.SpecialCorporationGrantTax

/-!
# SpecialCorporationGrantTax spec — 地方税法 art.29 の独立整数定式
Sources (pinned): law 431AC0000000004, revision 431AC0000000004_20260401_508AC0000000002.
Independent restatement: 譲与額 = 収入額（恒等関数）。
-/

namespace JapanTaxLaw.SpecialCorporationGrantTax

def specGrant (revenue : Nat) : Nat := revenue

example : specGrant 0 = 0 := by decide
example : specGrant 1_000_000 = 1_000_000 := by decide

def agreeSpecialCorporationGrantTax : Bool :=
  [0, 1, 2, 999, 1_000_000, 10_000_000].all fun r => grantYen r == specGrant r

example : agreeSpecialCorporationGrantTax = true := by decide

end JapanTaxLaw.SpecialCorporationGrantTax
