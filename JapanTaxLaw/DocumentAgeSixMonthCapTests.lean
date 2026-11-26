import JapanTaxLaw.DocumentAgeSixMonthCap
import JapanTaxLaw.DocumentAgeSixMonthCapSpec

/-
# DocumentAgeSixMonthCapTests — 国外送金等調書施行規則 4(4)(3)ハ の kernel-decided 検証

Pinned: law 409M50000040096 / revision 409M50000040096_20250401_507M60000040027.
Coverage: zero/small inputs, six-month lookback boundary (L-1/L/L+1),
shifted months, future documents and impl/spec agreement.
-/

namespace JapanTaxLaw.DocumentAgeSixMonthCap

example : lookbackMonths = 6 := by decide

-- 零入力・小さい入力
example : freshDocs 0 0 = true := by decide
example : freshDocs 0 1 = true := by decide
example : freshDocs 1 2 = true := by decide

-- 境界: 六か月 (L-1 / L / L+1)
example : freshDocs 0 5 = true := by decide
example : freshDocs 0 6 = true := by decide
example : freshDocs 0 7 = false := by decide

-- シフトした提示月
example : freshDocs 5 10 = true := by decide
example : freshDocs 4 10 = true := by decide
example : freshDocs 3 10 = false := by decide

-- 未来の書類は対象外
example : freshDocs 11 10 = false := by decide

-- impl / 独立仕様の一致
example : lookbackMonths = specLookback := by decide
example : freshDocs 0 0 = specFresh 0 0 := by decide
example : freshDocs 0 5 = specFresh 0 5 := by decide
example : freshDocs 0 6 = specFresh 0 6 := by decide
example : freshDocs 0 7 = specFresh 0 7 := by decide
example : freshDocs 5 10 = specFresh 5 10 := by decide
example : freshDocs 11 10 = specFresh 11 10 := by decide

end JapanTaxLaw.DocumentAgeSixMonthCap
