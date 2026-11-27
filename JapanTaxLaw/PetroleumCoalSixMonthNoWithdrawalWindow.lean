import Std
import JapanTaxLaw.TaxFinance

/-
# PetroleumCoalSixMonthNoWithdrawalWindow — 石油石炭税法施行令 第十六条 第二項 第八号
（申請月の前月末日以前六月内に原油等の保税地域からの引取りがなかつた月がある場合）

Pinned sources:
  Law id: 353CO0000000132 (石油石炭税法施行令)
  Revision: 353CO0000000132_20250401_507CO0000000006 (enforced 2025-04-01)
  Raw snapshot: data/raw/353CO0000000132_20250401_507CO0000000006.law.json
  Article Num 16, Paragraph 2, Item 8, Sentence 1.
  source_path: LawBody[2]/MainProvision/MainProvision[12]/Article:16/Article#16/Paragraph#2/Item#8/ItemSentence/Sentence#1
  Normative unit: NORM|ab3209436d27ae69066623879f84fae83ad4821cc9c02b3ca7ef719442d5783d

Verbatim 原文 needle (scoped to Article 16 Item 8):
  「六月内に原油等の保税地域からの引取りがなかつた月がある場合」

Variable contract (month ordinals; caller establishes applicationMonth >= 1):
  applicationMonth = 申請の日の属する月
  windowEnd a      = 申請月の前月 (month index a - 1; 「前月の末日以前」)
  sixMonths        = 六 = 6
  inWindow a m     = m <= windowEnd a ∧ windowEnd a < m + 6
      (the six consecutive months ending at the previous month's last day:
       m = E, E-1, E-2, E-3, E-4, E-5)
  withdrawn        = 保税地域からの引取りがあつた (caller-established)
  excused          = 保安検査・自主検査等により引取りがなかつた (caller-established)
  statementRequired a m withdrawn excused =
      inWindow a m ∧ ¬withdrawn ∧ excused

Out of scope: paragraph 1 eligibility (at-least-one withdrawal per month), the
other twelve items of paragraph 2, paragraphs 3–8, the definition of 原油等,
quantities/values, the approval decision (art. 7), sibling article 13, and all
legal effects. No human legal review; LEGAL_REVIEW_PENDING.
-/

namespace JapanTaxLaw.PetroleumCoalSixMonthNoWithdrawalWindow

/-- 原文の「六」= 6（月）。 -/
def sixMonths : Nat := 6

/-- 申請月の前月（月序号）。 -/
def windowEnd (applicationMonth : Nat) : Nat :=
  applicationMonth - 1

/-- 前月末日以前六月内（連続 six months、端を含む）。 -/
def inWindow (applicationMonth month : Nat) : Bool :=
  let e := windowEnd applicationMonth
  month <= e && e < month + sixMonths

/-- 当該事実の記載要否。 -/
def statementRequired (applicationMonth month : Nat) (withdrawn excused : Bool) : Bool :=
  inWindow applicationMonth month && (!withdrawn) && excused

theorem six_is_six : sixMonths = 6 := rfl
theorem end_of_month_10 : windowEnd 10 = 9 := by decide

-- 境界: E=9 の六月窓は m=4..9 (E-5 .. E)
theorem in_window_end : inWindow 10 9 = true := by decide
theorem in_window_oldest : inWindow 10 4 = true := by decide
theorem out_window_too_old : inWindow 10 3 = false := by decide
theorem out_window_future : inWindow 10 10 = false := by decide
theorem too_old_month : inWindow 10 0 = false := by decide

-- 記載要否: 検査を理由とする引取り無しのときのみ要する
theorem required_when_excused :
    statementRequired 10 7 false true = true := by decide
theorem not_when_withdrawn :
    statementRequired 10 7 true true = false := by decide
theorem not_when_unexcused :
    statementRequired 10 7 false false = false := by decide
theorem not_outside_window :
    statementRequired 10 3 false true = false := by decide

end JapanTaxLaw.PetroleumCoalSixMonthNoWithdrawalWindow
