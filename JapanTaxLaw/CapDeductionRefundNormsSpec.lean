/-\!
# CapDeductionRefundNormsSpec — 独立形式仕様

pinned 原文（限度・控除・還付・加算 5069条片）から独立に読み取った仕様。実装を import しない。

限度は min(amount,cap)、控除は amount-deduction、還付は支払-税額（超過分のみ）、
免税は 0、加算税は base+base*rate。具体的な金額は呼出側が与える。
-/
namespace JapanTaxLaw.CapDeductionRefundNormsSpec

def capSpec (a c : Nat) : Nat := if a <= c then a else c
def deductSpec (a d : Nat) : Nat := a - d
def refundSpec (p t : Nat) : Nat := if t <= p then p - t else 0
def exemptSpec (t : Nat) : Nat := 0
def addTaxSpec (b r : Nat) : Nat := b + b * r

end JapanTaxLaw.CapDeductionRefundNormsSpec
