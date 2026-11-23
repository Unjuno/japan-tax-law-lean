/-\!
# TreatyJPUSShippingTransferPricingSpec — 独立形式仕様

条約第八条・第九条から独立。実装を import しない。
-/
namespace JapanTaxLaw.TreatyJPUSShippingTransferPricingSpec

def shippingProfitsSourceTaxSpec : Bool := false
def containerSourceTaxSpec (u : Bool) : Bool := u
def transferPricingAdjustmentSpec (r n : Bool) : Bool := r && n
def adjustmentWithinSevenYearsSpec (y : Nat) : Bool := if y <= 7 then true else false

end JapanTaxLaw.TreatyJPUSShippingTransferPricingSpec
