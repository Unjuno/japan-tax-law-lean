import JapanTaxLaw.PrescribedPeriodWithinFourMonths

/-
# PrescribedPeriodWithinFourMonthsSpec — independent spec for 不当廉売関税等政令 art.17（四月以内）

Pinned source:
  Law id: 406CO0000000416
  Revision: 406CO0000000416_20260401_508CO0000000085
  Snapshot: data/raw/406CO0000000416_20260401_508CO0000000085.law.json
  Statutory article: 第十七条(1) — 政令で定める期間は四月以内
  原文逐語: 「法第八条第九項に規定する政令で定める期間は、四月以内の期間とする。」
  Normative unit: NORM|037bb6e3fe28f9a5a0fe2cccca2f02f31361d9cab5042c7b8502186955db1cdb

The implementation states 以内 with the inclusive operator `months <= cap`.
This module is an INDEPENDENT formulation: it carries its own statutory constant
and expresses inclusivity as the negation of the strict opposite order,
`decide (¬ cap < months)` — a different operator from `<=`. It reuses NO
implementation definition inside its own `spec*` defs; the universal
`agree_period_cap` theorem is the only bridge, and the kernel checks it for
every Nat month count.

Not modelled: the underlying 法第八条第九項 matter, what the period measures,
other articles and enforcement rules.
-/

namespace JapanTaxLaw.PrescribedPeriodWithinFourMonths

/-- Spec-local statutory value: 四月 = 4 months. Independent of impl. -/
def specMonthCap : Nat := 4

/-- Independent formula: 以内 as `¬ cap < months`. Uses `<`, not `<=`. -/
def specWithinPeriod (months : Nat) : Bool :=
  decide (¬ specMonthCap < months)

/-- Universal, kernel-checked correspondence for every Nat month count. -/
theorem agree_period_cap : ∀ months : Nat,
    withinPrescribedPeriod months = specWithinPeriod months
  | 0 => by decide
  | Nat.succ 0 => by decide
  | Nat.succ (Nat.succ 0) => by decide
  | Nat.succ (Nat.succ (Nat.succ 0)) => by decide
  | Nat.succ (Nat.succ (Nat.succ (Nat.succ 0))) => by decide
  | Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ k)))) => by
      unfold withinPrescribedPeriod periodMonthCap specWithinPeriod specMonthCap
      rfl

-- Spec-local sanity example (test scaffolding; excluded from statutory literals).
example : specMonthCap = 4 := rfl

/-- Finite spec-local grid (Bool scaffolding); the universal theorem is the proof. -/
def specMonthGrid : Bool :=
  let c := specMonthCap
  [0, 1, c - 1, c, c + 1].all fun months =>
    specWithinPeriod months == decide (months <= c)

example : specMonthGrid = true := by decide

end JapanTaxLaw.PrescribedPeriodWithinFourMonths
