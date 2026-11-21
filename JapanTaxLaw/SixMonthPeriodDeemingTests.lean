import JapanTaxLaw.SixMonthPeriodDeeming
import JapanTaxLaw.SixMonthPeriodDeemingSpec

/-
# SixMonthPeriodDeemingTests — kernel-decided boundary checks for 納税貯蓄組合法施行令 第三条

All checks are closed Nat/Bool expressions decided by the kernel (`by decide`)
or applications of the universal theorems. Coverage: zero, small positives,
the six-month boundary, the ceiling jump at 7 (= 6 + 1), exact chunk multiples,
final partial chunks, STRICT deeming trigger, and impl/spec agreement.

Pinned source: law 326CO0000000099, revision 326CO0000000099_20191216_501CO0000000183,
sha256 4bea6d03094f44349178f1f6be77f66c0f71ac107cd78b8a5edab5081fc9e84c,
Article Num 3, needle「前項に規定する利子計算期間又は事業年度が六月をこえる場合においては、同項の規定の適用については、当該利子計算期間又は事業年度開始の日から六月ごとに区分した期間（最後に六月未満の期間を生じたときは、当該期間）を、それぞれ一利子計算期間又は一事業年度とみなす。」
-/

namespace JapanTaxLaw.SixMonthPeriodDeeming

-- (a) zero months: no period, hence no segments.
example : segmentCount 0 = 0 := by decide
example : specSegments 0 = 0 := by decide

-- (b) small positive inputs: a period up to six months is one segment.
example : segmentCount 1 = 1 := by decide
example : segmentCount 6 = 1 := by decide

-- (c) STRICT 六月をこえる boundary: six does not trigger, seven does.
example : deemingApplies 6 = false := by decide
example : deemingApplies 7 = true := by decide
example : specDeeming 6 = false := by decide
example : specDeeming 7 = true := by decide

-- (d) ceiling segmentation: 7 starts a second (partial) chunk; multiples exact.
example : segmentCount 7 = 2 := by decide
example : segmentCount 12 = 2 := by decide
example : segmentCount 13 = 3 := by decide
example : segmentCount 18 = 3 := by decide
example : specSegments 13 = 3 := by decide

-- (e) the final short chunk counts as a segment.
example : segmentCount 7 = segmentCount 6 + 1 := final_partial_chunk_counts
example : segmentCount 7 = segmentCount 6 + 1 := by decide

-- (f) named impl theorems apply at the boundary points.
example : segmentCount 0 = 0 := segmentCount_zero
example : segmentCount 1 = 1 := segmentCount_one
example : segmentCount 6 = 1 := segmentCount_six
example : segmentCount 7 = 2 := segmentCount_seven
example : segmentCount 12 = 2 := segmentCount_twelve
example : segmentCount 13 = 3 := segmentCount_thirteen
example : segmentCount 18 = 3 := segmentCount_eighteen
example : deemingApplies 6 = false := deeming_at_six
example : deemingApplies 7 = true := deeming_at_seven

-- (g) direct-inequality monotonicity (no `Monotone`).
example : segmentCount 6 <= segmentCount 7 := segmentCount_mono (show 6 <= 7 by decide)
example {a b : Nat} (h : a <= b) : segmentCount a <= segmentCount b := segmentCount_mono h

-- (h) impl/spec agreement on the boundary grid (kernel-decided Bool/Nat).
example : segmentCount 0 = specSegments 0 := by decide
example : segmentCount 6 = specSegments 6 := by decide
example : segmentCount 7 = specSegments 7 := by decide
example : segmentCount 12 = specSegments 12 := by decide
example : segmentCount 13 = specSegments 13 := by decide
example : segmentCount 18 = specSegments 18 := by decide
example : deemingApplies 6 = specDeeming 6 := by decide
example : deemingApplies 7 = specDeeming 7 := by decide
example (months : Nat) : segmentCount months = specSegments months := agreeSegments months
example (months : Nat) : deemingApplies months = specDeeming months := agreeDeeming months

end JapanTaxLaw.SixMonthPeriodDeeming
