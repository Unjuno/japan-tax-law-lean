import JapanTaxLaw.ReadingReplacements
import JapanTaxLaw.ReadingReplacementsSpec

/-!
# ReadingReplacementsTests — 置換・非該当・文言同一性
-/
namespace JapanTaxLaw.ReadingReplacementsTests

open JapanTaxLaw.ReadingReplacements

def froms : Nat → Nat := fun i => 100 + i
def tos : Nat → Nat := fun i => 200 + i

theorem substitute_spec (x f t : Nat) :
    substitute x f t = JapanTaxLaw.ReadingReplacementsSpec.substituteSpec x f t := by rfl

theorem listed_spec (i n : Nat) : (i < n) ↔ JapanTaxLaw.ReadingReplacementsSpec.listedSpec i n := by rfl

example : substitute 100 100 200 = 200 := by decide
example : substitute 101 100 200 = 101 := by decide
example : applyTable 0 3 froms tos 100 = 200 := by decide
example : applyTable 0 3 froms tos 999 = 999 := by decide
example : applyTable 3 3 froms tos 100 = 100 := by decide
example (f t : Nat) : substitute f f t = t := substitute_matched f t
example (x f t : Nat) (h : x ≠ f) : substitute x f t = x := substitute_unaffected x f t h
example (i n x : Nat) (h : i < n) : applyTable i n froms tos x = substitute x (froms i) (tos i) :=
  listed_replaces i n froms tos x h
example (i n x : Nat) (h : n <= i) : applyTable i n froms tos x = x :=
  unlisted_unchanged i n froms tos x h
example (i n x : Nat) : Toshite.apply i n froms tos x = Yomikaeru.apply i n froms tos x :=
  wording_families_identical i n froms tos x

end JapanTaxLaw.ReadingReplacementsTests
