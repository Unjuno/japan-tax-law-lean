import JapanTaxLaw.EmploymentDuration6Months
import JapanTaxLaw.EmploymentDuration6MonthsSpec

/-
# EmploymentDuration6MonthsTests — kernel-decided boundary checks for 第十一条の八（六月以上）

All checks are closed Nat/Bool expressions decided by the kernel (`by decide`)
or applications of universal theorems. Coverage: zero, small positive month
counts, the 六月 (= 6) threshold neighbourhood, impl/spec agreement on the
boundary grid, and direct-inequality monotonicity.

Pinned source: law 328M50000040011, revision 328M50000040011_20260901_506M60000040032
(CurrentEnforced), sha256 d93f1c0211998c35e8acbc78620fe736df6b53d3b289ac1ee903a9b8b4543e3b,
Article Num 11_8, needle「酒類小売業者に引き続き六月以上の期間継続して雇用されることが予定されている者」.
Official title: 酒税の保全及び酒類業組合等に関する法律施行規則 (abbrev 酒団法施行規則).
-/

namespace JapanTaxLaw.EmploymentDuration6Months

-- (a) zero months is below the 六月 floor.
example : meetsDurationFloor 0 = false := by decide

-- (b) small positive inputs and the 六月 threshold neighbourhood.
example : meetsDurationFloor 1 = false := by decide
example : meetsDurationFloor 2 = false := by decide
example : meetsDurationFloor 3 = false := by decide
example : meetsDurationFloor 4 = false := by decide
example : meetsDurationFloor 5 = false := by decide
example : meetsDurationFloor 6 = true := by decide
example : meetsDurationFloor 7 = true := by decide

-- (c) the named impl theorems apply at the boundary points.
example : meetsDurationFloor 0 = false := zero_false
example : meetsDurationFloor 5 = false := five_false
example : meetsDurationFloor 6 = true := six_true
example : meetsDurationFloor 7 = true := seven_true
example : durationFloor = 6 := durationFloor_value

-- (d) direct-inequality monotonicity (plain Nat inequality), universal.
example {months months' : Nat} (h : meetsDurationFloor months = true)
    (hle : months <= months') : meetsDurationFloor months' = true :=
  meetsDurationFloor_of_ge h hle

-- (e) impl/spec agreement on the boundary grid (kernel-decided Bool).
example : meetsDurationFloor 0 = specMeets 0 := by decide
example : meetsDurationFloor 5 = specMeets 5 := by decide
example : meetsDurationFloor 6 = specMeets 6 := by decide
example : meetsDurationFloor 7 = specMeets 7 := by decide
example (x : Nat) : meetsDurationFloor x = specMeets x := agreeDuration x

end JapanTaxLaw.EmploymentDuration6Months
