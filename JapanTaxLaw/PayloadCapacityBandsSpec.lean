/-!
# PayloadCapacityBandsSpec — 独立形式仕様

pinned 原文（325AC0000000226 art.154 最大積載量九区分）から独立に読み取った
仕様。実装を import しない。
-/
namespace JapanTaxLaw.PayloadCapacityBandsSpec

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

end JapanTaxLaw.PayloadCapacityBandsSpec
