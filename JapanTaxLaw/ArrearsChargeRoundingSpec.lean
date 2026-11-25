import JapanTaxLaw.ArrearsChargeRounding

/-!
# ArrearsChargeRounding spec — 基礎税額の独立定式
Sources (pinned): law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002.
Independent restatement: 2000 未満 0、以上は tax - tax%1000。
-/

namespace JapanTaxLaw.ArrearsChargeRounding

def specBase (t : Nat) : Nat := if t < 2000 then 0 else t - t % 1000

example : specBase 1999 = 0 := by decide
example : specBase 12345 = 12000 := by decide

def agreeArrearsChargeRounding : Bool :=
  [0, 1, 1999, 2000, 2001, 9999, 12345, 100000].all fun t => baseTax t == specBase t

example : agreeArrearsChargeRounding = true := by decide

end JapanTaxLaw.ArrearsChargeRounding
