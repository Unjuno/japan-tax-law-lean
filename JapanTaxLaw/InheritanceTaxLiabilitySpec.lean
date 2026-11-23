/-\!
# InheritanceTaxLiabilitySpec — 独立形式仕様

相続税法第一条の三の原文から独立。実装を import しない。
-/
namespace JapanTaxLaw.InheritanceTaxLiabilitySpec

def hasTaxObligationSpec (i1 i2 i3 i4 i5 : Bool) : Bool := i1 || i2 || i3 || i4 || i5
def item2i1Spec (j d h : Bool) : Bool := j && !d && h
def item2iSpec (j d h f : Bool) : Bool := j && !d && (h || !f)

end JapanTaxLaw.InheritanceTaxLiabilitySpec
