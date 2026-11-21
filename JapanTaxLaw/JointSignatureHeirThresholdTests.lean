import JapanTaxLaw.JointSignatureHeirThreshold
import JapanTaxLaw.JointSignatureHeirThresholdSpec

/-
# JointSignatureHeirThresholdTests — kernel-decided boundary checks for 印紙税法施行令 第十条

All checks are closed Nat/Bool expressions decided by the kernel (`by decide`)
or applications of universal theorems. Coverage: zero, one, the 二人 (= 2)
threshold neighbourhood, small positive inputs, saturation/identity, and
impl/spec agreement on the boundary grid.

Pinned source: law 342CO0000000108, revision 342CO0000000108_20250401_507CO0000000006,
sha256 fcd1097f54737de069b8289eda6e6326e566926b2a03375cb16ad9cc69ace8d1,
Article Num 10, needle「相続人が二人以上ある場合には、前項の申告書は、各相続人が連署して提出するものとする。」
-/

namespace JapanTaxLaw.JointSignatureHeirThreshold

-- (a) zero and one heirs are not 二人以上.
example : jointSignatureRequired 0 = false := by decide
example : jointSignatureRequired 1 = false := by decide

-- (b) the 二人 (= 2) threshold neighbourhood: 以上 is inclusive.
example : jointSignatureRequired 2 = true := by decide
example : jointSignatureRequired 3 = true := by decide
example : jointSignatureRequired 4 = true := by decide

-- (c) small positive inputs and saturation / identity at the threshold.
example : 2 - 2 = 0 := by decide
example : heirThreshold = 2 := by decide
example : jointSignatureRequired 2 = true := by decide

-- (d) the named impl theorems apply at the boundary points.
example : jointSignatureRequired 0 = false := zero_false
example : jointSignatureRequired 1 = false := one_false
example : jointSignatureRequired 2 = true := two_true
example : jointSignatureRequired 3 = true := three_true

-- direct-inequality monotonicity (no `Monotone`), universal.
example {heirs heirs' : Nat} (h : jointSignatureRequired heirs = true)
    (hle : heirs <= heirs') : jointSignatureRequired heirs' = true :=
  jointSignatureRequired_of_le h hle

-- (e) impl/spec agreement on the boundary grid (kernel-decided Bool).
example : jointSignatureRequired 0 = specRequired 0 := by decide
example : jointSignatureRequired 1 = specRequired 1 := by decide
example : jointSignatureRequired 2 = specRequired 2 := by decide
example : jointSignatureRequired 3 = specRequired 3 := by decide
example (x : Nat) : jointSignatureRequired x = specRequired x := agreeRequired x

end JapanTaxLaw.JointSignatureHeirThreshold
