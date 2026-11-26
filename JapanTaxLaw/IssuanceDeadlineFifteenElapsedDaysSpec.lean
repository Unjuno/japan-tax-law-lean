import JapanTaxLaw.IssuanceDeadlineFifteenElapsedDays

/-
# IssuanceDeadlineFifteenElapsedDaysSpec — 関税暫定措置法証明書発給省令 2(4) の独立定式

Pinned: law 407M50000200018, revision 407M50000200018_20201221_502M60000200083,
Article 2 Paragraph 4; needle 「受理した日から起算して十五日を経過した日までに」.

Independent restatement: delivery day must not exceed acceptance day plus 15.
Definitions use only their own numerals and no implementation identifiers; the
agreement theorem is a separate bridge.
-/

namespace JapanTaxLaw.IssuanceDeadlineFifteenElapsedDays

/-- 独立定式: 十五日。 -/
def specElapsed : Nat := 15

/-- 独立定式: issue <= accept + 15。 -/
def specByDeadline (accept issue : Nat) : Bool :=
  issue <= accept + specElapsed

theorem agreeElapsed : elapsedDays = specElapsed := by
  unfold elapsedDays specElapsed
  rfl

theorem agreeByDeadline (accept issue : Nat) :
    byDeadline accept issue = specByDeadline accept issue := by
  unfold byDeadline specByDeadline
  rw [agreeElapsed]

example : specByDeadline 0 14 = true := by decide
example : specByDeadline 0 15 = true := by decide
example : specByDeadline 0 16 = false := by decide

end JapanTaxLaw.IssuanceDeadlineFifteenElapsedDays
