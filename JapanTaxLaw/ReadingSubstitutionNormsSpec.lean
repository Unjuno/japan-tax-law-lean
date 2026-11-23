/-\!
# ReadingSubstitutionNormsSpec — 独立形式仕様

pinned 原文（読替え 657条片）から独立に読み取った仕様。実装を import しない。

読替えは各要素が old なら new、そうでなければ元のまま（再帰的置換）。
具体的な用語・条文は NOT MODELLED。
-/
namespace JapanTaxLaw.ReadingSubstitutionNormsSpec

def substituteSpec (xs : List Nat) (old new : Nat) : List Nat :=
  match xs with
  | [] => []
  | x :: rest => (if x = old then new else x) :: substituteSpec rest old new

end JapanTaxLaw.ReadingSubstitutionNormsSpec
