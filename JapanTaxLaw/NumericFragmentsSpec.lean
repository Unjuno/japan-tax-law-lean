/-\!
# NumericFragmentsSpec — 独立形式仕様

pinned 原文（金額・割合・小数 1853条片）から独立に読み取った仕様。実装を import しない。

金額は漢数字に 万=10000/千=1000/百=100 の乗数を掛けた Nat（裸の「円」は値なし）。
割合は「百分のX」の X、小数は (整数部, 小数部) の対。
通貨・単位の意味は NOT MODELLED（PROVED_SCOPE）。
-/
namespace JapanTaxLaw.NumericFragmentsSpec

def amountSpec (y man sen hyaku : Nat) : Nat := man * 10000 + sen * 1000 + hyaku * 100
def percentSpec (n : Nat) : Nat := n
def decimalSpec (a b : Nat) : Nat × Nat := (a, b)

end JapanTaxLaw.NumericFragmentsSpec
