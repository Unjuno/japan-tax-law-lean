import JapanTaxLaw.AmamiCurrencyConversion

/-!
# AmamiCurrencyConversion spec — 奄美群島税法施行令 art.6 の独立整数定式

Sources (pinned): law 328CO0000000407, revision 328CO0000000407_19660331_341CO0000000078.
Article Num 6.
Independent restatement: 「一円につき三円」= amount × 3.
-/

namespace JapanTaxLaw.AmamiCurrencyConversion

def specConvert (amount : Nat) : Nat := amount * 3

example : specConvert 1 = 3 := by decide
example : specConvert 1000 = 3000 := by decide

def agreeAmamiCurrencyConversion : Bool :=
  [0, 1, 2, 100, 1000, 999_999].all fun a => convert a == specConvert a

example : agreeAmamiCurrencyConversion = true := by decide

end JapanTaxLaw.AmamiCurrencyConversion
