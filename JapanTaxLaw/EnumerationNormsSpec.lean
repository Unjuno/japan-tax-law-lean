/-\!
# EnumerationNormsSpec — 独立形式仕様

pinned 原文（次に掲げる…いずれか 3362条片）から独立に読み取った仕様。実装を import しない。

列挙演算子はいずれかの条件が真なら真（再帰的論理和）。具体的条件は NOT MODELLED。
-/
namespace JapanTaxLaw.EnumerationNormsSpec

def anyOfSpec (flags : List Bool) : Bool :=
  match flags with
  | [] => false
  | b :: rest => b || anyOfSpec rest

end JapanTaxLaw.EnumerationNormsSpec
