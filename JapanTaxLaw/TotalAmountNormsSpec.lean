/-\!
# TotalAmountNormsSpec — 独立形式仕様

pinned 原文（合計額 1363条片）から独立に読み取った仕様。実装を import しない。

合計額は component values の総和（再帰的加算）。具体的な component 値は NOT MODELLED。
-/
namespace JapanTaxLaw.TotalAmountNormsSpec

def totalSpec (values : List Nat) : Nat :=
  match values with
  | [] => 0
  | a :: xs => a + totalSpec xs

end JapanTaxLaw.TotalAmountNormsSpec
