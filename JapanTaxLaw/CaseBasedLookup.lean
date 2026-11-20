/-!
# CaseBasedLookup — 「場合の区分に応じて…に定める…」（783 units）

783 units in 437 verbatim variants of case-based selection plus variants that
aggregate when multiple cases apply (「いずれにも該当する場合は合計割合」).

§3 structure: a caller-supplied case index selects the corresponding enumerated
entry; overlapping-case variants aggregate all matching entries. Formalized as:
  selectCase i n vals fallback = vals i if i < n else fallback
  sumMatching n pred vals = Σ_{k<n, pred k} vals k
Kernel proofs: listed/unlisted branches, exclusiveness/exhaustiveness, boundary,
sum zero/monotonicity. Actual entries and conditions are NOT MODELLED.
-/
namespace JapanTaxLaw.CaseBasedLookup

def selectCase (i n : Nat) (vals : Nat → Nat) (fallback : Nat) : Nat :=
  if i < n then vals i else fallback

theorem listed_case (i n : Nat) (vals : Nat → Nat) (f : Nat) (h : i < n) :
    selectCase i n vals f = vals i := by simp [selectCase, h]

theorem unlisted_case (i n : Nat) (vals : Nat → Nat) (f : Nat) (h : n <= i) :
    selectCase i n vals f = f := by
  have hn : ¬ i < n := by omega
  simp [selectCase, hn]

theorem listed_unlisted_exclusive (i n : Nat) : ¬ (i < n ∧ n <= i) := by
  intro h; omega

theorem listed_unlisted_exhaustive (i n : Nat) : i < n ∨ n <= i := by omega

theorem boundary (n : Nat) (vals : Nat → Nat) (f : Nat) : selectCase n n vals f = f := by
  simp [selectCase]

/-- 複数該当場合の合計（原文の「合計割合」ファミリ）。 -/
def sumMatching (n : Nat) (pred : Nat → Bool) (vals : Nat → Nat) : Nat :=
  match n with
  | 0 => 0
  | k + 1 => sumMatching k pred vals + (if pred k then vals k else 0)

theorem sumMatching_zero (pred : Nat → Bool) (vals : Nat → Nat) :
    sumMatching 0 pred vals = 0 := by rfl

theorem sumMatching_mono (n : Nat) (pred : Nat → Bool) (vals : Nat → Nat) :
    sumMatching n pred vals <= sumMatching (n + 1) pred vals := by
  simp [sumMatching]

end JapanTaxLaw.CaseBasedLookup
