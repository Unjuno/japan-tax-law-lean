import JapanTaxLaw.TaxFinance

/-
# LocalTax448FourWheelUp — pinned clause 「ハ　四輪以上のもの」

Pinned: law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002, article 448.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json. Normative unit: NORM|0abae19216f13a5942f23c3c0b706387685b8125ed0e00702643f827a91e6617.
原文逐語: 「ハ　四輪以上のもの」
Scope: ONLY the threshold/tier interval of this clause. Rates, other tiers,
the underlying computation and other articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax448FourWheelUp

open JapanTaxLaw.TaxFinance

/-- 四輪 — 以上（inclusive） threshold (four wheels). -/
def threshold : Nat := 4

/-- 「ハ　四輪以上のもの」. -/
def inScope (amount : Nat) : Prop := amount ≥ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (amount : Nat) : Bool := decide (amount ≥ 4)

end JapanTaxLaw.LocalTax448FourWheelUp
