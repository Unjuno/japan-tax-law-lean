import JapanTaxLaw.PetroleumCoalSixMonthNoWithdrawalWindow

/-
# PetroleumCoalSixMonthNoWithdrawalWindowSpec — 石油石炭税法施行令 16(2)(8) の独立定式

Pinned: law 353CO0000000132, revision 353CO0000000132_20250401_507CO0000000006,
Article 16 Paragraph 2 Item 8; needle 「六月内に原油等の保税地域からの
引取りがなかつた月がある場合」.

Independent restatement: the relevant months are the six consecutive months
ending at the month before the application month; a statement is required when
a relevant month had no bonded withdrawal attributable to a law-based
inspection. Definitions use their own numerals/identifiers; agreement is a
separate bridge.
-/

namespace JapanTaxLaw.PetroleumCoalSixMonthNoWithdrawalWindow

/-- 独立定式: 六 = 6。 -/
def specSix : Nat := 6

/-- 独立定式: 前月 = a - 1。 -/
def specPrevMonth (applicationMonth : Nat) : Nat :=
  applicationMonth - 1

/-- 独立定式: 前月末日以前六月内。 -/
def specInSixMonths (applicationMonth month : Nat) : Bool :=
  let e := specPrevMonth applicationMonth
  month <= e && e < month + specSix

/-- 独立定式: 検査を理由とする無引取り月の事実記載要否。 -/
def specMustState (applicationMonth month : Nat) (withdrawn excused : Bool) : Bool :=
  specInSixMonths applicationMonth month && (!withdrawn) && excused

theorem agreeSix : sixMonths = specSix := by
  unfold sixMonths specSix
  rfl

theorem agreeEnd (applicationMonth : Nat) :
    windowEnd applicationMonth = specPrevMonth applicationMonth := by
  unfold windowEnd specPrevMonth
  rfl

theorem agreeInWindow (applicationMonth month : Nat) :
    inWindow applicationMonth month = specInSixMonths applicationMonth month := by
  unfold inWindow specInSixMonths
  rw [agreeSix, agreeEnd]

theorem agreeRequired (applicationMonth month : Nat) (withdrawn excused : Bool) :
    statementRequired applicationMonth month withdrawn excused =
      specMustState applicationMonth month withdrawn excused := by
  unfold statementRequired specMustState
  rw [agreeInWindow]

example : specInSixMonths 10 4 = true := by decide
example : specInSixMonths 10 3 = false := by decide
example : specMustState 10 7 false true = true := by decide

end JapanTaxLaw.PetroleumCoalSixMonthNoWithdrawalWindow
