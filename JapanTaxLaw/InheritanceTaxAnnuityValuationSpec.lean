/-\!
# InheritanceTaxAnnuityValuationSpec — 独立形式仕様

相続税法第二十五条の原文から独立。実装を import しない。
-/
namespace JapanTaxLaw.InheritanceTaxAnnuityValuationSpec

def rate90BaseSpec (base : Nat) : Nat := (90 * base) / 100
def case1BaseSpec (lumpSum : Bool) (a p : Nat) : Nat := if lumpSum then a else p
def contractValueSpec (nsv lump : Bool) (a p s : Nat) : Nat :=
  if nsv then rate90BaseSpec (case1BaseSpec lump a p) else s

end JapanTaxLaw.InheritanceTaxAnnuityValuationSpec
