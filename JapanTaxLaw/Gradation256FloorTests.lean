import JapanTaxLaw.Gradation256FloorSpec

/-
# Gradation256FloorTests — kernel-decided checks for 電子帳簿保存法施行規則 art.2(6)(2)

All checks are closed Nat/Bool expressions discharged by `rfl` / `by decide`,
or theorem applications. Coverage: the pinned value, zero, a small positive
input, both sides of the 256-level floor, a Nat identity, and impl/spec agreement.
-/

namespace JapanTaxLaw.Gradation256Floor

-- (a) pinned statutory value: 二百五十六 = 256.
example : gradationFloor = 256 := rfl

-- (b) zero and small positive level counts fail.
example : meetsGradationFloor 0 = false := by decide
example : meetsGradationFloor 1 = false := by decide

-- (c) just below the floor fails.
example : meetsGradationFloor 255 = false := by decide

-- (d) 以上 is inclusive: exactly 256 qualifies.
example : meetsGradationFloor 256 = true := by decide

-- (e) one above the floor qualifies.
example : meetsGradationFloor 257 = true := by decide

-- (f) Nat identity / saturation at the floor.
example : 256 + 0 = 256 := by decide

-- (g) kernel-decided impl/spec agreement at boundary points.
example : meetsGradationFloor 256 = specMeetsGradation 256 := by decide
example : meetsGradationFloor 255 = specMeetsGradation 255 := by decide
example : meetsGradationFloor 0 = specMeetsGradation 0 := by decide

-- (h) universal theorem applied to an arbitrary level count.
example (x : Nat) : meetsGradationFloor x = specMeetsGradation x := agree_gradation_floor x

-- (i) independent spec constant is the same statutory value.
example : specGradationFloor = 256 := rfl

end JapanTaxLaw.Gradation256Floor
