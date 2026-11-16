import JapanTaxLaw.SpecialGiftRate

/-!
# SpecialGiftRateDomination — 租税特別措置法 art. 70の2の5(1) 特別表 ≤ 相続税法 art. 21-7 一般表（普遍）

Sources (pinned; identical to `SpecialGiftRate.lean`):

  Law id: 332AC0000000026（租税特別措置法）
  Revision: 332AC0000000026_20261101_507AC0000000013
  Amendment enforcement date: 2026-11-01
  Raw snapshot sha256: E6E6013BBC0608C6B48DEA01D50AC847C3E5D094F0420223171FFE1B5CF8D5EE
  (data/raw/332AC0000000026_20261101_507AC0000000013.law.json,
   revision CurrentEnforced per data/INVENTORY.json)

  Law id: 325AC0000000073（相続税法）
  Revision: 325AC0000000073_20260401_506AC0000000008
  Amendment enforcement date: 2026-04-01
  Raw snapshot sha256: C01BB9BE910CE849C82E26F1DD5D262DDF5BB55A1BF042512451460F275043A7
  (data/raw/325AC0000000073_20260401_506AC0000000008.law.json,
   revision CurrentEnforced per data/INVENTORY.json)

**Claim (universal, proven):** for every taxable gift value `x` (`Money` = `Nat`),
`specialGiftPortionTax x ≤ giftPortionTax x`.

This is the Phase E universal "special table never costs more than the general table"
fact. An earlier attempt routed through `grind`, which closes the goal but produces
proof terms depending on `Classical.choice` — forbidden by this repository's CI axiom
gate. `omega` alone could not handle the fully-unfolded polynomials under the
`Money`-typed elaboration. The proof below re-states both tables as plain `Nat`
polynomials (`spn` / `gpn`), decomposes the domain at the eight distinct band edges
(2M/3M/4M/6M/10M/15M/30M/45M), eliminates every `min x T` atom per interval, and
closes each of the **9 interval cases** with `omega`. Every `min`-elimination,
normalization `simp`, and `omega` call uses only kernel steps; no `grind`,
no `sorry`, no `admit`, no custom axioms.

Proof structure (in `special_le_general`):

* `spn x` / `gpn x` — flat `Nat` definitions equal (definitionally) to
  `specialGiftPortionTax x` / `giftPortionTax x` via `specialGiftPortionTax_eq_spn` /
  `giftPortionTax_eq_gpn` (proveable by `unfold` + `rfl`, both are definitional equalities
  over concrete rate tables).
* `z0` — `min x 0 = 0`.
* Nine `by_cases` interval branches, partially-ordered min-rewrites to constants or `x`,
  `simp only` to zero-out band terms, and `omega` to discharge the residual linear Nat
  polynomial.

## Honest scope

* The theorems talk about the **models**: the tables were transcribed from the pinned raw
  bytes into `SpecialGiftRate.lean` / `GiftTax.lean`; the transcription is spot-checked by
  decide examples and the transcription audit, not independently legally verified.
* Nothing here is a legal interpretation; the art. 70の2の5(1) eligibility gate
  (lineal descendant ∧ recipient ≥ 18 on Jan 1) and the interaction with other provisions
  are out of scope of this module.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- The special (直系尊属から贈与を受けた場合の贈与税率) table as a flat Nat polynomial.
    Band limits (円): 2M / 4M / 6M / 10M / 15M / 30M / 45M, then 55%. -/
def spn (x : Nat) : Nat :=
  (min x 2_000_000 - min x 0) * 10 / 100 +
    ((min x 4_000_000 - min x 2_000_000) * 15 / 100 +
      ((min x 6_000_000 - min x 4_000_000) * 20 / 100 +
        ((min x 10_000_000 - min x 6_000_000) * 30 / 100 +
          ((min x 15_000_000 - min x 10_000_000) * 40 / 100 +
            ((min x 30_000_000 - min x 15_000_000) * 45 / 100 +
              ((min x 45_000_000 - min x 30_000_000) * 50 / 100 +
                (x - 45_000_000) * 55 / 100))))))

/-- The general (暦年贈与) table as a flat Nat polynomial.
    Band limits (円): 2M / 3M / 4M / 6M / 10M / 15M / 30M, then 55%. -/
def gpn (x : Nat) : Nat :=
  (min x 2_000_000 - min x 0) * 10 / 100 +
    ((min x 3_000_000 - min x 2_000_000) * 15 / 100 +
      ((min x 4_000_000 - min x 3_000_000) * 20 / 100 +
        ((min x 6_000_000 - min x 4_000_000) * 30 / 100 +
          ((min x 10_000_000 - min x 6_000_000) * 40 / 100 +
            ((min x 15_000_000 - min x 10_000_000) * 45 / 100 +
              ((min x 30_000_000 - min x 15_000_000) * 50 / 100 +
                (x - 30_000_000) * 55 / 100))))))

/-- The model's special table equals the flat polynomial `spn` (definitional equality). -/
theorem specialGiftPortionTax_eq_spn (x : Money) : specialGiftPortionTax x = spn x := by
  unfold specialGiftPortionTax spn
  rw [specialGiftRateTable]
  rfl

/-- The model's general table equals the flat polynomial `gpn` (definitional equality). -/
theorem giftPortionTax_eq_gpn (x : Money) : giftPortionTax x = gpn x := by rfl

set_option maxRecDepth 8192 in
/-- **The universal domination theorem.** For every `x : Nat`, `spn x ≤ gpn x`;
    instantiated over `Money` this gives `specialGiftPortionTax x ≤ giftPortionTax x`
    (`spgn_universal`). Proved by interval decomposition at the band edges; every case
    is closed by `omega`. No `grind`, no `sorry`, no `admit`, no custom axioms. -/
theorem spn_le_gpn (x : Nat) : spn x ≤ gpn x := by
  unfold spn gpn
  have z0 : min x 0 = 0 := Nat.min_eq_right (Nat.zero_le x)
  by_cases h : x ≤ 2_000_000
  ·
    rw [z0]
    rw [Nat.min_eq_left (by omega : x ≤ 2_000_000)]
    rw [Nat.min_eq_left (by omega : x ≤ 3_000_000)]
    rw [Nat.min_eq_left (by omega : x ≤ 4_000_000)]
    rw [Nat.min_eq_left (by omega : x ≤ 6_000_000)]
    rw [Nat.min_eq_left (by omega : x ≤ 10_000_000)]
    rw [Nat.min_eq_left (by omega : x ≤ 15_000_000)]
    rw [Nat.min_eq_left (by omega : x ≤ 30_000_000)]
    rw [Nat.min_eq_left (by omega : x ≤ 45_000_000)]
    simp only [Nat.sub_self, Nat.zero_mul, Nat.zero_div]
    omega
  ·
    by_cases h : x ≤ 3_000_000
    ·
      rw [z0]
      rw [Nat.min_eq_right (by omega : x ≥ 2_000_000)]
      rw [Nat.min_eq_left (by omega : x ≤ 3_000_000)]
      rw [Nat.min_eq_left (by omega : x ≤ 4_000_000)]
      rw [Nat.min_eq_left (by omega : x ≤ 6_000_000)]
      rw [Nat.min_eq_left (by omega : x ≤ 10_000_000)]
      rw [Nat.min_eq_left (by omega : x ≤ 15_000_000)]
      rw [Nat.min_eq_left (by omega : x ≤ 30_000_000)]
      rw [Nat.min_eq_left (by omega : x ≤ 45_000_000)]
      simp only [Nat.sub_self, Nat.zero_mul, Nat.zero_div, Nat.mul_zero, Nat.div_zero, Nat.sub_zero]
      omega
    ·
      by_cases h : x ≤ 4_000_000
      ·
        rw [z0]
        rw [Nat.min_eq_right (by omega : x ≥ 2_000_000)]
        rw [Nat.min_eq_right (by omega : x ≥ 3_000_000)]
        rw [Nat.min_eq_left (by omega : x ≤ 4_000_000)]
        rw [Nat.min_eq_left (by omega : x ≤ 6_000_000)]
        rw [Nat.min_eq_left (by omega : x ≤ 10_000_000)]
        rw [Nat.min_eq_left (by omega : x ≤ 15_000_000)]
        rw [Nat.min_eq_left (by omega : x ≤ 30_000_000)]
        rw [Nat.min_eq_left (by omega : x ≤ 45_000_000)]
        simp only [Nat.sub_self, Nat.zero_mul, Nat.zero_div, Nat.mul_zero, Nat.div_zero, Nat.sub_zero]
        omega
      ·
        by_cases h : x ≤ 6_000_000
        ·
          rw [z0]
          rw [Nat.min_eq_right (by omega : x ≥ 2_000_000)]
          rw [Nat.min_eq_right (by omega : x ≥ 3_000_000)]
          rw [Nat.min_eq_right (by omega : x ≥ 4_000_000)]
          rw [Nat.min_eq_left (by omega : x ≤ 6_000_000)]
          rw [Nat.min_eq_left (by omega : x ≤ 10_000_000)]
          rw [Nat.min_eq_left (by omega : x ≤ 15_000_000)]
          rw [Nat.min_eq_left (by omega : x ≤ 30_000_000)]
          rw [Nat.min_eq_left (by omega : x ≤ 45_000_000)]
          simp only [Nat.sub_self, Nat.zero_mul, Nat.zero_div, Nat.mul_zero, Nat.div_zero, Nat.sub_zero]
          omega
        ·
          by_cases h : x ≤ 10_000_000
          ·
            rw [z0]
            rw [Nat.min_eq_right (by omega : x ≥ 2_000_000)]
            rw [Nat.min_eq_right (by omega : x ≥ 3_000_000)]
            rw [Nat.min_eq_right (by omega : x ≥ 4_000_000)]
            rw [Nat.min_eq_right (by omega : x ≥ 6_000_000)]
            rw [Nat.min_eq_left (by omega : x ≤ 10_000_000)]
            rw [Nat.min_eq_left (by omega : x ≤ 15_000_000)]
            rw [Nat.min_eq_left (by omega : x ≤ 30_000_000)]
            rw [Nat.min_eq_left (by omega : x ≤ 45_000_000)]
            simp only [Nat.sub_self, Nat.zero_mul, Nat.zero_div, Nat.mul_zero, Nat.div_zero, Nat.sub_zero]
            omega
          ·
            by_cases h : x ≤ 15_000_000
            ·
              rw [z0]
              rw [Nat.min_eq_right (by omega : x ≥ 2_000_000)]
              rw [Nat.min_eq_right (by omega : x ≥ 3_000_000)]
              rw [Nat.min_eq_right (by omega : x ≥ 4_000_000)]
              rw [Nat.min_eq_right (by omega : x ≥ 6_000_000)]
              rw [Nat.min_eq_right (by omega : x ≥ 10_000_000)]
              rw [Nat.min_eq_left (by omega : x ≤ 15_000_000)]
              rw [Nat.min_eq_left (by omega : x ≤ 30_000_000)]
              rw [Nat.min_eq_left (by omega : x ≤ 45_000_000)]
              simp only [Nat.sub_self, Nat.zero_mul, Nat.zero_div, Nat.mul_zero, Nat.div_zero, Nat.sub_zero]
              omega
            ·
              by_cases h : x ≤ 30_000_000
              ·
                rw [z0]
                rw [Nat.min_eq_right (by omega : x ≥ 2_000_000)]
                rw [Nat.min_eq_right (by omega : x ≥ 3_000_000)]
                rw [Nat.min_eq_right (by omega : x ≥ 4_000_000)]
                rw [Nat.min_eq_right (by omega : x ≥ 6_000_000)]
                rw [Nat.min_eq_right (by omega : x ≥ 10_000_000)]
                rw [Nat.min_eq_right (by omega : x ≥ 15_000_000)]
                rw [Nat.min_eq_left (by omega : x ≤ 30_000_000)]
                rw [Nat.min_eq_left (by omega : x ≤ 45_000_000)]
                simp only [Nat.sub_self, Nat.zero_mul, Nat.zero_div, Nat.mul_zero, Nat.div_zero, Nat.sub_zero]
                omega
              ·
                by_cases h : x ≤ 45_000_000
                ·
                  rw [z0]
                  rw [Nat.min_eq_right (by omega : x ≥ 2_000_000)]
                  rw [Nat.min_eq_right (by omega : x ≥ 3_000_000)]
                  rw [Nat.min_eq_right (by omega : x ≥ 4_000_000)]
                  rw [Nat.min_eq_right (by omega : x ≥ 6_000_000)]
                  rw [Nat.min_eq_right (by omega : x ≥ 10_000_000)]
                  rw [Nat.min_eq_right (by omega : x ≥ 15_000_000)]
                  rw [Nat.min_eq_right (by omega : x ≥ 30_000_000)]
                  rw [Nat.min_eq_left (by omega : x ≤ 45_000_000)]
                  simp only [Nat.sub_self, Nat.zero_mul, Nat.zero_div, Nat.mul_zero, Nat.div_zero, Nat.sub_zero]
                  omega
                ·
                  rw [z0]
                  rw [Nat.min_eq_right (by omega : x ≥ 2_000_000)]
                  rw [Nat.min_eq_right (by omega : x ≥ 3_000_000)]
                  rw [Nat.min_eq_right (by omega : x ≥ 4_000_000)]
                  rw [Nat.min_eq_right (by omega : x ≥ 6_000_000)]
                  rw [Nat.min_eq_right (by omega : x ≥ 10_000_000)]
                  rw [Nat.min_eq_right (by omega : x ≥ 15_000_000)]
                  rw [Nat.min_eq_right (by omega : x ≥ 30_000_000)]
                  rw [Nat.min_eq_right (by omega : x ≥ 45_000_000)]
                  simp only [Nat.sub_self, Nat.zero_mul, Nat.zero_div, Nat.mul_zero, Nat.div_zero, Nat.sub_zero]
                  omega

/-- Model-level universal domination: the special table's portion tax never exceeds
    the general table's portion tax, for every taxable gift value. -/
theorem specialGiftPortionTax_le_giftPortionTax (x : Money) :
    specialGiftPortionTax x ≤ giftPortionTax x := by
  rw [specialGiftPortionTax_eq_spn, giftPortionTax_eq_gpn]
  exact spn_le_gpn x

end JapanTaxLaw
