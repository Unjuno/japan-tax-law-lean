import JapanTaxLaw.TaxFinance

/-!
# PenaltyCaps — 205 の pinned 罰則上限規定 (23 distinct caps)

Each pinned unit states an upper bound: 「X円以下の罰金/過料に処する」 and
optionally 「Y年以下の拘禁刑」. This model records the exact (fine, years) pair.
The constituent offense elements, 併科 and 裁判上の判断 are caller-established
and NOT MODELLED. Not legal advice.
-/

namespace JapanTaxLaw.PenaltyCaps

inductive PenaltyKind where
  | p00
  | p01
  | p02
  | p03
  | p04
  | p05
  | p06
  | p07
  | p08
  | p09
  | p10
  | p11
  | p12
  | p13
  | p14
  | p15
  | p16
  | p17
  | p18
  | p19
  | p20
  | p21
  | p22
deriving DecidableEq, Repr

/-- 実装: (罰金/過料上限円, 拘禁刑上限年) の対。 -/
def fineOf : PenaltyKind → Nat × Nat
  | PenaltyKind.p00 => (300000, 0)
  | PenaltyKind.p01 => (300000, 1)
  | PenaltyKind.p02 => (30000000, 5)
  | PenaltyKind.p03 => (3000000, 5)
  | PenaltyKind.p04 => (200000, 0)
  | PenaltyKind.p05 => (200000, 0)
  | PenaltyKind.p06 => (2000000, 1)
  | PenaltyKind.p07 => (2000000, 10)
  | PenaltyKind.p08 => (50000, 0)
  | PenaltyKind.p09 => (500000, 0)
  | PenaltyKind.p10 => (500000, 1)
  | PenaltyKind.p11 => (500000, 3)
  | PenaltyKind.p12 => (5000000, 3)
  | PenaltyKind.p13 => (5000000, 5)
  | PenaltyKind.p14 => (100000, 0)
  | PenaltyKind.p15 => (10000000, 5)
  | PenaltyKind.p16 => (10000000, 10)
  | PenaltyKind.p17 => (1000000, 0)
  | PenaltyKind.p18 => (1000000, 1)
  | PenaltyKind.p19 => (1000000, 3)
  | PenaltyKind.p20 => (1000000, 2)
  | PenaltyKind.p21 => (1000000, 5)
  | PenaltyKind.p22 => (1000000, 10)

theorem kindExists : Nonempty PenaltyKind := ⟨PenaltyKind.p00⟩

end JapanTaxLaw.PenaltyCaps
