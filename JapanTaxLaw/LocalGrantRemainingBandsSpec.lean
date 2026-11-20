/-!
# LocalGrantRemainingBandsSpec — 独立形式仕様

pinned 原文（337M50000008017 art.11 の A・B 区分表）から独立に読み取った
仕様。実装 (LocalGrantRemainingBands.lean) を import しない。
-/
namespace JapanTaxLaw.LocalGrantRemainingBandsSpec

namespace A

def bandSpec (i : Nat) (d : Nat) : Prop :=
  match i with
  | 0 => 200 <= d ∧ d < 350
  | 1 => 350 <= d ∧ d < 650
  | 2 => 650 <= d ∧ d < 950
  | 3 => 950 <= d ∧ d < 990
  | _ => 990 <= d

end A

namespace B

def bandSpec (i : Nat) (d : Nat) : Prop :=
  match i with
  | 0 => d < 96
  | _ => 96 <= d

end B
end JapanTaxLaw.LocalGrantRemainingBandsSpec
