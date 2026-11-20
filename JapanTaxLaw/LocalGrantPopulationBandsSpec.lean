/-!
# LocalGrantPopulationBandsSpec — 独立形式仕様

pinned 原文（337M50000008017 art.11 昼間流入人口六区分）から独立に読み取った
仕様。実装 (LocalGrantPopulationBands.lean) を import しない。
-/
namespace JapanTaxLaw.LocalGrantPopulationBandsSpec

def bandSpec (i : Nat) (d : Nat) : Prop :=
  match i with
  | 0 => 1_000 <= d ∧ d < 6_000
  | 1 => 6_000 <= d ∧ d < 11_000
  | 2 => 11_000 <= d ∧ d < 55_000
  | 3 => 55_000 <= d ∧ d < 110_000
  | 4 => 110_000 <= d ∧ d < 220_000
  | _ => 220_000 <= d

end JapanTaxLaw.LocalGrantPopulationBandsSpec
