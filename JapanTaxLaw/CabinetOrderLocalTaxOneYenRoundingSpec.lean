import JapanTaxLaw.CabinetOrderLocalTaxOneYenRounding

/-!
# CabinetOrderLocalTaxOneYenRounding spec — 恒等対応の独立定式
Sources (pinned): law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002.
-/

namespace JapanTaxLaw.CabinetOrderLocalTaxOneYenRounding

def specRound (a : Nat) : Nat := a

example : specRound 12345 = 12345 := by decide

def agreeCabinetOrderLocalTaxOneYenRounding : Bool :=
  [0,1,2,99,100,12345,1000000].all fun a => roundToYen a == specRound a

example : agreeCabinetOrderLocalTaxOneYenRounding = true := by decide

end JapanTaxLaw.CabinetOrderLocalTaxOneYenRounding
