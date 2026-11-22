/-\!
# CostAdditionOperatorsSpec — 独立形式仕様

pinned 原文（購入費用の加算 31条片）から独立に読み取った仕様。実装を import しない。

費用加算は costs=0 なら代価、そうでなければ代価+費用。具体的な金額は NOT MODELLED。
-/
namespace JapanTaxLaw.CostAdditionOperatorsSpec

def addCostsSpec (price costs : Nat) : Nat := if costs = 0 then price else price + costs

end JapanTaxLaw.CostAdditionOperatorsSpec
