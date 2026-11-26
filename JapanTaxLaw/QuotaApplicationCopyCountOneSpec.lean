import JapanTaxLaw.QuotaApplicationCopyCountOne

/-
# QuotaApplicationCopyCountOneSpec — independent spec for とうもろこし関税割当省令 art.1（一通）

Pinned source:
  Law id: 340M50010000013
  Revision: 340M50010000013_20220401_504M60000200005
  Statutory article: 第一条(1)
  原文逐語: 「関税割当制度に関する政令（以下「令」という。）第二条第一項の関税割当申請書の様式は別記様式第一によるものとし、その提出部数は一通とする。」
  Normative unit: NORM|b8a8b36b8a88d17067f380b89d2af71d86e63baac7cdfcd834c96a9bc4344894

This module carries its OWN statutory constant and a distinct equality form:
`specIsPrescribedCopies n := decide (n < 2 && 0 < n)` uses strict
inequalities, a distinct formulation from the impl's `n == 1`. The universal
agreement theorem is proven by case analysis on n (0, succ 0, succ (succ k)),
all closed and axiom-free. No `spec*` definition
references an implementation name.

Not modelled: the prescribed form, application content, other paragraphs and
enforcement rules.
-/

namespace JapanTaxLaw.QuotaApplicationCopyCountOne

/-- Spec-local statutory value: 一通 = 1. Independent of impl. -/
def specSubmissionCopies : Nat := 1

/-- Independent predicate: successor-shifted equality. -/
def specIsPrescribedCopies (n : Nat) : Bool :=
  decide (n < Nat.succ specSubmissionCopies && 0 < n)

/-- Universal, kernel-checked, axiom-free agreement for every Nat count. -/
theorem agree_copies : ∀ n : Nat,
    isPrescribedCopies n = specIsPrescribedCopies n
  | 0 => by decide
  | 1 => by decide
  | Nat.succ (Nat.succ k) => by
      unfold isPrescribedCopies submissionCopies specIsPrescribedCopies specSubmissionCopies
      rfl

example : specSubmissionCopies = 1 := rfl

end JapanTaxLaw.QuotaApplicationCopyCountOne
