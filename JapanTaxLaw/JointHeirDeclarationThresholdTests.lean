import JapanTaxLaw.JointHeirDeclarationThresholdSpec

/-
# JointHeirDeclarationThresholdTests — kernel-decided checks for 石油石炭税法施行令 art.13(3)

All checks are closed Nat/Bool expressions discharged by `rfl` / `by decide`,
or theorem applications. Coverage: the pinned value, zero, one heir, the
two-heir floor, three heirs, a Nat identity, and impl/spec agreement.
-/

namespace JapanTaxLaw.JointHeirDeclarationThreshold

-- (a) pinned statutory value: 二人 = 2.
example : heirFloor = 2 := rfl

-- (b) zero and one heir do not satisfy the condition.
example : needsJointDeclaration 0 = false := by decide
example : needsJointDeclaration 1 = false := by decide

-- (c) 以上 is inclusive: exactly two heirs qualifies.
example : needsJointDeclaration 2 = true := by decide

-- (d) three heirs qualifies.
example : needsJointDeclaration 3 = true := by decide

-- (e) Nat identity / saturation at the threshold.
example : 2 + 0 = 2 := by decide

-- (f) kernel-decided impl/spec agreement at boundary points.
example : needsJointDeclaration 2 = specNeedsJoint 2 := by decide
example : needsJointDeclaration 1 = specNeedsJoint 1 := by decide
example : needsJointDeclaration 0 = specNeedsJoint 0 := by decide

-- (g) universal theorem applied to an arbitrary heir count.
example (x : Nat) : needsJointDeclaration x = specNeedsJoint x := agree_heir_floor x

-- (h) independent spec constant is the same statutory value.
example : specHeirFloor = 2 := rfl

end JapanTaxLaw.JointHeirDeclarationThreshold
