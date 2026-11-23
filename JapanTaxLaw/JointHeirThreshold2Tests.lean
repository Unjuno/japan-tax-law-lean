import JapanTaxLaw.JointHeirThreshold2
import JapanTaxLaw.JointHeirThreshold2Spec

/-
# JointHeirThreshold2Tests — kernel-decided boundary checks for 相続税法施行規則 第十一条

All checks are closed Nat/Bool expressions decided by the kernel (`by decide`)
or applications of universal theorems. Coverage: zero, small positive inputs,
the 二人 (= 2) INCLUSIVE count threshold neighbourhood, saturation/identity,
and impl/spec agreement on the boundary grid.

Pinned source: law 360CO0000000005, revision
360CO0000000005_20250401_507CO0000000006,
sha256 228e54ca458c5192fbb3c1b3a6063d09f3fd66f8c5a6d3958d5389a0d6b38eb1,
Article Num 11, needle
「相続人が二人以上ある場合には、前項の申告書は、各相続人が連署して提出するものとする。」
-/

namespace JapanTaxLaw.JointHeirThreshold2

-- (a) zero and one heirs are not 二人以上.
example : needsJointDeclaration 0 = false := by decide
example : needsJointDeclaration 1 = false := by decide

-- (b) the 二人 (= 2) threshold neighbourhood: 以上 is INCLUSIVE.
example : needsJointDeclaration 2 = true := by decide
example : needsJointDeclaration 3 = true := by decide
example : needsJointDeclaration 10 = true := by decide

-- (c) the pinned statutory count.
example : heirFloor = 2 := by decide

-- (d) named impl theorems used as proofs (theorem-as-proof form).
example : needsJointDeclaration 0 = false := needsJointDeclaration_0
example : needsJointDeclaration 1 = false := needsJointDeclaration_1
example : needsJointDeclaration 2 = true := needsJointDeclaration_2
example : needsJointDeclaration 3 = true := needsJointDeclaration_3
example : heirFloor = 2 := heirFloor_value

-- (e) impl/spec agreement on the boundary grid (kernel-decided Bool).
example : needsJointDeclaration 0 = specJoint 0 := by decide
example : needsJointDeclaration 1 = specJoint 1 := by decide
example : needsJointDeclaration 2 = specJoint 2 := by decide
example : needsJointDeclaration 3 = specJoint 3 := by decide
example : needsJointDeclaration 10 = specJoint 10 := by decide
example (n : Nat) : needsJointDeclaration n = specJoint n := agreeJoint n
example : heirFloor = specFloor := agreeFloor

end JapanTaxLaw.JointHeirThreshold2
