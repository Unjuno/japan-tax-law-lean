/-!
# PayloadCapacityBandsSecondTableSpec — 独立形式仕様

pinned 原文（325AC0000000226 art.154 第二の最大積載量九区分）から独立に
読み取った仕様。実装を import しない。
-/
namespace JapanTaxLaw.PayloadCapacityBandsSecondTableSpec

def bandSpec (i : Nat) (d : Nat) : Prop :=
  match i with
  | 0 => d <= 1
  | 1 => 1 < d ∧ d <= 2
  | 2 => 2 < d ∧ d <= 3
  | 3 => 3 < d ∧ d <= 4
  | 4 => 4 < d ∧ d <= 5
  | 5 => 5 < d ∧ d <= 6
  | 6 => 6 < d ∧ d <= 7
  | 7 => 7 < d ∧ d <= 8
  | _ => 8 < d

end JapanTaxLaw.PayloadCapacityBandsSecondTableSpec
