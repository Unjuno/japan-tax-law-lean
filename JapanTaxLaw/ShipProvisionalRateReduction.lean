import JapanTaxLaw.TaxFinance

/-
# ShipProvisionalRateReduction — 登録免許税法 art.17(2)（船舶仮登記の税率減額）

Pinned: law 342AC0000000035, revision 342AC0000000035_20261101_508AC0000000021,
raw `data/raw/342AC0000000035_20261101_508AC0000000021.law.json`, Article 17 §2.

原文逐語: 「同号（二）の税率欄に掲げる割合から千分の四を控除した割合とする。」

Variables: `basePerMille : Nat` = 別表第一第二号（二）の税率欄の割合 (千分率).
`reducedRate base = base - 4` (Nat saturating; unit 千分率, domain Nat).
The table's own rate (4/1000) is established from `RegistryShipFees`; the
deduction arithmetic here is the scoped norm.

Scope: ONLY the per-mille subtraction. Provisional-registration identification,
the tax base and other paragraphs of art.17 are NOT MODELLED.
No `sorry`, `admit`, `axiom`, no `Classical.choice`.
-/
namespace JapanTaxLaw.ShipProvisionalRateReduction

def reductionPerMille : Nat := 4

def reducedRate (basePerMille : Nat) : Nat :=
  basePerMille - reductionPerMille

theorem neverExceedsBase (basePerMille : Nat) :
    reducedRate basePerMille <= basePerMille := by
  unfold reducedRate
  omega

theorem zeroWhenBaseAtMostReduction (basePerMille : Nat) :
    basePerMille <= reductionPerMille → reducedRate basePerMille = 0 := by
  unfold reducedRate
  intro h
  omega

theorem monotoneInBase (base base' : Nat) :
    base <= base' → reducedRate base <= reducedRate base' := by
  unfold reducedRate
  intro h
  omega

end JapanTaxLaw.ShipProvisionalRateReduction
