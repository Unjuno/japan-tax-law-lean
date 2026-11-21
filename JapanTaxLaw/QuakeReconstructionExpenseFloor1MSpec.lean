import JapanTaxLaw.QuakeReconstructionExpenseFloor1M

/-
# QuakeReconstructionExpenseFloor1MSpec — independent spec for 東日本大震災特例法 art.38-2(2)(4)イ（百万円以上）

Pinned source:
  Law id: 423AC0000000029
  Revision: 423AC0000000029_20260401_508AC0000000012
  Snapshot: data/raw/423AC0000000029_20260401_508AC0000000012.law.json
  Statutory article: 第三十八条の二(2)(4)イ — 工事費用が百万円以上
  原文逐語: 「当該工事に要した費用の額が百万円以上であること。」
  Normative unit: NORM|894f40b7793d3fa713c8a984bee8ac458702a9b16af5b9a67796ad467c38c776

The implementation states 以上 with the inclusive operator `expenseFloor <= amount`.
This module is an INDEPENDENT formulation: it carries its own statutory constant
and expresses the inclusive bound as the negation of the strict opposite order,
`decide (¬ amount < specExpenseFloor)` — a different operator from `<=`. It
reuses NO implementation definition inside its own `spec*` defs; the universal
`agree_expense_floor` theorem is the only bridge, and the kernel checks it for
every Nat amount.

Not modelled: the gated tax measure, 当該工事/被災者等 definitions, other
subitems/items/paragraphs and enforcement rules.
-/

namespace JapanTaxLaw.QuakeReconstructionExpenseFloor1M

/-- Spec-local statutory value: 百万円 = ¥1,000,000. Independent of impl. -/
def specExpenseFloor : Nat := 1_000_000

/-- Independent formula: 以上 as `¬ amount < floor`. Uses `<`, not `<=`. -/
def specMeetsExpense (amount : Nat) : Bool :=
  decide (¬ amount < specExpenseFloor)

/-- Universal, kernel-checked correspondence for every natural amount. -/
theorem agree_expense_floor (amount : Nat) :
    meetsExpenseFloor amount = specMeetsExpense amount := by
  unfold meetsExpenseFloor expenseFloor specMeetsExpense specExpenseFloor
  by_cases h : 1_000_000 <= amount
  · have hn : ¬ amount < 1_000_000 := by omega
    simp [h, hn]
  · have hn : amount < 1_000_000 := by omega
    simp [h, hn]

/-- Finite spec-local grid (Bool scaffolding); the universal theorem is the proof. -/
def specExpenseGrid : Bool :=
  let f := specExpenseFloor
  [0, 1, f - 1, f, f + 1].all fun amount =>
    specMeetsExpense amount == decide (f <= amount)

example : specExpenseGrid = true := by decide

end JapanTaxLaw.QuakeReconstructionExpenseFloor1M
