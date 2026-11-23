/-\!
# TreatyJPUSDoubleTaxationSpec — 独立形式仕様

条約第二十三条から独立。実装を import しない。
-/
namespace JapanTaxLaw.TreatyJPUSDoubleTaxationSpec

def foreignTaxCreditSpec (f d : Nat) : Nat := if f <= d then f else d
def dividendExcludedSpec (p : Nat) : Bool := if 10 <= p then true else false

end JapanTaxLaw.TreatyJPUSDoubleTaxationSpec
