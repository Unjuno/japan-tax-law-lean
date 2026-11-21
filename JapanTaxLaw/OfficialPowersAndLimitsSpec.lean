/-\!
# OfficialPowersAndLimitsSpec — 独立形式仕様

pinned 原文（公権限・限度額 1820条片）から独立に読み取った仕様。実装を import しない。

裁量権限は必要があるときに行使可。登記嘱託は添付書類完備時に可能。控除限度額は
min(amount,limit)。具体的な公職者・金額は NOT MODELLED。
-/
namespace JapanTaxLaw.OfficialPowersAndLimitsSpec

def powerSpec (n : Bool) : Bool := n
def commissionSpec (d : Bool) : Bool := d
def capSpec (a l : Nat) : Nat := if a <= l then a else l

end JapanTaxLaw.OfficialPowersAndLimitsSpec
