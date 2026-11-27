import Std
import JapanTaxLaw.TaxFinance

/-
# ResidentCopyTwoMonthElapsed — 東日本大震災被災者等国税臨時特例法施行規則 第三条の八 第二項 第二号 ロ(3)
（住民票の写しは、譲渡をした日から二月を経過した日後に交付を受けたものに限る）

Pinned sources:
  Law id: 423M60000040020 (東日本大震災の被災者等に係る国税関係法律の
    臨時特例に関する法律施行規則)
  Revision: 423M60000040020_20260414_508M60000040039 (enforced 2026-04-14)
  Raw snapshot: data/raw/423M60000040020_20260414_508M60000040039.law.json
  Article Num 3_8, Paragraph 2, Item 2, Subitem1#1, Subitem2#3, Sentence#1.
  source_path: LawBody[3]/MainProvision/MainProvision[1]/Article:3_8/Article#3_8/Paragraph#2/Item#2/Subitem1#1/Subitem2#3/Subitem2Sentence/Sentence#1
  Normative unit: NORM|b2609364e518119f5daab9fdfbaa9207ee764977649b889e7d009c126be6bb69

Verbatim 原文 needle (scoped to Article 3_8 Item 2 ロ(3)):
  「被相続人所有家屋の所在地を管轄する市町村長から交付を受けた当該被相続人の住民票の写し（ロ（３）に規定する譲渡をした日から二月を経過した日後に交付を受けたものに限る。）」

Variable contract (month ordinals; caller-established):
  transferMonth = ロ（３）に規定する譲渡をした月
  issuedMonth   = 住民票の写しの交付を受けた月
  elapsedMonths = 二 = 2
  qualified transferMonth issuedMonth = transferMonth + 2 < issuedMonth
      （二月を経過した日「後」= strictly after; ちょうど二月では false）

This is a one-sided unbounded lower gate. Out of scope: the alternative documents
(戸籍の附票の写し etc.), 家屋居住不能時 predicate, sibling item 2(1)/2(2)イ,
parallel 二月 clauses in Subitem2#4 / item 4, calendar/leap-day arithmetic,
the underlying tax preference, other articles/laws and all legal effects.
No human legal review; LEGAL_REVIEW_PENDING.
-/

namespace JapanTaxLaw.ResidentCopyTwoMonthElapsed

/-- 原文の「二」= 2（月数）。 -/
def elapsedMonths : Nat := 2

/-- 二月を経過した日後に交付されたか（厳密に後）。 -/
def qualified (transferMonth issuedMonth : Nat) : Bool :=
  transferMonth + elapsedMonths < issuedMonth

theorem months_is_two : elapsedMonths = 2 := rfl

-- 境界: ちょうど二月は false、二月を一日でも越えれば true
theorem at_two_months : qualified 3 5 = false := by decide
theorem one_month_after : qualified 3 6 = true := by decide
theorem two_months_after : qualified 3 7 = true := by decide

-- 他の境界
theorem zero_transfer : qualified 0 2 = false := by decide
theorem zero_transfer_later : qualified 0 3 = true := by decide
theorem far_later : qualified 1 100 = true := by decide

end JapanTaxLaw.ResidentCopyTwoMonthElapsed
