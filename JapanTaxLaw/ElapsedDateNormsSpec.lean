/-\!
# ElapsedDateNormsSpec — 独立形式仕様

pinned 原文（経過日・期限 1708条片）から独立に読み取った仕様。実装を import しない。

経過日は start+n。「経過する日以後」は date >= start+n。「経過した日の前日」は
start+n-1（n=0 なら start）。期限内は finish-start<=limit。具体的な日付・期間は
呼出側が与える。
-/
namespace JapanTaxLaw.ElapsedDateNormsSpec

def elapsedSpec (s n : Nat) : Nat := s + n
def afterSpec (d s n : Nat) : Prop := s + n <= d
def beforeDaySpec (s n : Nat) : Nat := if n == 0 then s else s + n - 1
def deadlineSpec (s f l : Nat) : Prop := f - s <= l

end JapanTaxLaw.ElapsedDateNormsSpec
