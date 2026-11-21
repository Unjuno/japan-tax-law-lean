/-\!
# RateSumProrationSpec — 独立形式仕様

pinned 原文（率乗・合算・差額・按分 1546条片）から独立に読み取った仕様。実装を import しない。

率乗算は base*rate、合算はリストの和、差額は |a-b|、按分は total*weight/sumWeights
（sumWeights=0 なら未定義）。具体的な金額・率は呼出側が与える。
-/
namespace JapanTaxLaw.RateSumProrationSpec

def rateSpec (base rate : Nat) : Nat := base * rate
def sumSpec : List Nat -> Nat
  | [] => 0
  | x :: xs => x + sumSpec xs
def diffSpec (a b : Nat) : Nat := if a <= b then b - a else a - b
def prorationSpec (t w s : Nat) : Option Nat := if s == 0 then none else some (t * w / s)

end JapanTaxLaw.RateSumProrationSpec
