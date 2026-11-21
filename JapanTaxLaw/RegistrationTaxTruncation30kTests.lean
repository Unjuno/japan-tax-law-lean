import JapanTaxLaw.RegistrationTaxTruncation30k
import JapanTaxLaw.RegistrationTaxTruncation30kSpec

/-
# RegistrationTaxTruncation30kTests — 登録免許税法施行令 第二十九条 smoke checks

Pinned source: law 342CO0000000146 / revision 342CO0000000146_20261001_507CO0000000124,
sha256 0fc3f9ca8c85fa0dbafec4de836a9c1cbf7153c01e58f01b25995aa29ec9aa2b,
Article Num 29, needle「登記等につき課されるべき登録免許税の額の三万円未満の端数の部分の登録免許税を納付する場合」.

All checks are kernel-decided Nat facts (`by decide`). Coverage: zero, small
positive inputs, the 三万円 (= 30,000) threshold neighbourhood (below / at /
above), intermediate and exact-multiple saturation, and impl/spec agreement.
The universal proofs live in the implementation and in `agreeTruncate`.
-/

namespace JapanTaxLaw.RegistrationTaxTruncation30k

-- (a) zero and small positive inputs (below 三万円, all truncated to 0).
example : truncUnit = 30_000 := by decide
example : truncate30k 0 = 0 := by decide
example : truncate30k 1 = 0 := by decide
example : truncate30k 2 = 0 := by decide
example : truncate30k 29999 = 0 := by decide

-- (b) the 三万円 (= 30,000) threshold neighbourhood: below / at / above.
example : truncate30k 29999 = 0 := by decide  -- L-1 (below)
example : truncate30k 30000 = 30000 := by decide  -- L (at)
example : truncate30k 30001 = 30000 := by decide  -- L+1 (above)

-- (c) intermediate and exact-multiple saturation points.
example : truncate30k 45000 = 30000 := by decide
example : truncate30k 60000 = 60000 := by decide
example : truncate30k 90001 = 90000 := by decide

-- (d) the named implementation theorems apply at the boundary points.
example : truncate30k 0 = 0 := truncate30k_zero
example : truncate30k 29999 = 0 := truncate30k_29999
example : truncate30k 30000 = 30000 := truncate30k_30000
example : truncate30k 45000 = 30000 := truncate30k_45000
example : truncate30k 60000 = 60000 := truncate30k_60000

-- (e) independent spec: the same boundary points via its own constant.
example : specUnit = 30_000 := by decide
example : specTruncate 0 = 0 := by decide
example : specTruncate 1 = 0 := by decide
example : specTruncate 29999 = 0 := by decide
example : specTruncate 30000 = 30000 := by decide
example : specTruncate 30001 = 30000 := by decide
example : specTruncate 45000 = 30000 := by decide
example : specTruncate 60000 = 60000 := by decide

-- (f) impl/spec agreement at concrete points (kernel-decided Bool grid).
def agreeTruncateGrid : Bool :=
  [0, 1, 2, 29999, 30000, 30001, 45000, 60000, 90001].all fun a =>
    truncate30k a == specTruncate a

example : agreeTruncateGrid = true := by decide

-- (g) the universal axiom-free bridge applied at each boundary point.
example : truncate30k 0 = specTruncate 0 := agreeTruncate 0
example : truncate30k 29999 = specTruncate 29999 := agreeTruncate 29999
example : truncate30k 30000 = specTruncate 30000 := agreeTruncate 30000
example : truncate30k 30001 = specTruncate 30001 := agreeTruncate 30001
example : truncate30k 60000 = specTruncate 60000 := agreeTruncate 60000

end JapanTaxLaw.RegistrationTaxTruncation30k
