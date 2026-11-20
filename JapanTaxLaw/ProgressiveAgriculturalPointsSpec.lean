/-!
# ProgressiveAgriculturalPointsSpec — 独立形式仕様

pinned 原文（337M50000008017 附則14の9(3) の三つの算式）から独立に読み取った
仕様。実装 (ProgressiveAgriculturalPoints.lean) を import しない。

小数率は 100 分の 1 単位の整数で表現する（0.03 → 3/100 等）。
丸めはこの原文片にないため NOT MODELLED。
-/
namespace JapanTaxLaw.ProgressiveAgriculturalPointsSpec

def bandSpec (i : Nat) (d : Nat) : Prop :=
  match i with
  | 0 => d <= 2_000
  | 1 => 2_000 < d ∧ d <= 7_000
  | _ => 7_000 < d

def valueHundredthsSpec (i : Nat) (d : Nat) : Nat :=
  match i with
  | 0 => d * 3
  | 1 => (d - 2_000) * 8 + 6_000
  | _ => (d - 7_000) * 10 + 46_000

end JapanTaxLaw.ProgressiveAgriculturalPointsSpec
