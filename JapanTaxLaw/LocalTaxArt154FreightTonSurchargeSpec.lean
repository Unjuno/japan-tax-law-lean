import JapanTaxLaw.LocalTaxArt154FreightTonSurcharge

/-!
# LocalTaxArt154FreightTonSurchargeSpec — independent spec for 地方税法 第百五十四条(1)

Law id: 325AC0000000226 (地方税法, Act), revision 325AC0000000226_20261101_508AC0000000002
Article: 第百五十四条(1) freight-vehicle 標準税率 — base 四万五百 (40,500) plus
         六千三百 (6,300) per started ton over 八トン (8 tons).
Normative unit: NORM|cdd69708e364f7ffe3fc19e940a20601214602b741a034108754d57b296a45d0

The implementation computes the ceiling as `(excess + 999)/1000`. The independent
spec uses the alternative ceiling `(excess - 1)/1000 + 1` — a distinct arithmetic
formulation. Kernel proves universal agreement axiom-free via a ceil-division lemma.

「一トンまでごとに」 = per started ton → round up fractional tons. loadKg is whole
kilograms (unit contract in implementation). Fractional kg are NOT MODELLED.

Not modelled: other table cells, other paragraphs/articles, legal correctness.
-/

namespace JapanTaxLaw.LocalTaxArt154FreightTonSurcharge

open JapanTaxLaw.TaxFinance

/-- Independent spec: alternative ceiling form (excess-1)/1000+1 for positive excess. -/
def specChargeableTons (loadKg : Nat) : Nat :=
  if loadKg <= thresholdKg then 0
  else (loadKg - thresholdKg - 1) / kgPerTon + 1

/-- Ceil-division identity, kernel-proved without omega (only permitted [propext]). -/
theorem ceil_div_identity (d : Nat) (h : 0 < d) :
    (d + 999) / 1000 = (d - 1) / 1000 + 1 := by
  have h1 : 1 ≤ d := Nat.succ_le_of_lt h
  have hd1 : d - 1 + 1 = d := Nat.sub_add_cancel h1
  have heq : d - 1 + 1000 * 1 = d + 999 := by
    calc
      d - 1 + 1000 * 1 = d - 1 + (1 + 999) := by rfl
      _ = (d - 1 + 1) + 999 := by rw [← Nat.add_assoc]
      _ = d + 999 := by rw [hd1]
  rw [← heq]
  rw [Nat.add_mul_div_left]
  decide

/-- Universal agreement between implementation and independent spec. Axiom-free. -/
theorem agree_chargeable_tons (loadKg : Nat) :
    chargeableTons loadKg = specChargeableTons loadKg := by
  unfold chargeableTons specChargeableTons
  by_cases hle : loadKg <= thresholdKg
  · simp [hle]
  · simp [hle]
    have hlt : thresholdKg < loadKg := Nat.lt_of_not_ge hle
    have hd : 0 < loadKg - thresholdKg := Nat.sub_pos_of_lt hlt
    change (loadKg - thresholdKg + 1000 - 1) / 1000 =
      (loadKg - thresholdKg - 1) / 1000 + 1
    have hnum : loadKg - thresholdKg + 1000 - 1 = loadKg - thresholdKg + 999 := by
      rw [Nat.add_sub_assoc (by decide : 1 ≤ 1000)]
    rw [hnum]
    exact ceil_div_identity (loadKg - thresholdKg) hd

end JapanTaxLaw.LocalTaxArt154FreightTonSurcharge
