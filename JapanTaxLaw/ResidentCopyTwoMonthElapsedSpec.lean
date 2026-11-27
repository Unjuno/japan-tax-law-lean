import JapanTaxLaw.ResidentCopyTwoMonthElapsed

/-
# ResidentCopyTwoMonthElapsedSpec — 東日本大震災特例法施行規則 3の8(2)(2)ロ(3) の独立定式

Pinned: law 423M60000040020, revision 423M60000040020_20260414_508M60000040039,
Article 3_8 Paragraph 2 Item 2 Subitem2#3; needle 「…二月を経過した日後に
交付を受けたものに限る」.

Independent restatement: a resident-register copy qualifies only when its issue
month is strictly after the transfer month plus two. Definitions use their own
numerals and no implementation identifiers; agreement is a separate bridge.
-/

namespace JapanTaxLaw.ResidentCopyTwoMonthElapsed

/-- 独立定式: 二 = 2（月）。 -/
def specTwoMonths : Nat := 2

/-- 独立定式: 交付月 > 譲渡月 + 2（厳密に後）。 -/
def specAfterTwoMonths (transferMonth issuedMonth : Nat) : Bool :=
  issuedMonth > transferMonth + specTwoMonths

theorem agreeMonths : elapsedMonths = specTwoMonths := by
  unfold elapsedMonths specTwoMonths
  rfl

theorem agreeQualified (transferMonth issuedMonth : Nat) :
    qualified transferMonth issuedMonth = specAfterTwoMonths transferMonth issuedMonth := by
  unfold qualified specAfterTwoMonths
  rw [agreeMonths]

example : specAfterTwoMonths 3 5 = false := by decide
example : specAfterTwoMonths 3 6 = true := by decide

end JapanTaxLaw.ResidentCopyTwoMonthElapsed
