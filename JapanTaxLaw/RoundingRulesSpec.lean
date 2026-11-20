/-!
# RoundingRulesSpec — 独立形式仕様

pinned 原文（端数処理 238条片）から独立に読み取った仕様。実装を import しない。

「端数を四捨五入する」= 最も近い単位の倍数へ（半分は切り上げ）。
「端数を切り捨てる」= 単位の倍数へ下げる。
単位・対象額・周辺の算式は原文片ごとに異なるため NOT MODELLED。
-/
namespace JapanTaxLaw.RoundingRulesSpec

def roundSpec (x u : Nat) : Nat := (x + u / 2) / u * u

def floorSpec (x u : Nat) : Nat := x / u * u

end JapanTaxLaw.RoundingRulesSpec
