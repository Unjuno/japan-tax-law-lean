import JapanTaxLaw.RedevelopmentShareRatio

/-!
# RedevelopmentShareRatioTests — 施行令 art.42の3(2)一 回帰テスト

Pinned: law 332CO0000000043 / revision ..._20261101_507CO0000000127.
単独権利の零、旧権利が土地持分を超える場合の零、分母零、境界 50% を検査。
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

example : redevelopmentShareRatio 100 20 true = 0 := by decide
example : redevelopmentShareRatio 100 50 false = 0 := by decide
example : redevelopmentShareRatio 100 0 false = 1 := by decide
example : redevelopmentShareRatio 50 80 false = 0 := by decide
example : redevelopmentShareRatio 0 80 false = 0 := by decide
example : redevelopmentShareRatio 100 101 false = 0 := by decide
example : redevelopmentShareRatio 999 333 false = 0 := by decide

end JapanTaxLaw
