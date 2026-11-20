/-!
# TransitionalIncomeBracketsSpec — 独立形式仕様

pinned 原文（329M50000002023 附則4 の二つの年額表）から独立に読み取った
仕様。実装 (TransitionalIncomeBrackets.lean) を import しない。

「以下」は上限包含、「超え」は下限排他。
-/
namespace JapanTaxLaw.TransitionalIncomeBracketsSpec

namespace T350

def bandSpec (i : Nat) (d : Nat) : Prop :=
  match i with
  | 0 => d <= 3_500_000
  | 1 => 3_500_000 < d ∧ d <= 7_000_000
  | _ => 7_000_000 < d

end T350

namespace T300

def bandSpec (i : Nat) (d : Nat) : Prop :=
  match i with
  | 0 => d <= 3_000_000
  | 1 => 3_000_000 < d ∧ d <= 6_000_000
  | _ => 6_000_000 < d

end T300
end JapanTaxLaw.TransitionalIncomeBracketsSpec
