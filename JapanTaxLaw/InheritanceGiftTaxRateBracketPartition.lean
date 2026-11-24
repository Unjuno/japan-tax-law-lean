import JapanTaxLaw.InheritanceGiftTaxRateBracket2M3M
import JapanTaxLaw.InheritanceGiftTaxRateBracket3M4M
import JapanTaxLaw.InheritanceGiftTaxRateBracket4M6M
import JapanTaxLaw.InheritanceGiftTaxRateBracket6M10M
import JapanTaxLaw.InheritanceGiftTaxRateBracket10M15M
import JapanTaxLaw.InheritanceGiftTaxRateBracket15M30M

/-
# InheritanceGiftTaxRateBracketPartition — 相続税法 第二十一条の七(1) 贈与税税率表の区間整合性

This module does NOT model a statutory clause of its own. It cross-checks the
SIX independently pinned table-cell brackets of art. 21_7(1):

  (200万, 300万], (300万, 400万], (400万, 600万], (600万, 1000万],
  (1000万, 1500万], (1500万, 3000万]

「を超え」 is strict and 「以下」 is inclusive, so neighbouring cells meet at a
shared boundary: the upper bracket owns the shared amount, the lower does not.
Kernel checks establish (a) contiguity of consecutive bounds and (b) pairwise
disjointness for every adjacent pair — for ALL amounts, not a finite sample.

Scope: only interval boundaries. The paired tax rates, the base computation,
the >3000万 band and other rows/paragraphs are NOT MODELLED.
No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.InheritanceGiftTaxRateBracketPartition

/-- Consecutive cells share their boundary exactly. -/
theorem boundary_3M :
    JapanTaxLaw.InheritanceGiftTaxRateBracket2M3M.upperInclusiveYen =
    JapanTaxLaw.InheritanceGiftTaxRateBracket3M4M.lowerExclusiveYen := rfl

theorem boundary_4M :
    JapanTaxLaw.InheritanceGiftTaxRateBracket3M4M.upperInclusiveYen =
    JapanTaxLaw.InheritanceGiftTaxRateBracket4M6M.lowerExclusiveYen := rfl

theorem boundary_6M :
    JapanTaxLaw.InheritanceGiftTaxRateBracket4M6M.upperInclusiveYen =
    JapanTaxLaw.InheritanceGiftTaxRateBracket6M10M.lowerExclusiveYen := rfl

theorem boundary_10M :
    JapanTaxLaw.InheritanceGiftTaxRateBracket6M10M.upperInclusiveYen =
    JapanTaxLaw.InheritanceGiftTaxRateBracket10M15M.lowerExclusiveYen := rfl

theorem boundary_15M :
    JapanTaxLaw.InheritanceGiftTaxRateBracket10M15M.upperInclusiveYen =
    JapanTaxLaw.InheritanceGiftTaxRateBracket15M30M.lowerExclusiveYen := rfl

/-- Adjacent cells never overlap: the upper-inclusive bound of the lower cell
    is the strict lower bound of the next cell, so `x ≤ B ∧ B < x` is impossible.
    Universal over all whole-yen amounts. -/
theorem disjoint_2M3M_3M4M (x : Nat) :
    ¬ (JapanTaxLaw.InheritanceGiftTaxRateBracket2M3M.inBracket x ∧
       JapanTaxLaw.InheritanceGiftTaxRateBracket3M4M.inBracket x) := by
  rintro ⟨lowerCell, upperCell⟩
  unfold JapanTaxLaw.InheritanceGiftTaxRateBracket2M3M.inBracket at lowerCell
  unfold JapanTaxLaw.InheritanceGiftTaxRateBracket3M4M.inBracket at upperCell
  unfold JapanTaxLaw.InheritanceGiftTaxRateBracket2M3M.upperInclusiveYen at lowerCell
  unfold JapanTaxLaw.InheritanceGiftTaxRateBracket3M4M.lowerExclusiveYen at upperCell
  exact (Nat.not_lt_of_ge lowerCell.2) upperCell.1

theorem disjoint_3M4M_4M6M (x : Nat) :
    ¬ (JapanTaxLaw.InheritanceGiftTaxRateBracket3M4M.inBracket x ∧
       JapanTaxLaw.InheritanceGiftTaxRateBracket4M6M.inBracket x) := by
  rintro ⟨lowerCell, upperCell⟩
  unfold JapanTaxLaw.InheritanceGiftTaxRateBracket3M4M.inBracket at lowerCell
  unfold JapanTaxLaw.InheritanceGiftTaxRateBracket4M6M.inBracket at upperCell
  unfold JapanTaxLaw.InheritanceGiftTaxRateBracket3M4M.upperInclusiveYen at lowerCell
  unfold JapanTaxLaw.InheritanceGiftTaxRateBracket4M6M.lowerExclusiveYen at upperCell
  exact (Nat.not_lt_of_ge lowerCell.2) upperCell.1

theorem disjoint_4M6M_6M10M (x : Nat) :
    ¬ (JapanTaxLaw.InheritanceGiftTaxRateBracket4M6M.inBracket x ∧
       JapanTaxLaw.InheritanceGiftTaxRateBracket6M10M.inBracket x) := by
  rintro ⟨lowerCell, upperCell⟩
  unfold JapanTaxLaw.InheritanceGiftTaxRateBracket4M6M.inBracket at lowerCell
  unfold JapanTaxLaw.InheritanceGiftTaxRateBracket6M10M.inBracket at upperCell
  unfold JapanTaxLaw.InheritanceGiftTaxRateBracket4M6M.upperInclusiveYen at lowerCell
  unfold JapanTaxLaw.InheritanceGiftTaxRateBracket6M10M.lowerExclusiveYen at upperCell
  exact (Nat.not_lt_of_ge lowerCell.2) upperCell.1

theorem disjoint_6M10M_10M15M (x : Nat) :
    ¬ (JapanTaxLaw.InheritanceGiftTaxRateBracket6M10M.inBracket x ∧
       JapanTaxLaw.InheritanceGiftTaxRateBracket10M15M.inBracket x) := by
  rintro ⟨lowerCell, upperCell⟩
  unfold JapanTaxLaw.InheritanceGiftTaxRateBracket6M10M.inBracket at lowerCell
  unfold JapanTaxLaw.InheritanceGiftTaxRateBracket10M15M.inBracket at upperCell
  unfold JapanTaxLaw.InheritanceGiftTaxRateBracket6M10M.upperInclusiveYen at lowerCell
  unfold JapanTaxLaw.InheritanceGiftTaxRateBracket10M15M.lowerExclusiveYen at upperCell
  exact (Nat.not_lt_of_ge lowerCell.2) upperCell.1

theorem disjoint_10M15M_15M30M (x : Nat) :
    ¬ (JapanTaxLaw.InheritanceGiftTaxRateBracket10M15M.inBracket x ∧
       JapanTaxLaw.InheritanceGiftTaxRateBracket15M30M.inBracket x) := by
  rintro ⟨lowerCell, upperCell⟩
  unfold JapanTaxLaw.InheritanceGiftTaxRateBracket10M15M.inBracket at lowerCell
  unfold JapanTaxLaw.InheritanceGiftTaxRateBracket15M30M.inBracket at upperCell
  unfold JapanTaxLaw.InheritanceGiftTaxRateBracket10M15M.upperInclusiveYen at lowerCell
  unfold JapanTaxLaw.InheritanceGiftTaxRateBracket15M30M.lowerExclusiveYen at upperCell
  exact (Nat.not_lt_of_ge lowerCell.2) upperCell.1

/-- Kernel-decided shared-boundary ownership: the LOWER cell owns each shared
    amount (以下 inclusive); the upper cell excludes it (を超え strict). A naive
    assumption that the upper cell owns the boundary is refuted by the kernel. -/
example : JapanTaxLaw.InheritanceGiftTaxRateBracket2M3M.inBracket 3_000_000 := by
  unfold JapanTaxLaw.InheritanceGiftTaxRateBracket2M3M.inBracket
  unfold JapanTaxLaw.InheritanceGiftTaxRateBracket2M3M.lowerExclusiveYen
  unfold JapanTaxLaw.InheritanceGiftTaxRateBracket2M3M.upperInclusiveYen
  decide
example : ¬ JapanTaxLaw.InheritanceGiftTaxRateBracket3M4M.inBracket 3_000_000 := by
  unfold JapanTaxLaw.InheritanceGiftTaxRateBracket3M4M.inBracket
  unfold JapanTaxLaw.InheritanceGiftTaxRateBracket3M4M.lowerExclusiveYen
  decide
example : JapanTaxLaw.InheritanceGiftTaxRateBracket10M15M.inBracket 15_000_000 := by
  unfold JapanTaxLaw.InheritanceGiftTaxRateBracket10M15M.inBracket
  unfold JapanTaxLaw.InheritanceGiftTaxRateBracket10M15M.lowerExclusiveYen
  unfold JapanTaxLaw.InheritanceGiftTaxRateBracket10M15M.upperInclusiveYen
  decide
example : ¬ JapanTaxLaw.InheritanceGiftTaxRateBracket15M30M.inBracket 15_000_000 := by
  unfold JapanTaxLaw.InheritanceGiftTaxRateBracket15M30M.inBracket
  unfold JapanTaxLaw.InheritanceGiftTaxRateBracket15M30M.lowerExclusiveYen
  decide

end JapanTaxLaw.InheritanceGiftTaxRateBracketPartition
