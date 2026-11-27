import JapanTaxLaw.FirstDemandNoticeDate
import JapanTaxLaw.FirstDemandNoticeDateSpec

/-
# FirstDemandNoticeDateTests — 国税通則法施行令 25(1)(4) の kernel-decided 検証

Pinned: law 337CO0000000135 / revision 337CO0000000135_20260401_507CO0000000126.
Coverage: 1/2/3-notice threshold boundary, single/reversed/unsorted/equal
issuance dates and impl/spec agreement.
-/

namespace JapanTaxLaw.FirstDemandNoticeDate

example : noticeCountFloor = 2 := by decide

-- 境界: 一回来 / 二回以上
example : repeatedNotices 0 = false := by decide
example : repeatedNotices 1 = false := by decide
example : repeatedNotices 2 = true := by decide
example : repeatedNotices 3 = true := by decide

-- 発行日の最早
example : noticeDate 10 [] = 10 := by decide
example : noticeDate 10 [12] = 10 := by decide
example : noticeDate 10 [8] = 8 := by decide
example : noticeDate 10 [12, 7] = 7 := by decide
example : noticeDate 10 [10] = 10 := by decide

-- impl / 独立仕様の一致
example : noticeCountFloor = specThreshold := by decide
example : repeatedNotices 1 = specRepeated 1 := by decide
example : repeatedNotices 2 = specRepeated 2 := by decide
example : repeatedNotices 3 = specRepeated 3 := by decide
example : noticeDate 10 [] = specEarliest 10 [] := by decide
example : noticeDate 10 [12] = specEarliest 10 [12] := by decide
example : noticeDate 10 [8] = specEarliest 10 [8] := by decide
example : noticeDate 10 [12, 7] = specEarliest 10 [12, 7] := by decide
example : noticeDate 10 [10] = specEarliest 10 [10] := by decide

end JapanTaxLaw.FirstDemandNoticeDate
