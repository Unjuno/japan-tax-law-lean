import Std
import JapanTaxLaw.TaxFinance

/-
# ForeignVessel24HourDeparture — 関税法施行規則 第二条の二 第三項 第四号
（旅客乗船の外国貿易船が入港の時から二十四時間以内に出港する場合）

Pinned sources:
  Law id: 341M50000040055 (関税法施行規則)
  Revision: 341M50000040055_20260601_508M60000040016 (enforced 2026-06-01)
  Raw snapshot: data/raw/341M50000040055_20260601_508M60000040016.law.json
  Article Num 2_2, Paragraph 3, Item 4, ItemSentence, Column#1, Sentence#1.
  source_path: LawBody[2]/MainProvision/MainProvision[19]/Article:2_2/Article#2_2/Paragraph#3/Item#4/ItemSentence/Column#1/Sentence#1
  Normative unit: NORM|1fead5494e575bc7b3e6e79e70cc06d15c7105a4f1d8308fcca277ecfe394ed5

Verbatim 原文 needle (scoped to Article 2_2 Paragraph 3 Item 4 Column#1):
  「旅客が乗船している外国貿易船が乗組員の携帯品、郵便物及び船用品以外の貨物の積卸しをしないで入港の時から二十四時間以内に出港する場合」

Variable contract (elapsed whole hours; caller-established):
  hours = 入港の時から出港までの経過時間（時間単位、自然数）
  limit = 二十四 = 24
  within24h hours = hours <= limit   （「以内」は上限を含む）

Out of scope: whether non-exempt cargo was handled (input predicate), vessel/
passenger classification, the reporting duty itself, calendar rollover, minutes/
seconds, time zones, sibling item 3 (十四日以内) and item 5 (三十分), legal
effects and approvals. No human legal review; LEGAL_REVIEW_PENDING.
-/

namespace JapanTaxLaw.ForeignVessel24HourDeparture

/-- 原文の「二十四」= 24（時間）。 -/
def hourLimit : Nat := 24

/-- 入港の時から二十四時間以内（上限 inclusive）。 -/
def within24h (hours : Nat) : Bool :=
  hours <= hourLimit

theorem limit_is_24 : hourLimit = 24 := rfl

-- 「以内」境界: 0/23/24 true、25 false
theorem zero_hours : within24h 0 = true := by decide
theorem one_hour : within24h 1 = true := by decide
theorem twenty_three_hours : within24h 23 = true := by decide
theorem exactly_24_hours : within24h 24 = true := by decide
theorem twenty_five_hours : within24h 25 = false := by decide
theorem far_later : within24h 100 = false := by decide

end JapanTaxLaw.ForeignVessel24HourDeparture
