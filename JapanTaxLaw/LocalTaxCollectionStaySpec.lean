/-\!
# LocalTaxCollectionStaySpec — 独立形式仕様

地方税法第十五条の七から独立。実装を import しない。
-/
namespace JapanTaxLaw.LocalTaxCollectionStaySpec

def hardshipStayGroundSpec (h : Bool) : Bool := h
def threeYearsContinuedSpec (y : Nat) : Bool := if 3 <= y then true else false
def obligationExtinguishedSpec (y : Nat) : Bool := if 3 <= y then true else false

end JapanTaxLaw.LocalTaxCollectionStaySpec
