import JapanTaxLaw.MotorVehicleTaxShortfallSurcharge35

/-!
# MotorVehicleTaxShortfallSurcharge35 spec — 35/100 の独立定式
Sources (pinned): law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002,
art. 12の5 (第十二条の五). Independent restatement: shortage×35/100。
-/

namespace JapanTaxLaw.MotorVehicleTaxShortfallSurcharge35

def specShortfallSurcharge (shortage : Nat) : Nat :=
  shortage * 35 / 100

example : specShortfallSurcharge 100 = 35 := by decide

def agreeMotorVehicleTaxShortfallSurcharge35 : Bool :=
  [0, 1, 34, 35, 36, 99, 100, 101, 999, 1_000, 123_457].all fun s =>
    shortfallSurcharge s == specShortfallSurcharge s

example : agreeMotorVehicleTaxShortfallSurcharge35 = true := by decide

end JapanTaxLaw.MotorVehicleTaxShortfallSurcharge35
