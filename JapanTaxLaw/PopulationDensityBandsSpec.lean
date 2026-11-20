/-!
# PopulationDensityBandsSpec — 独立形式仕様

pinned 原文（処理区域内人口密度の四区分）から独立に読み取った仕様。
実装を import しない。
-/
namespace JapanTaxLaw.PopulationDensityBandsSpec

def bandSpec (i : Nat) (d : Nat) : Prop :=
  match i with
  | 0 => 25 <= d ∧ d < 50
  | 1 => 50 <= d ∧ d < 75
  | 2 => 75 <= d ∧ d < 100
  | _ => 100 <= d

end JapanTaxLaw.PopulationDensityBandsSpec
