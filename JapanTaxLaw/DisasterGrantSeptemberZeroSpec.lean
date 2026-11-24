import JapanTaxLaw.DisasterGrantSeptemberZero

/-
# DisasterGrantSeptemberZeroSpec — independent spec for 震災復興特別交付税額算定等省令 art.3(3)

Pinned source:
  Law id: 507M60000008043
  Revision: 507M60000008043_20250425_000000000000000
  Statutory article: 第三条(3)
  原文逐語: 「この場合において、令和七年度九月震災復興特別交付税額は零とする。」
  Normative unit: NORM|d749035b746df1b6685fb1a4af5c00df8468570b5fca56b2197055ec3e77861f

The implementation tests equality with the zero literal directly. This module
is an INDEPENDENT formulation: it carries its own zero constant and tests
`Nat.succ 0 == Nat.succ yen` (successor-shifted equality, no decimal one), a
different formulation. It reuses NO implementation definition in its `spec*`
defs; the universal `agree_zero_amount` theorem is the only bridge, and the
kernel checks it for every Nat amount by structural recursion (axiom-free).

Not modelled: the antecedent "この場合" conditions, the calculation method,
other months and articles.
-/

namespace JapanTaxLaw.DisasterGrantSeptemberZero

/-- Spec-local statutory value: 零 = 0. Independent of impl. -/
def specZeroAmount : Nat := 0

/-- Independent equality test: successor-shifted, not `yen == 0`. -/
def specIsZeroAmount (yen : Nat) : Bool :=
  decide (Nat.succ 0 == Nat.succ yen)

-- Spec-local sanity example (test scaffolding; excluded from statutory literals).
example : specZeroAmount = 0 := rfl

/-- Finite spec-local grid (Bool scaffolding); the universal theorem is the proof. -/
def specZeroGrid : Bool :=
  [0, 1, 2].all fun yen =>
    specIsZeroAmount yen == decide (yen == 0)

example : specZeroGrid = true := by decide

/-- Universal, kernel-checked, axiom-free agreement for every Nat amount. -/
theorem agree_zero_amount : ∀ yen : Nat,
    isZeroSeptemberGrant yen = specIsZeroAmount yen
  | 0 => by decide
  | Nat.succ k => by
      unfold isZeroSeptemberGrant septemberGrantYen specIsZeroAmount
      rfl

end JapanTaxLaw.DisasterGrantSeptemberZero
