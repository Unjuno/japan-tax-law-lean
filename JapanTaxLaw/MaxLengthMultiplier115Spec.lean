import JapanTaxLaw.MaxLengthMultiplier115

/-
# MaxLengthMultiplier115Spec — independent spec for 登録免許税法施行令 第二十一条

Pinned source:
  Law id: 342CO0000000146
  Revision: 342CO0000000146_20261001_507CO0000000124
  Raw snapshot: data/raw/342CO0000000146_20261001_507CO0000000124.law.json
  sha256: 0fc3f9ca8c85fa0dbafec4de836a9c1cbf7153c01e58f01b25995aa29ec9aa2b
  Statutory article: 第二十一条 (art. 21; raw JSON Article attr.Num = "21", Item 二).
  原文逐語: 「最大船長（製造又は修繕をすることができる船舶の長さの最大値をいう。以下この号において同じ。）が、拡張許可前の当該設備における最大船長の一・一五倍を超えることとならないものであること」

INDEPENDENT FORMULATION. This module owns its own statutory constants
`specNum : Nat := 115` and `specDen : Nat := 100` (一・一五 = 115/100) and
deliberately reverses the operands of the cross-multiplication:
  impl: 100 * after <= 115 * before
  spec: after * specDen <= before * specNum, i.e. after * 100 <= before * 115
No implementation identifier (multiplierNumer / multiplierDenom /
withinLengthLimit) occurs in any independent formula. The only bridge is the
universal, kernel-checked theorem agreeWithin below, proved by a pure
Nat.mul_comm rewrite: no by_cases, no omega, no Classical.choice, no quotient.
Out of scope, as in the impl: the 最大トン数 一・六倍 sibling Item 一, the
definition of 拡張許可, and all other provisions.
-/

namespace JapanTaxLaw.MaxLengthMultiplier115

/-- Independent 一・一五 numerator = 115. -/
def specNum : Nat := 115

/-- Independent 一・一五 denominator = 100. -/
def specDen : Nat := 100

/-- Independent exact relation, operands reversed vs the impl:
    `after * 100 <= before * 115` (vs impl `100 * after <= 115 * before`). -/
def specWithin (after before : Nat) : Bool :=
  decide (after * specDen <= before * specNum)

/-- Universal bridge: commutativity of Nat multiplication is the ONLY bridge.
    Pure rewrite: no by_cases, no omega, no Classical.choice. -/
theorem agreeWithin (after before : Nat) :
    withinLengthLimit after before = specWithin after before := by
  unfold withinLengthLimit specWithin specNum specDen
  rw [Nat.mul_comm 100 after, Nat.mul_comm 115 before]

-- Spec-local, kernel-decided spot checks (scaffolding, not the statutory formula).
example : specNum = 115 := by decide
example : specDen = 100 := by decide
example : specWithin 115 100 = true := by decide
example : specWithin 116 100 = false := by decide
example : specWithin 114 100 = true := by decide
example : specWithin 0 0 = true := by decide
example : specWithin 1 0 = false := by decide

end JapanTaxLaw.MaxLengthMultiplier115
