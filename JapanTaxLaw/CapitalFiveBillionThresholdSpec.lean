import JapanTaxLaw.CapitalFiveBillionThreshold

/-
# CapitalFiveBillionThresholdSpec — independent spec for 省令 第二条 (五十億円以上)

Pinned source:
  Law id: 352M50000040032
  Revision: 352M50000040032_20220710_504M60000040044
  Raw snapshot: data/raw/352M50000040032_20220710_504M60000040044.law.json
  Statutory article: 第二条 (art. 2)
  原文逐語: 「当該法人の資本金額又は出資金額が五十億円以上であること」

The implementation states 以上 with the inclusive operator `capitalFloor <= amount`.
This module is an INDEPENDENT formulation: it carries its own statutory constant
and expresses the bound with the strict order plus negation,
`decide (¬ amount < specCapitalFloor)` — a different operator from `<=`.
It reuses NO implementation definition; the universal `agreeCapitalFloor`
theorem is the only bridge to the implementation, and the kernel checks it for
every Nat amount. The finite grid is spec-local scaffolding, not the formula.

Not modelled: the rest of the 第二条 table, the duties assigned to officials,
other articles, and all enforcement/operational rules.
-/

namespace JapanTaxLaw.CapitalFiveBillionThreshold

/-- Spec-local statutory value: 五十億円 = ¥5,000,000,000. Independent of impl. -/
def specCapitalFloor : Nat := 5_000_000_000

/-- Independent formula: 五十億円以上 as not (amount < floor). Uses `<`, not `<=`. -/
def specAtLeast (amount : Nat) : Bool :=
  decide (¬ amount < specCapitalFloor)

/-- Universal, kernel-checked correspondence for every natural amount. -/
theorem agreeCapitalFloor (amount : Nat) :
    atLeastCapitalFloor amount = specAtLeast amount := by
  unfold atLeastCapitalFloor capitalFloor specAtLeast specCapitalFloor
  by_cases h : 5_000_000_000 <= amount
  · have hnot : ¬ amount < 5_000_000_000 := by omega
    simp [h, hnot]
  · have hlt : amount < 5_000_000_000 := by omega
    simp [h, hlt]

/-- Finite spec-local grid (Bool scaffolding); the universal theorem is the proof. -/
def specCapitalFloorGrid : Bool :=
  let f := specCapitalFloor
  [0, 1, f - 1, f, f + 1].all fun amount =>
    specAtLeast amount == decide (specCapitalFloor <= amount)

example : specCapitalFloorGrid = true := by decide

end JapanTaxLaw.CapitalFiveBillionThreshold
