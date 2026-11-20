import JapanTaxLaw.CaseBasedLookup
import JapanTaxLaw.CaseBasedLookupSpec

/-!
# CaseBasedLookupTests — 選択・合計・境界
-/
namespace JapanTaxLaw.CaseBasedLookupTests

open JapanTaxLaw.CaseBasedLookup

def vals : Nat → Nat := fun n => 10 + n

theorem spec_agree (i n f : Nat) :
    selectCase i n vals f = JapanTaxLaw.CaseBasedLookupSpec.selectSpec i n vals f := by rfl

example : selectCase 0 3 vals 999 = 10 := by decide
example : selectCase 2 3 vals 999 = 12 := by decide
example : selectCase 3 3 vals 999 = 999 := by decide
example (i n f : Nat) (h : i < n) : selectCase i n vals f = vals i := listed_case i n vals f h
example (i n f : Nat) (h : n <= i) : selectCase i n vals f = f := unlisted_case i n vals f h
example (i n : Nat) : ¬ (i < n ∧ n <= i) := listed_unlisted_exclusive i n
example (i n : Nat) : i < n ∨ n <= i := listed_unlisted_exhaustive i n
example (n f : Nat) : selectCase n n vals f = f := boundary n vals f
example (n : Nat) : sumMatching n (fun _ => false) vals = 0 := by
  induction n with
  | zero => rfl
  | succ k ih => simp [sumMatching, ih]
example (n : Nat) : sumMatching n (fun _ => false) vals <= sumMatching (n + 1) (fun _ => false) vals :=
  sumMatching_mono n (fun _ => false) vals
example (pred : Nat → Bool) (vals' : Nat → Nat) : sumMatching 0 pred vals' = 0 :=
  sumMatching_zero pred vals'

end JapanTaxLaw.CaseBasedLookupTests
