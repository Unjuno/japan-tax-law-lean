/-\!
# GiftTaxLiabilitySpec — 独立形式仕様

相続税法第一条の四の原文から独立。実装を import しない。
-/
namespace JapanTaxLaw.GiftTaxLiabilitySpec

def hasGiftTaxObligationSpec (a b c d : Bool) : Bool := a || b || c || d
def item2i1Spec (j d h : Bool) : Bool := j && !d && h
def item2iSpec (j d h f : Bool) : Bool := j && !d && (h || !f)

end JapanTaxLaw.GiftTaxLiabilitySpec
