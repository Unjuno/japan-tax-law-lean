import JapanTaxLaw.GrayscaleGradationFloorSpec

/-
# GrayscaleGradationFloorTests — kernel-decided checks for 情報通信技術活用省令 art.5(2)(2)

All checks are closed Nat/Bool expressions discharged by `rfl` / `by decide`,
or theorem applications. Coverage: the pinned value, zero, a small positive
input, both sides of the 256-level floor, a Nat identity, and impl/spec agreement.
-/

namespace JapanTaxLaw.GrayscaleGradationFloor

-- (a) pinned statutory value: 二百五十六 = 256.
example : gradationFloor = 256 := rfl

-- (b) zero and small positive level counts fail.
example : meetsGrayscaleFloor 0 = false := by decide
example : meetsGrayscaleFloor 1 = false := by decide

-- (c) just below the floor fails.
example : meetsGrayscaleFloor 255 = false := by decide

-- (d) 以上 is inclusive: exactly 256 qualifies.
example : meetsGrayscaleFloor 256 = true := by decide

-- (e) one above the floor qualifies.
example : meetsGrayscaleFloor 257 = true := by decide

-- (f) Nat identity / saturation at the floor.
example : 256 + 0 = 256 := by decide

-- (g) kernel-decided impl/spec agreement at boundary points.
example : meetsGrayscaleFloor 256 = specMeetsGrayscale 256 := by decide
example : meetsGrayscaleFloor 255 = specMeetsGrayscale 255 := by decide
example : meetsGrayscaleFloor 0 = specMeetsGrayscale 0 := by decide

-- (h) universal theorem applied to an arbitrary level count.
example (x : Nat) : meetsGrayscaleFloor x = specMeetsGrayscale x := agree_grayscale_floor x

-- (i) independent spec constant is the same statutory value.
example : specFloor = 256 := rfl

end JapanTaxLaw.GrayscaleGradationFloor
