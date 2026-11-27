import Std
import JapanTaxLaw.TaxFinance

/-
# FirstDemandNoticeDate — 国税通則法施行令 第二条の二十五 第一項 第四号
（納税告知書を二回以上発した場合には、その最初に発した日）

Pinned sources:
  Law id: 337CO0000000135 (国税通則法施行令)
  Revision: 337CO0000000135_20260401_507CO0000000126 (enforced 2026-04-01)
  Raw snapshot: data/raw/337CO0000000135_20260401_507CO0000000126.law.json
  Article Num 25, Paragraph 1, Item 4, Column 2, Sentence 1.
  source_path: LawBody[3]/MainProvision/MainProvision[5]/Article:25/Article#25/Paragraph#1/Item#4/ItemSentence/Column#2/Sentence#1
  Normative unit: NORM|d73fe09552dcdb44f5f620ae106ca56dfbda8abb1cda237038fa437502e6cb77

Verbatim 原文 needle (scoped to Article 25 Item 4):
  「当該告知書を二回以上にわたつて発した場合には、その最初に発した日」

Variable contract:
  first = 最初の納税告知書の発した日 (caller-established day index)
  rest  = その後に発した納税告知書の日付の列 (caller-established)
  repeatedNotices n = 二回以上 = (2 <= n)
  noticeDate first rest = rest の最小値（first を含む全発行日の最早）

「二回以上」 selects the earliest-issuance-date branch; with a single notice the
same function returns that sole date. The caller establishes the ordered list
of issuance days; calendar validity and notice existence are out of scope.

Scope: ONLY this earliest-date selector and the 二回以上 predicate. The tax
category, notice validity, delinquency-tax rate/period arithmetic, item 5's
analogous rule and all other articles are NOT MODELLED. No legal review.
-/

namespace JapanTaxLaw.FirstDemandNoticeDate

/-- 原文の「二」= 2（回数の分岐点、以上は inclusive）。 -/
def noticeCountFloor : Nat := 2

/-- 二回以上にわたつて発したか。 -/
def repeatedNotices (count : Nat) : Bool :=
  noticeCountFloor <= count

/-- 全発行日の最早（最初に発した日）。 -/
def noticeDate (first : Nat) (rest : List Nat) : Nat :=
  rest.foldl Nat.min first

theorem floor_is_two : noticeCountFloor = 2 := rfl

-- 境界: 1 回 / 2 回 / 3 回
theorem one_notice : repeatedNotices 1 = false := by decide
theorem two_notices : repeatedNotices 2 = true := by decide
theorem three_notices : repeatedNotices 3 = true := by decide

-- 日付選択: 単一 / 複数 / 未整列 / 同日
theorem single_notice_date : noticeDate 10 [] = 10 := by decide
theorem two_notice_dates : noticeDate 10 [12] = 10 := by decide
theorem reversed_notice_dates : noticeDate 10 [8] = 8 := by decide
theorem three_notice_dates : noticeDate 10 [12, 7] = 7 := by decide
theorem equal_notice_dates : noticeDate 10 [10] = 10 := by decide

end JapanTaxLaw.FirstDemandNoticeDate
