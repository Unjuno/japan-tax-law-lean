/-!
# LocalGrantAmountBandsSpec — 独立形式仕様

pinned 原文（337M50000008017 art.11 金額六区分）から独立に読み取った仕様。
実装 (LocalGrantAmountBands.lean) を import しない。
-/
namespace JapanTaxLaw.LocalGrantAmountBandsSpec

def bandSpec (i : Nat) (d : Nat) : Prop :=
  match i with
  | 0 => 3_000 <= d ∧ d < 25_000
  | 1 => 25_000 <= d ∧ d < 50_000
  | 2 => 50_000 <= d ∧ d < 100_000
  | 3 => 100_000 <= d ∧ d < 400_000
  | 4 => 400_000 <= d ∧ d < 900_000
  | _ => 900_000 <= d

end JapanTaxLaw.LocalGrantAmountBandsSpec
