import JapanTaxLaw.FirstDemandNoticeDate

/-
# FirstDemandNoticeDateSpec — 国税通則法施行令 25(1)(4) の独立定式

Pinned: law 337CO0000000135, revision 337CO0000000135_20260401_507CO0000000126,
Article 25 Paragraph 1 Item 4; needle 「…二回以上にわたつて発した場合には、
その最初に発した日」.

Independent restatement: a notice count of at least two triggers the
earliest-date branch; the operative date is the minimum over all issuance days.
Definitions use their own numerals and no implementation identifiers; bridges
are separate.
-/

namespace JapanTaxLaw.FirstDemandNoticeDate

/-- 独立定式: 二 = 2。 -/
def specThreshold : Nat := 2

/-- 独立定式: count >= 2。 -/
def specRepeated (count : Nat) : Bool :=
  specThreshold <= count

/-- 独立定式: 発行日の列の最小（impl 識別子は使わない）。 -/
def specEarliest (first : Nat) (rest : List Nat) : Nat :=
  rest.foldl Nat.min first

theorem agreeThreshold : noticeCountFloor = specThreshold := by
  unfold noticeCountFloor specThreshold
  rfl

theorem agreeRepeated (count : Nat) :
    repeatedNotices count = specRepeated count := by
  unfold repeatedNotices specRepeated
  rw [agreeThreshold]

theorem agreeDate (first : Nat) (rest : List Nat) :
    noticeDate first rest = specEarliest first rest := by
  unfold noticeDate specEarliest
  rfl

example : specRepeated 1 = false := by decide
example : specRepeated 2 = true := by decide
example : specEarliest 10 [12, 7] = 7 := by decide

end JapanTaxLaw.FirstDemandNoticeDate
