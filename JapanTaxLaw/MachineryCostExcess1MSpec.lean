import JapanTaxLaw.MachineryCostExcess1M

/-
# MachineryCostExcess1MSpec — independent spec for 沖縄振興省令 art.4(1)(3)ロ（百万円超）

Pinned source:
  Law id: 414M60000008042
  Revision: 414M60000008042_20250401_507M60000008028
  Snapshot: data/raw/414M60000008042_20250401_507M60000008028.law.json
  Statutory article: 第四条(1)(3)ロ — 機械及び装置の取得価額合計が百万円を超える
  原文逐語: 「イに掲げるもののほか、機械及び装置で、これらの取得価額の合計額が百万円を超えるもの」
  Normative unit: NORM|c04fbcd7afdfbd2789ed292aed888fce9110f73ce74c9c5ced62c87e82924d41

The implementation states 超える with the strict operator `costFloor < total`.
This module is an INDEPENDENT formulation: it carries its own statutory constant
and expresses strict excess with a successor-based non-strict bound,
`decide (Nat.succ specCostFloor <= total)` — a different operator from `<`.
It reuses NO implementation definition inside its own `spec*` defs; the
universal `agree_cost_floor` theorem is the only bridge, and the kernel checks
it for every Nat total.

Not modelled: the イ category, the gated tax exemption, 機械及び装置 definitions,
other items/subitems and enforcement rules.
-/

namespace JapanTaxLaw.MachineryCostExcess1M

/-- Spec-local statutory value: 百万円 = ¥1,000,000. Independent of impl. -/
def specCostFloor : Nat := 1_000_000

/-- Independent formula: strict 超える as `succ floor <= total`. Uses `<=`, not `<`. -/
def specExceedsCost (total : Nat) : Bool :=
  decide (Nat.succ specCostFloor <= total)

/-- Universal, kernel-checked correspondence for every natural total. -/
theorem agree_cost_floor (total : Nat) :
    exceedsCostFloor total = specExceedsCost total := by
  unfold exceedsCostFloor costFloor specExceedsCost specCostFloor
  by_cases h : 1_000_000 < total
  · have hs : Nat.succ 1_000_000 <= total := by omega
    simp [h, hs]
  · have hs : ¬ Nat.succ 1_000_000 <= total := by omega
    simp [h, hs]

/-- Finite spec-local grid (Bool scaffolding); the universal theorem is the proof. -/
def specCostGrid : Bool :=
  let f := specCostFloor
  [0, 1, f - 1, f, f + 1].all fun total =>
    specExceedsCost total == decide (f < total)

example : specCostGrid = true := by decide

end JapanTaxLaw.MachineryCostExcess1M
