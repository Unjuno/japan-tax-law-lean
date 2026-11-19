import JapanTaxLaw.GasolineTransferRounding

/-!
# GasolineTransferRounding spec — 地方揮発油譲与税法 art.5 の独立整数定式
Sources (pinned): law 330AC0000000113, revision 330AC0000000113_20190401_431AC0000000002.
Independent restatement: 「千円未満の端数を控除」= (amount / 1000) × 1000.
-/

namespace JapanTaxLaw.GasolineTransferRounding

def specTransfer (amount : Nat) : Nat := amount / 1000 * 1000

example : specTransfer 12_345 = 12_000 := by decide
example : specTransfer 999 = 0 := by decide
example : specTransfer 1000 = 1000 := by decide

def agreeGasolineTransferRounding : Bool :=
  [0, 1, 999, 1000, 1001, 12_345, 999_999].all fun a => transferAmount a == specTransfer a
example : agreeGasolineTransferRounding = true := by decide

end JapanTaxLaw.GasolineTransferRounding
