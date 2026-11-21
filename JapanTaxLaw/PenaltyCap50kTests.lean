import JapanTaxLaw.PenaltyCap50k
import JapanTaxLaw.PenaltyCap50kSpec

/-
# PenaltyCap50kTests — kernel-decided boundary checks for ＴＩＲ条約実施に伴う関税法等の特例に関する法律 第十八条

All checks are closed Nat/Bool expressions decided by the kernel (`by decide`)
or applications of universal theorems. Coverage: zero, small positive inputs,
the 五万円 (= 50,000) threshold neighbourhood, saturation/identity, and
impl/spec agreement on the boundary grid.

Pinned source: law 346AC0000000065, revision 346AC0000000065_20120401_424AC0000000019,
sha256 82bef1179656ff64b2d1b118e065b6373071425a93d8dfbfcf2a43e195b6daf7,
Article Num 18, needle「次の各号のいずれかに該当する者は、五万円以下の罰金に処する。」.
-/

namespace JapanTaxLaw.PenaltyCap50k

-- (a) zero amount is within the cap.
example : withinFineCap 0 = true := by decide

-- (b) small positive inputs and the 五万円 threshold neighbourhood.
example : withinFineCap 1 = true := by decide
example : withinFineCap 2 = true := by decide
example : withinFineCap 49_999 = true := by decide
example : withinFineCap 50_000 = true := by decide
example : withinFineCap 50_001 = false := by decide

-- (c) saturation / identity at the statutory cap 五万円 (= 50,000).
example : 50_000 - 50_000 = 0 := by decide
example : fineCap = 50_000 := by decide
example : fineCap <= 50_000 := by decide

-- (d) the named impl theorems apply at the boundary points.
example : withinFineCap 49_999 = true := below_cap_true
example : withinFineCap 50_000 = true := at_cap_true
example : withinFineCap 50_001 = false := above_cap_false
example : withinFineCap 0 = true := zero_true

-- direct-inequality monotonicity (no `Monotone`), universal.
example {amount amount' : Nat} (h : withinFineCap amount = true)
    (hle : amount' <= amount) : withinFineCap amount' = true :=
  withinFineCap_of_le h hle

-- (e) impl/spec agreement on the boundary grid (kernel-decided Bool).
example : withinFineCap 0 = specWithin 0 := by decide
example : withinFineCap 1 = specWithin 1 := by decide
example : withinFineCap 49_999 = specWithin 49_999 := by decide
example : withinFineCap 50_000 = specWithin 50_000 := by decide
example : withinFineCap 50_001 = specWithin 50_001 := by decide
example (x : Nat) : withinFineCap x = specWithin x := agreeWithin x

end JapanTaxLaw.PenaltyCap50k
