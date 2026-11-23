/-\!
# MiningTaxMonthlyProrationSpec — 独立形式仕様

地方税法第百八十三条から独立。実装を import しない。
-/
namespace JapanTaxLaw.MiningTaxMonthlyProrationSpec

def monthsFromNextMonthSpec (s : Nat) : Nat := 12 - s
def monthsUntilExtinctionSpec (e : Nat) : Nat := e
def monthlyAppliesSpec (succ : Bool) : Bool := !succ

end JapanTaxLaw.MiningTaxMonthlyProrationSpec
