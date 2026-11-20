/-!
# LocalGrantIndexBandsSpec — 独立形式仕様

pinned 原文（337M50000008017 art.11 の C・E 区分表）から独立に読み取った
仕様。実装 (LocalGrantIndexBands.lean) を import しない。
-/
namespace JapanTaxLaw.LocalGrantIndexBandsSpec

namespace C

def bandSpec (i : Nat) (d : Nat) : Prop :=
  match i with
  | 0 => d < 100
  | 1 => 100 <= d ∧ d < 200
  | 2 => 200 <= d ∧ d < 300
  | _ => 300 <= d

end C

namespace E

def bandSpec (i : Nat) (d : Nat) : Prop :=
  match i with
  | 0 => d < 10
  | 1 => 10 <= d ∧ d < 110
  | 2 => 110 <= d ∧ d < 220
  | 3 => 220 <= d ∧ d < 330
  | _ => 330 <= d

end E
end JapanTaxLaw.LocalGrantIndexBandsSpec
