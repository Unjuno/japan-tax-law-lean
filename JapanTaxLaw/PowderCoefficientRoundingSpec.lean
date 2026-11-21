import JapanTaxLaw.PowderCoefficientRounding

/-!
# PowderCoefficientRounding spec — 粉末酒換算係数 端数計算 の独立整数定式
Sources (pinned): law 337M50000040026, revision 337M50000040026_20250401_507M60000040034.
Independent restatement: 第三位未満切捨て = ÷10×10、第二位未満切捨て = ÷100×100（1/10000 単位）。
-/

namespace JapanTaxLaw.PowderCoefficientRounding

def specT3 (x : Nat) : Nat := x / 10 * 10
def specT2 (x : Nat) : Nat := x / 100 * 100

example : specT3 12_345 = 12_340 := by decide
example : specT2 12_345 = 12_300 := by decide

def agreePowderCoefficientRounding : Bool :=
  [0, 1, 9, 10, 11, 12_345, 12_999, 99_999].all fun x =>
    truncate3 x == specT3 x && truncate2 x == specT2 x

example : agreePowderCoefficientRounding = true := by decide

end JapanTaxLaw.PowderCoefficientRounding
