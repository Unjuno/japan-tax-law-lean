/-\!
# RefundReferenceNormsSpec — 独立形式仕様

原文（還付金の参照）から独立。実装を import しない。
-/
namespace JapanTaxLaw.RefundReferenceNormsSpec

def refundRemainderSpec (overpaid refunded : Nat) : Nat := overpaid - refunded
def combineRefundsSpec (a b : Nat) : Nat := a + b

end JapanTaxLaw.RefundReferenceNormsSpec
