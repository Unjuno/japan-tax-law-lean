import JapanTaxLaw.PolyesterStapleFiberSpecs
import JapanTaxLaw.PolyesterStapleFiberSpecsSpec

/-
# PolyesterStapleFiberSpecsTests — kernel-decided checks (政令 414CO0000000262, 第一条)

Pinned: law 414CO0000000262 / revision 414CO0000000262_20110401_423CO0000000088.
Every check is a closed Nat/Bool expression discharged by `rfl` / `by decide`,
or an application of the universal omega bridge theorems. Coverage: zero and
small positive inputs, the STRICT fineness bounds 388/389/2222/2223 (plus an
interior point), the INCLUSIVE length bounds 24/25/80/81, combined cases, Nat
identity/saturation at the scaled bounds, and impl/spec agreement.
-/

namespace JapanTaxLaw.PolyesterStapleFiberSpecs

-- Pinned scaled constants (exact integers, no floats).
example : finenessLow = 388 := rfl
example : finenessHigh = 2223 := rfl
example : lengthLow = 25 := rfl
example : lengthHigh = 80 := rfl
example : specFLow = 388 := rfl
example : specFHigh = 2223 := rfl
example : specLLow = 25 := rfl
example : specLHigh = 80 := rfl

-- (a) zero input: neither axis is satisfied.
example : finenessInRange 0 = false := by decide
example : lengthInRange 0 = false := by decide
example : isPolyesterStaple 0 0 = false := by decide
example : specF 0 = false := by decide
example : specL 0 = false := by decide

-- (b) small positive input (1 mm / 1 dtex-low) is below both ranges.
example : finenessInRange 1 = false := by decide
example : lengthInRange 1 = false := by decide
example : isPolyesterStaple 1 1 = false := by decide

-- (c) fineness: 超え / 未満 are STRICT.
example : finenessInRange 388 = false := by decide  -- 三・八八 excluded
example : finenessInRange 389 = true := by decide
example : finenessInRange 1000 = true := by decide  -- interior point
example : finenessInRange 2222 = true := by decide
example : finenessInRange 2223 = false := by decide -- 二十二・二三 excluded
example : finenessInRange 2224 = false := by decide

-- (d) length: 以上 / 以下 are INCLUSIVE.
example : lengthInRange 24 = false := by decide
example : lengthInRange 25 = true := by decide  -- 二十五 included
example : lengthInRange 50 = true := by decide
example : lengthInRange 80 = true := by decide  -- 八十 included
example : lengthInRange 81 = false := by decide

-- (e) combined: both dimensionally distinct axes must hold.
example : isPolyesterStaple 388 25 = false := by decide
example : isPolyesterStaple 389 25 = true := by decide
example : isPolyesterStaple 2222 80 = true := by decide
example : isPolyesterStaple 2223 80 = false := by decide
example : isPolyesterStaple 1000 24 = false := by decide
example : isPolyesterStaple 1000 81 = false := by decide

-- (f) Nat identity / saturation at the scaled bounds (kernel-decided).
example : 388 + 0 = 388 := by decide
example : 2223 - 2223 = 0 := by decide
example : 80 - 80 = 0 := by decide
example : 25 + 0 - 25 = 0 := by decide
example : 0 + 0 = 0 := by decide

-- (g) impl/spec agreement: concrete points plus the universal omega bridges.
example : finenessInRange 388 = specF 388 := by decide
example : finenessInRange 389 = specF 389 := by decide
example : finenessInRange 2223 = specF 2223 := by decide
example : lengthInRange 24 = specL 24 := by decide
example : lengthInRange 25 = specL 25 := by decide
example : lengthInRange 80 = specL 80 := by decide
example : lengthInRange 81 = specL 81 := by decide
example : isPolyesterStaple 389 25 = specPolyesterStaple 389 25 := by decide
example : isPolyesterStaple 2223 80 = specPolyesterStaple 2223 80 := by decide
example (f : Nat) : finenessInRange f = specF f := agree_finenessInRange f
example (len : Nat) : lengthInRange len = specL len := agree_lengthInRange len
example (f len : Nat) :
    isPolyesterStaple f len = specPolyesterStaple f len :=
  agree_isPolyesterStaple f len

end JapanTaxLaw.PolyesterStapleFiberSpecs
