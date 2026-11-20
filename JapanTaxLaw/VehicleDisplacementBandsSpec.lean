/-!
# VehicleDisplacementBandsSpec — 独立形式仕様

pinned 原文（325AC0000000226 art.154 十区分）から独立に読み取った仕様。
実装 (VehicleDisplacementBands.lean) を import しない。

d : Nat は総排気量をデシリットル（0.1L）単位で表した値。
-/
namespace JapanTaxLaw.VehicleDisplacementBandsSpec

/-- 各原文区分を Prop として独立に書き下す（0-based index）。 -/
def bandSpec (i : Nat) (d : Nat) : Prop :=
  match i with
  | 0 => d <= 10
  | 1 => 10 < d ∧ d <= 15
  | 2 => 15 < d ∧ d <= 20
  | 3 => 20 < d ∧ d <= 25
  | 4 => 25 < d ∧ d <= 30
  | 5 => 30 < d ∧ d <= 35
  | 6 => 35 < d ∧ d <= 40
  | 7 => 40 < d ∧ d <= 45
  | 8 => 45 < d ∧ d <= 60
  | _ => 60 < d

end JapanTaxLaw.VehicleDisplacementBandsSpec
