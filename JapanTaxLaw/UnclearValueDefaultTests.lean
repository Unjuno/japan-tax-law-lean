import JapanTaxLaw.UnclearValueDefaultSpec

/-! Regression tests — 数値不明時の 1.9% 代替. -/

namespace JapanTaxLaw.UnclearValueDefault

example : resolveRate none = 19 := by decide
example : resolveRate (some 19) = 19 := by decide
example : resolveRate (some 0) = 0 := by decide
example : resolveRate (some 50) = 50 := by decide
example : specResolved none (resolveRate none) := agreeResolve none
example : specResolved (some 7) (resolveRate (some 7)) := agreeResolve (some 7)

end JapanTaxLaw.UnclearValueDefault
