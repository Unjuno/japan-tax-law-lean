import JapanTaxLaw.ForestAreaRounding

/-!
# ForestAreaRounding tests — 面積補正 端数処理 smoke checks
Decidable smoke tests, pinned to law 431M60000008040 / revision 431M60000008040_20261021_508M60000008119.
境界: 4→0 / 5→1 / 14→1 / 15→2 / 25→3（1/10ha 単位）。
-/

namespace JapanTaxLaw.ForestAreaRounding

example : roundHa 0 = 0 := by decide
example : roundHa 4 = 0 := by decide
example : roundHa 5 = 1 := by decide
example : roundHa 14 = 1 := by decide
example : roundHa 15 = 2 := by decide
example : roundHa 25 = 3 := by decide
example : roundHa 100 = 10 := by decide

end JapanTaxLaw.ForestAreaRounding
