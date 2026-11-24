import JapanTaxLaw.LocalTax37_2BandUpTo195
import JapanTaxLaw.LocalTax37_2Band195To330
import JapanTaxLaw.LocalTax37_2Band330To695
import JapanTaxLaw.LocalTax37_2Band695To900
import JapanTaxLaw.LocalTax37_2Band900To1800
import JapanTaxLaw.LocalTax37_2Band1800To4000
import JapanTaxLaw.LocalTax37_2Over40M

/-
# LocalTax37_2BandPartition — 地方税法 第三十七条の二(11) 区間の整合性

Cross-check of the seven modelled rate-table bands:
  [0, 195万], (195万, 330万], (330万, 695万], (695万, 900万],
  (900万, 1800万], (1800万, 4000万], (4000万, ∞)

「以下」 includes the shared boundary in the lower cell; 「を超え」 excludes it
from the upper cell. The kernel proves (a) boundary contiguity, (b) pairwise
disjointness for adjacent cells, and (c) total coverage for ALL whole-yen
amounts — not a finite sample.

Scope: interval relations only. Rates, the underlying computation, other
articles and the parenthood of the bands are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax37_2BandPartition

/-- Consecutive bounds meet exactly. -/
theorem boundary_195 :
    JapanTaxLaw.LocalTax37_2BandUpTo195.upperInclusiveYen =
    JapanTaxLaw.LocalTax37_2Band195To330.lowerExclusiveYen := rfl
theorem boundary_330 :
    JapanTaxLaw.LocalTax37_2Band195To330.upperInclusiveYen =
    JapanTaxLaw.LocalTax37_2Band330To695.lowerExclusiveYen := rfl
theorem boundary_695 :
    JapanTaxLaw.LocalTax37_2Band330To695.upperInclusiveYen =
    JapanTaxLaw.LocalTax37_2Band695To900.lowerExclusiveYen := rfl
theorem boundary_900 :
    JapanTaxLaw.LocalTax37_2Band695To900.upperInclusiveYen =
    JapanTaxLaw.LocalTax37_2Band900To1800.lowerExclusiveYen := rfl
theorem boundary_1800 :
    JapanTaxLaw.LocalTax37_2Band900To1800.upperInclusiveYen =
    JapanTaxLaw.LocalTax37_2Band1800To4000.lowerExclusiveYen := rfl
theorem boundary_4000 :
    JapanTaxLaw.LocalTax37_2Band1800To4000.upperInclusiveYen =
    JapanTaxLaw.LocalTax37_2Over40M.threshold := rfl

/-- Adjacent cells never overlap (universal). -/
theorem disjoint_195_330 (x : Nat) :
    ¬ (JapanTaxLaw.LocalTax37_2BandUpTo195.inBand x ∧
       JapanTaxLaw.LocalTax37_2Band195To330.inBand x) := by
  rintro ⟨lo, hi⟩
  unfold JapanTaxLaw.LocalTax37_2BandUpTo195.inBand at lo
  unfold JapanTaxLaw.LocalTax37_2Band195To330.inBand at hi
  unfold JapanTaxLaw.LocalTax37_2BandUpTo195.upperInclusiveYen at lo
  unfold JapanTaxLaw.LocalTax37_2Band195To330.lowerExclusiveYen at hi
  exact (Nat.not_lt_of_ge lo) hi.1

theorem disjoint_1800_4000 (x : Nat) :
    ¬ (JapanTaxLaw.LocalTax37_2Band1800To4000.inBand x ∧
       JapanTaxLaw.LocalTax37_2Over40M.inScope x) := by
  rintro ⟨lo, hi⟩
  unfold JapanTaxLaw.LocalTax37_2Band1800To4000.inBand at lo
  unfold JapanTaxLaw.LocalTax37_2Over40M.inScope at hi
  unfold JapanTaxLaw.LocalTax37_2Band1800To4000.upperInclusiveYen at lo
  unfold JapanTaxLaw.LocalTax37_2Over40M.threshold at hi
  exact (Nat.not_lt_of_ge lo.2) hi

/-- Total coverage: every amount lies in at least one band (universal). -/
theorem coverage (x : Nat) :
    JapanTaxLaw.LocalTax37_2BandUpTo195.inBand x ∨
    JapanTaxLaw.LocalTax37_2Band195To330.inBand x ∨
    JapanTaxLaw.LocalTax37_2Band330To695.inBand x ∨
    JapanTaxLaw.LocalTax37_2Band695To900.inBand x ∨
    JapanTaxLaw.LocalTax37_2Band900To1800.inBand x ∨
    JapanTaxLaw.LocalTax37_2Band1800To4000.inBand x ∨
    JapanTaxLaw.LocalTax37_2Over40M.inScope x := by
  unfold JapanTaxLaw.LocalTax37_2BandUpTo195.inBand
  unfold JapanTaxLaw.LocalTax37_2Band195To330.inBand
  unfold JapanTaxLaw.LocalTax37_2Band330To695.inBand
  unfold JapanTaxLaw.LocalTax37_2Band695To900.inBand
  unfold JapanTaxLaw.LocalTax37_2Band900To1800.inBand
  unfold JapanTaxLaw.LocalTax37_2Band1800To4000.inBand
  unfold JapanTaxLaw.LocalTax37_2Over40M.inScope
  unfold JapanTaxLaw.LocalTax37_2Band195To330.lowerExclusiveYen
  unfold JapanTaxLaw.LocalTax37_2Band330To695.lowerExclusiveYen
  unfold JapanTaxLaw.LocalTax37_2Band695To900.lowerExclusiveYen
  unfold JapanTaxLaw.LocalTax37_2Band900To1800.lowerExclusiveYen
  unfold JapanTaxLaw.LocalTax37_2Band1800To4000.lowerExclusiveYen
  unfold JapanTaxLaw.LocalTax37_2Over40M.threshold
  by_cases h1 : x ≤ 1_950_000
  · exact Or.inl h1
  · have g1 : 1_950_000 < x := Nat.lt_of_not_ge h1
    by_cases h2 : x ≤ 3_300_000
    · exact Or.inr (Or.inl ⟨g1, h2⟩)
    · have g2 : 3_300_000 < x := Nat.lt_of_not_ge h2
      by_cases h3 : x ≤ 6_950_000
      · exact Or.inr (Or.inr (Or.inl ⟨g2, h3⟩))
      · have g3 : 6_950_000 < x := Nat.lt_of_not_ge h3
        by_cases h4 : x ≤ 9_000_000
        · exact Or.inr (Or.inr (Or.inr (Or.inl ⟨g3, h4⟩)))
        · have g4 : 9_000_000 < x := Nat.lt_of_not_ge h4
          by_cases h5 : x ≤ 18_000_000
          · exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inl ⟨g4, h5⟩))))
          · have g5 : 18_000_000 < x := Nat.lt_of_not_ge h5
            by_cases h6 : x ≤ 40_000_000
            · exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inl ⟨g5, h6⟩)))))
            · exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Nat.lt_of_not_ge h6))))))

/-- Kernel-decided shared boundaries: the lower cell owns each shared amount. -/
example : JapanTaxLaw.LocalTax37_2BandUpTo195.inBand 1_950_000 := by
  unfold JapanTaxLaw.LocalTax37_2BandUpTo195.inBand
  unfold JapanTaxLaw.LocalTax37_2BandUpTo195.upperInclusiveYen
  decide
example : ¬ JapanTaxLaw.LocalTax37_2Band195To330.inBand 1_950_000 := by
  unfold JapanTaxLaw.LocalTax37_2Band195To330.inBand
  unfold JapanTaxLaw.LocalTax37_2Band195To330.lowerExclusiveYen
  decide

end JapanTaxLaw.LocalTax37_2BandPartition
