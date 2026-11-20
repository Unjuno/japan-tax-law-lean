import JapanTaxLaw.CustomsSameContentLimit

/-!
# CustomsSameContentLimitSpec — independent spec for the art.14 item-17 exception

Law id: 143AC0000000054
Revision: 143AC0000000054_20260601_508AC0000000005
Statutory article: 関税定率法 art. 14 (無条件免税), item 17 ただし書
Normative unit: NORM|4f809b7fbadedd5606d99bdd90eff711ca1b77bc66fc8a481845a6c117dba46d

The implementation expresses the exception as an inequality (`count ≤ 2`).
The spec is deliberately a different formulation: a structural pattern match
enumerating the three admitted counts (0, 1, 2) and rejecting every larger
count. The kernel proves their agreement for ALL Nat inputs — the finite
pattern match in the spec is not itself the proof.

Not modelled: the main 無条件免税 rule, the other items of art.14, 政令
procedure, and all other articles of 関税法.
-/

namespace JapanTaxLaw.CustomsSameContentLimit

open JapanTaxLaw.TaxFinance

/-- Spec: the admitted counts are exactly 0, 1, 2 (structural formulation). -/
def specWithin : Money → Bool
  | 0 => true
  | 1 => true
  | 2 => true
  | _ + 3 => false

/-- Soundness/correspondence for every count. Universal, kernel-checked. -/
theorem agree_exception_scope (count : Money) :
    withinSameContentLimit count = specWithin count := by
  cases count with
  | zero => rfl
  | succ n =>
      cases n with
      | zero => rfl
      | succ n =>
          cases n with
          | zero => rfl
          | succ n =>
              simp [withinSameContentLimit, sameContentLimit, specWithin]

/-- Boundary: the limit itself is admitted. -/
theorem exception_applies_at_limit : withinSameContentLimit 2 = true := by decide

/-- Boundary: one above the limit is excluded. -/
theorem exception_excludes_above_limit : withinSameContentLimit 3 = false := by decide

/-- Boundary: zero items is admitted (the proviso does not bite). -/
theorem exception_applies_at_zero : withinSameContentLimit 0 = true := by decide

/-- Exclusion is monotone: once above the limit, every larger count is also
    above it. Universal over Nat, kernel-checked. -/
theorem above_limit_monotone {a b : Money}
    (h : sameContentLimit < a) (hab : a ≤ b) : sameContentLimit < b := by
  exact Nat.lt_of_lt_of_le h hab

/-- Finite smoke check only; `agree_exception_scope` is the proof. -/
def agreeCustomsSameContentLimit : Bool :=
  [0, 1, 2, 3, 4, 10].all fun n =>
    withinSameContentLimit n == specWithin n

example : agreeCustomsSameContentLimit = true := by decide

end JapanTaxLaw.CustomsSameContentLimit
