/-\!
# InheritanceTaxCloselyHeldSpec — 独立形式仕様

相続税法第六十六条の二から独立。実装を import しない。
-/
namespace JapanTaxLaw.InheritanceTaxCloselyHeldSpec

def exceedsHalfSpec (f t : Nat) : Bool := if 2 * f > t then true else false
def deemedDomicileSpec (h : Bool) : Bool := h

end JapanTaxLaw.InheritanceTaxCloselyHeldSpec
