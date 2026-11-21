import JapanTaxLaw.LocalTaxArt21Penalty

/-!
# LocalTaxArt21PenaltySpec — independent spec for 地方税法 第二十一条(1)（罰則）

Law id: 325AC0000000226 (地方税法, Act)
Revision: 325AC0000000226_20261101_508AC0000000002
Article: 第二十一条(1) — 三年以下の拘禁刑又は二十万円以下の罰金
Normative unit: NORM|c44267260dc35641899361b7ab7e63e06f22ace473bef4c3a81b22a33b50fd14

The implementation uses a Bool `withinLimits` over an inductive `Penalty`
(拘禁刑 months / 罰金 yen), treating them as alternatives. The independent spec
uses a Prop formulation with explicit successor-based strict bounds:
  - imprisonment: m < Nat.succ maxImprisonmentMonths  (equiv. m ≤ 36)
  - fine: y < Nat.succ maxFineYen  (equiv. y ≤ 200,000)
This is a distinct formulation (Prop vs Bool, strict-successor vs ≤). The kernel
proves the Bool/Prop correspondence for all penalties.

Boundary values: 36 months / 200,000 yen qualify (以下 = inclusive); 37 months /
200,001 yen fail.

Not modelled: the violation condition (動いた者), substantive rule, other
paragraphs and other articles.
-/

namespace JapanTaxLaw.LocalTaxArt21Penalty

open JapanTaxLaw.TaxFinance

/-- Independent Prop spec: successor-based strict form of each inclusive ceiling. -/
def specWithinLimits : Penalty -> Prop
  | Penalty.imprisonment m => m < Nat.succ maxImprisonmentMonths
  | Penalty.fine y => y < Nat.succ maxFineYen

/-- Bool implementation and Prop spec agree for all penalties. Universal. -/
theorem agree_within_limits (p : Penalty) : withinLimits p = true ↔ specWithinLimits p := by
  cases p with
  | imprisonment m =>
      simp [withinLimits, specWithinLimits, Nat.lt_succ_iff]
  | fine y =>
      simp [withinLimits, specWithinLimits, Nat.lt_succ_iff]

end JapanTaxLaw.LocalTaxArt21Penalty
