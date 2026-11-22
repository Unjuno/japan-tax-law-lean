/-\!
# AggregationNormsSpec — 独立形式仕様

pinned 原文（合算額 367条片）から独立に読み取った仕様。実装を import しない。

合算額は per-category amounts の総和（再帰的加算、順序非依存）。具体的な金額は NOT MODELLED。
-/
namespace JapanTaxLaw.AggregationNormsSpec

def aggregateSpec (amounts : List Nat) : Nat :=
  match amounts with
  | [] => 0
  | a :: xs => a + aggregateSpec xs

end JapanTaxLaw.AggregationNormsSpec
