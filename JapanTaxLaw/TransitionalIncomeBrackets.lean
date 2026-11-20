/-!
# TransitionalIncomeBrackets — 329M50000002023 附則4（年額の三区分 × 2）

Pinned source: data/raw/329M50000002023_20261101_508M60000008045.law.json
LawBody[79]/SupplProvision/SupplProvision[4]/Article:4(2) quoted table.

Two parallel three-band income tables, with the OPPOSITE boundary convention to
the art.11 index tables: 「以下」 is upper-INCLUSIVE and 「超え」 is lower-EXCLUSIVE.

* ３５０万円 table:
  （２１）年３５０万円以下の金額
  （２２）年３５０万円を超え年７００万円以下の金額
  （２３）年７００万円を超える金額
* ３００万円 table:
  （２１）年３００万円以下の金額
  （２２）年３００万円を超え年６００万円以下の金額
  （２３）年６００万円を超える金額

d : Nat is a caller-established annual amount in yen. Both tables cover ALL
d : Nat. Finite index (three), universally quantified d.
-/
namespace JapanTaxLaw.TransitionalIncomeBrackets

namespace T350

def inBand (i : Nat) (d : Nat) : Bool :=
  match i with
  | 0 => decide (d <= 3_500_000)
  | 1 => decide (3_500_000 < d ∧ d <= 7_000_000)
  | _ => decide (7_000_000 < d)

def pickVal (d : Nat) : Nat :=
  if d <= 3_500_000 then 0 else if d <= 7_000_000 then 1 else 2

theorem pickVal_lt_three (d : Nat) : pickVal d < 3 := by
  unfold pickVal
  by_cases h0 : d <= 3_500_000 <;> simp [h0]
  by_cases h1 : d <= 7_000_000 <;> simp [h0, h1]

theorem pickVal_inBand (d : Nat) : inBand (pickVal d) d = true := by
  unfold pickVal inBand
  by_cases h0 : d <= 3_500_000
  · simp [h0]
  · by_cases h1 : d <= 7_000_000
    · simp [h0, h1]
      omega
    · simp [h0, h1]
      omega

theorem unique_band (d : Nat) (i : Nat) (hilt : i < 3)
    (hi : inBand i d = true) : i = pickVal d := by
  by_cases h0 : i = 0
  · subst i
    simp [inBand] at hi
    simp [pickVal, hi]
  · by_cases h1 : i = 1
    · subst i
      simp [inBand] at hi
      have hn0 : ¬ d <= 3_500_000 := by omega
      simp [pickVal, hn0, hi.2]
    · have hi2 : i = 2 := by omega
      subst i
      simp [inBand] at hi
      have hn0 : ¬ d <= 3_500_000 := by omega
      have hn1 : ¬ d <= 7_000_000 := by omega
      simp [pickVal, hn0, hn1]

theorem pairwise_exclusive (d : Nat) (i j : Nat) (hil : i < 3) (hjl : j < 3)
    (hne : i ≠ j) (hi : inBand i d = true) (hj : inBand j d = true) : False := by
  have hpi := unique_band d i hil hi
  have hpj := unique_band d j hjl hj
  exact hne (hpi.trans hpj.symm)

theorem exhaustive (d : Nat) : ∃ i : Nat, inBand i d = true :=
  ⟨pickVal d, pickVal_inBand d⟩

end T350

namespace T300

def inBand (i : Nat) (d : Nat) : Bool :=
  match i with
  | 0 => decide (d <= 3_000_000)
  | 1 => decide (3_000_000 < d ∧ d <= 6_000_000)
  | _ => decide (6_000_000 < d)

def pickVal (d : Nat) : Nat :=
  if d <= 3_000_000 then 0 else if d <= 6_000_000 then 1 else 2

theorem pickVal_lt_three (d : Nat) : pickVal d < 3 := by
  unfold pickVal
  by_cases h0 : d <= 3_000_000 <;> simp [h0]
  by_cases h1 : d <= 6_000_000 <;> simp [h0, h1]

theorem pickVal_inBand (d : Nat) : inBand (pickVal d) d = true := by
  unfold pickVal inBand
  by_cases h0 : d <= 3_000_000
  · simp [h0]
  · by_cases h1 : d <= 6_000_000
    · simp [h0, h1]
      omega
    · simp [h0, h1]
      omega

theorem unique_band (d : Nat) (i : Nat) (hilt : i < 3)
    (hi : inBand i d = true) : i = pickVal d := by
  by_cases h0 : i = 0
  · subst i
    simp [inBand] at hi
    simp [pickVal, hi]
  · by_cases h1 : i = 1
    · subst i
      simp [inBand] at hi
      have hn0 : ¬ d <= 3_000_000 := by omega
      simp [pickVal, hn0, hi.2]
    · have hi2 : i = 2 := by omega
      subst i
      simp [inBand] at hi
      have hn0 : ¬ d <= 3_000_000 := by omega
      have hn1 : ¬ d <= 6_000_000 := by omega
      simp [pickVal, hn0, hn1]

theorem pairwise_exclusive (d : Nat) (i j : Nat) (hil : i < 3) (hjl : j < 3)
    (hne : i ≠ j) (hi : inBand i d = true) (hj : inBand j d = true) : False := by
  have hpi := unique_band d i hil hi
  have hpj := unique_band d j hjl hj
  exact hne (hpi.trans hpj.symm)

theorem exhaustive (d : Nat) : ∃ i : Nat, inBand i d = true :=
  ⟨pickVal d, pickVal_inBand d⟩

end T300
end JapanTaxLaw.TransitionalIncomeBrackets
