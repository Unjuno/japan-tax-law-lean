/-!
# CaseBasedLookupSpec — 独立形式仕様

pinned 原文（場合の区分に応じて…に定める…783条片）から独立に読み取った仕様。
実装を import しない。

該当する区分の番号 i に対して、列挙された対応値 vals i を選択する。
複数該当の文言では、該当する全区分の値を合計する。
実際の書類・金額・割合・期間・条件は原文片ごとに異なるため NOT MODELLED。
-/
namespace JapanTaxLaw.CaseBasedLookupSpec

def selectSpec (i n : Nat) (vals : Nat → Nat) (f : Nat) : Nat :=
  if i < n then vals i else f

def aggregateSpec (n : Nat) (pred : Nat → Bool) (vals : Nat → Nat) : Nat :=
  (List.range n).foldl (fun acc k => if pred k then acc + vals k else acc) 0

end JapanTaxLaw.CaseBasedLookupSpec
