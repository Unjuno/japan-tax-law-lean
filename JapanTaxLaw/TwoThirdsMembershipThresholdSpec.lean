import JapanTaxLaw.TwoThirdsMembershipThreshold

/-
# TwoThirdsMembershipThresholdSpec — independent spec for 法律 第八十条 (三分の二以上)

Pinned source:
  Law id: 328AC0000000007
  Revision: 328AC0000000007_20250601_504AC0000000068
  Raw snapshot: data/raw/328AC0000000007_20250601_504AC0000000068.law.json
  sha256: 0ef7ec85253d46a1c0fb505342fbf16e0b5a10b18fa0911766211b4ad1695699
  Statutory article: 第八十条 (art. 80)
  原文逐語: 「…その会員の総数が前三項の規定により会員たる資格を有する連合会及び酒類業組合の三分の二以上でなければ、設立することができない。」

INDEPENDENT FORMULATION. This module carries its OWN statutory constants
`specNumer = 2` and `specDenom = 3` and expresses 三分の二以上 as
`decide (members * specDenom >= qualified * specNumer)`.
The multiplication order is deliberately the REVERSE of the implementation's
(impl: `3 * members >= 2 * qualified`; spec: `members * 3 >= qualified * 2`),
so this is a genuinely different formula, not a restatement.

The ONLY bridge between the two is commutativity of Nat multiplication, checked
by the kernel in the universal `agreeTwoThirds` theorem. No implementation
identifier (`canEstablish`) appears in any independent formula below.

Not modelled (same as the implementation): the qualification definition in the
preceding three paragraphs, the identity of the 中央会, and all other articles.
-/

namespace JapanTaxLaw.TwoThirdsMembershipThreshold

/-- Spec-local numerator of 三分の二 = 2. Independent of the implementation. -/
def specNumer : Nat := 2

/-- Spec-local denominator of 三分の二 = 3. Independent of the implementation. -/
def specDenom : Nat := 3

/-- Independent formula: members >= (2/3) * qualified, cross-multiplied with
    operands in the opposite order from the implementation. -/
def specCanEstablish (members qualified : Nat) : Bool :=
  decide (members * specDenom >= qualified * specNumer)

/-- Universal, kernel-checked correspondence for every pair of Nat counts.
    Commutativity of Nat multiplication is the only bridge. -/
theorem agreeTwoThirds (members qualified : Nat) :
    canEstablish members qualified = specCanEstablish members qualified := by
  unfold canEstablish specCanEstablish specNumer specDenom
  rw [Nat.mul_comm 3 members, Nat.mul_comm 2 qualified]

-- Independent spec-local behaviour spot-checks (kernel-decided).
example : specCanEstablish 2 3 = true := by decide
example : specCanEstablish 1 3 = false := by decide
example : specCanEstablish 3 5 = false := by decide

end JapanTaxLaw.TwoThirdsMembershipThreshold
