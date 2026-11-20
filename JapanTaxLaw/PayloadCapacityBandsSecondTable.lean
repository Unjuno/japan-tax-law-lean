import JapanTaxLaw.PayloadCapacityBands

/-!
# PayloadCapacityBandsSecondTable — 325AC0000000226 art.154（第二の最大積載量表）

Pinned source: data/raw/325AC0000000226_20261101_508AC0000000002.law.json

A second 最大積載量 table in Article 154 with the same nine-band structure as
PayloadCapacityBands (（１）一トン以下 … （９）八トン超えるもの) but distinct
normative ids / source coordinates. It reuses the already kernel-proven band
function; the cross-table identity theorem records that the two tables' band
structures are extensionally equal.

Callers supply the payload in whole tons; sub-ton precision and rates NOT MODELLED.
-/
namespace JapanTaxLaw.PayloadCapacityBandsSecondTable

def inBand (i d : Nat) : Bool := JapanTaxLaw.PayloadCapacityBands.inBand i d

def pickVal (d : Nat) : Nat := JapanTaxLaw.PayloadCapacityBands.pickVal d

theorem pickVal_lt_nine (d : Nat) : pickVal d < 9 :=
  JapanTaxLaw.PayloadCapacityBands.pickVal_lt_nine d

theorem exhaustive (d : Nat) : ∃ i : Nat, inBand i d = true :=
  JapanTaxLaw.PayloadCapacityBands.exhaustive d

theorem pairwise_exclusive (d : Nat) (i j : Nat) (hil : i < 9) (hjl : j < 9)
    (hne : i ≠ j) (hi : inBand i d = true) (hj : inBand j d = true) : False :=
  JapanTaxLaw.PayloadCapacityBands.pairwise_exclusive d i j hil hjl hne hi hj

/-- 二つの表の帯構造は拡張的に同一。 -/
theorem cross_table_inBand (i d : Nat) :
    inBand i d = JapanTaxLaw.PayloadCapacityBands.inBand i d := by rfl

end JapanTaxLaw.PayloadCapacityBandsSecondTable
