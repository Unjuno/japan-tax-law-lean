import JapanTaxLaw.TaxFinance

/-!
# PerMilleSevenPointFive — 租税特別措置法施行令 art.11（百分の一→千分の七・五 読み替え）
Sources (pinned): law `332CO0000000043` / rev `332CO0000000043_20261101_507CO0000000127`.
原文: 「同条第四項第三号中『百分の一』とあるのは、『千分の七・五』とする。」
Computation: 千分の七・五 = 7.5/1000 = 75/10000 (= 0.75%)。
  substituted(base) = base * 75 / 10000（Nat の下限切り捨て）。
Scope: 読み替えの適用対象・根拠額の算定は NOT MODELLED。法的レビューを提供しない。
-/

namespace JapanTaxLaw.PerMilleSevenPointFive

def numerator : Nat := 75
def denominator : Nat := 10_000

def substituted (base : Nat) : Nat := base * numerator / denominator

example : substituted 10_000 = 75 := by decide
example : substituted 100_000 = 750 := by decide

end JapanTaxLaw.PerMilleSevenPointFive
