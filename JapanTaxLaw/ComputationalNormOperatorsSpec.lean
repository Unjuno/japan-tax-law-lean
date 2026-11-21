/-\!
# ComputationalNormOperatorsSpec — 独立形式仕様

pinned 原文（算定規範 1255条片）から独立に読み取った仕様。実装を import しない。

表算定は value/unit*base、min/max は選択、端数処理は切り捨て (x - x%unit) と
四捨五入（最北部陳）。具体的な表・金額・単位は呼出側が与える。
-/
namespace JapanTaxLaw.ComputationalNormOperatorsSpec

def calcSpec (base unit value : Nat) : Nat := value / unit * base
def minSpec (a b : Nat) : Nat := if a <= b then a else b
def maxSpec (a b : Nat) : Nat := if a <= b then b else a
def roundDownSpec (x unit : Nat) : Nat := x - x % unit

end JapanTaxLaw.ComputationalNormOperatorsSpec
