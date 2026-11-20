/-!
# MeshPopulationBandsSpec — 独立形式仕様

pinned 原文（337M50000008017 附則19の14の3(5) e2..e8）から独立に読み取った
仕様。実装 (MeshPopulationBands.lean) を import しない。
-/
namespace JapanTaxLaw.MeshPopulationBandsSpec

def bandSpec (i : Nat) (d : Nat) : Prop :=
  match i with
  | 0 => 100 <= d ∧ d < 200
  | 1 => 200 <= d ∧ d < 300
  | 2 => 300 <= d ∧ d < 400
  | 3 => 400 <= d ∧ d < 500
  | 4 => 500 <= d ∧ d < 1000
  | 5 => 1000 <= d ∧ d < 2000
  | 6 => 2000 <= d ∧ d < 4000
  | _ => False

end JapanTaxLaw.MeshPopulationBandsSpec
