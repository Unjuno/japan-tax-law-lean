import JapanTaxLaw.CapitalOneBillionExcess

/-
# CapitalOneBillionExcessSpec — independent spec for 国税臨時特例法 art.7(1)(1)（十億円超）

Pinned source:
  Law id: 502AC0000000025
  Revision: 502AC0000000025_20260401_508AC0000000012
  Raw snapshot: data/raw/502AC0000000025_20260401_508AC0000000012.law.json
  Statutory article: 第七条(1)(1) — 資本金の額又は出資金の額が十億円を超える法人
  原文逐語: 「資本金の額又は出資金の額が十億円を超える法人」
  Normative unit: NORM|3b1013fc326dbfcb98839b2a2a363fb2569d565af04514f05fe362ce89d7d027

The implementation states 超える with the strict operator `<` under `decide`.
This module is an INDEPENDENT formulation: it carries its own statutory constant
and expresses strict excess with a successor-based non-strict bound,
`decide (Nat.succ specCapitalBillionFloor <= amount)` — a different operator
from `<`. It reuses NO implementation definition inside its own `spec*` defs;
the universal `agree_capital_billion` theorem is the only bridge to the
implementation, and the kernel checks it for every Nat amount. The finite grid
is spec-local scaffolding, not the formula.

Not modelled: the rest of art. 7, the special measure this condition gates,
other items, referenced laws and all enforcement/operational rules.
-/

namespace JapanTaxLaw.CapitalOneBillionExcess

/-- Spec-local statutory value: 十億円 = ¥1,000,000,000. Independent of impl. -/
def specCapitalBillionFloor : Nat := 1_000_000_000

/-- Independent formula: strict 超える as `succ floor <= amount`. Uses `<=`, not `<`. -/
def specExceedsCapital (amount : Nat) : Bool :=
  decide (Nat.succ specCapitalBillionFloor <= amount)

/-- Universal, kernel-checked correspondence for every natural amount. -/
theorem agree_capital_billion (amount : Nat) :
    exceedsCapitalBillion amount = specExceedsCapital amount := by
  unfold exceedsCapitalBillion capitalBillionFloor specExceedsCapital specCapitalBillionFloor
  by_cases h : 1_000_000_000 < amount
  · have hs : Nat.succ 1_000_000_000 <= amount := by omega
    simp [h, hs]
  · have hs : ¬ Nat.succ 1_000_000_000 <= amount := by omega
    simp [h, hs]

/-- Finite spec-local grid (Bool scaffolding); the universal theorem is the proof. -/
def specCapitalGrid : Bool :=
  let f := specCapitalBillionFloor
  [0, 1, f - 1, f, f + 1].all fun amount =>
    specExceedsCapital amount == decide (f < amount)

example : specCapitalGrid = true := by decide

end JapanTaxLaw.CapitalOneBillionExcess
