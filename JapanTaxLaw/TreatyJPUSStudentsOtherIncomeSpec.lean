/-\!
# TreatyJPUSStudentsOtherIncomeSpec — 独立形式仕様

条約第十九条・第二十一条から独立。実装を import しない。
-/
namespace JapanTaxLaw.TreatyJPUSStudentsOtherIncomeSpec

def studentGrantExemptSpec (a b : Bool) : Bool := a && b
def traineeWithinOneYearSpec (y : Nat) : Bool := if y <= 1 then true else false
def otherIncomeSourceTaxSpec : Bool := false
def article7ForOtherIncomeSpec (p l : Bool) : Bool := p && l

end JapanTaxLaw.TreatyJPUSStudentsOtherIncomeSpec
