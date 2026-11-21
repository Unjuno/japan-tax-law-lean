import JapanTaxLaw.GasolineTaxCombination

/-!
# GasolineTaxCombination spec — 揮発油税合算 の独立整数定式
Sources (pinned): law 330CO0000000100, revision 330CO0000000100_20250401_506CO0000000372.
Independent restatement: 合算 = 国税 + 地方税（加法）。
-/

namespace JapanTaxLaw.GasolineTaxCombination

def specCombine (a b : Nat) : Nat := a + b

example : specCombine 100 50 = 150 := by decide

def agreeGasolineTaxCombination : Bool :=
  [ (0,0), (1,2), (100,50), (1000,2000), (1_000_000, 2_000_000) ].all fun (a,b) =>
    combinedAmount a b == specCombine a b

example : agreeGasolineTaxCombination = true := by decide

end JapanTaxLaw.GasolineTaxCombination
