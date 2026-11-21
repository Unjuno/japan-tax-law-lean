import JapanTaxLaw.IncomeRegPaymentCeiling1M

/-
# IncomeRegPaymentCeiling1MSpec — independent spec for 所得税法施行規則 art.87(3)(2)（百万円以下）

Pinned source:
  Law id: 340M50000040011
  Revision: 340M50000040011_20261001_507M60000040018
  Snapshot: data/raw/340M50000040011_20261001_507M60000040018.law.json
  Statutory article: 第八十七条(3)(2) — 満期返戻金等の支払金額が百万円以下
  原文逐語: 「同一人に対するその年中の満期返戻金等の支払金額が百万円以下である場合」
  Normative unit: NORM|527ed759ab3fbc4580c09c7b5631fa02674c97e617ae168ed0d0e85a313df13a

The implementation states 以下 with the inclusive operator `amount <= ceiling`.
This module is an INDEPENDENT formulation: it carries its own statutory constant
and expresses the inclusive bound as the negation of the strict opposite order,
`decide (¬ specCeiling < amount)` — a different operator from `<=`. It reuses
NO implementation definition inside its own `spec*` defs; the universal
`agree_payment_ceiling` theorem is the only bridge, and the kernel checks it for
every Nat amount.

Not modelled: the classification of 満期返戻金等, the reporting obligation this
condition gates, 同一人 identity, other items/paragraphs and enforcement rules.
-/

namespace JapanTaxLaw.IncomeRegPaymentCeiling1M

/-- Spec-local statutory value: 百万円 = ¥1,000,000. Independent of impl. -/
def specPaymentCeiling : Nat := 1_000_000

/-- Independent formula: 以下 as `¬ ceiling < amount`. Uses `<`, not `<=`. -/
def specWithinPayment (amount : Nat) : Bool :=
  decide (¬ specPaymentCeiling < amount)

/-- Universal, kernel-checked correspondence for every natural amount. -/
theorem agree_payment_ceiling (amount : Nat) :
    withinPaymentCeiling amount = specWithinPayment amount := by
  unfold withinPaymentCeiling paymentCeiling specWithinPayment specPaymentCeiling
  by_cases h : amount <= 1_000_000
  · have hn : ¬ 1_000_000 < amount := by omega
    simp [h, hn]
  · have hn : 1_000_000 < amount := by omega
    simp [h, hn]

/-- Finite spec-local grid (Bool scaffolding); the universal theorem is the proof. -/
def specPaymentGrid : Bool :=
  let c := specPaymentCeiling
  [0, 1, c - 1, c, c + 1].all fun amount =>
    specWithinPayment amount == decide (amount <= c)

example : specPaymentGrid = true := by decide

end JapanTaxLaw.IncomeRegPaymentCeiling1M
