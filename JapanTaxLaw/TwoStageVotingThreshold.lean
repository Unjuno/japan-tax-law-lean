import JapanTaxLaw.TaxFinance

/-
# TwoStageVotingThreshold — 税理士法施行令 第九条（総会の議事: 二段階の議決要件）

Pinned source:
  Law id: 326CO0000000216
  Official title: 税理士法施行令
  Law number: 昭和二十六年政令第二百十六号
  Law type: CabinetOrder (政令)
  Revision: 326CO0000000216_20240401_505CO0000000146
  Raw snapshot: data/raw/326CO0000000216_20240401_505CO0000000146.law.json
  sha256: 346e24c2512be9a2ef3524e48a54b67b3bff30d1d81468f69e3f39b92cf8d296
  Statutory article: 第九条 (art. 9; raw JSON Article attr.Num = "9").
  Source path: law_full_text → Article[Num=9] → Paragraph[Num=1] →
    ParagraphSentence → Sentence[Num=1] (verified by independent re-extraction:
    structural hit in law_full_text, needle verbatim exactly once in the whole
    raw file, 83151 raw bytes).

原文逐語（pinned, 一字一句改変なし）:
  「税理士会の総会の議事は、会員の二分の一以上の者が出席し、その出席者の過半数で決するものとし、可否同数のときは、議長の決するところによる。」

Variable contract:
  `present : Nat` = 出席者数 (number of attending members).
  `total : Nat` = 会員総数 (total number of members).
  `yes : Nat` = 賛成者数 (number of votes in favour).
  二分の一 = 1/2 = one half; 「以上」 = INCLUSIVE (>=), so exactly 1/2 suffices.
  過半数 = MORE than half = STRICT (>), so exactly 1/2 does NOT suffice.
  可否同数 (yes * 2 == present, a tie) is decided by the 議長 (chair). The text
  gives NO numeric rule for that tie-break: it is OUT OF SCOPE, noted only.

Algebra (exact integer cross-multiplication, no division/rounding):
  Quorum:  present / total >= 1 / 2  ⇔  2 * present >= total   (total > 0).
  Majority: yes / present > 1 / 2    ⇔  2 * yes > present     (present > 0).
  `quorumMet present total := decide (total > 0 && 2 * present >= total)`.
  `majorityFor yes present := decide (present > 0 && 2 * yes > present)`.
  The `> 0` guards make an undefined (zero-denominator) ratio false. Note the
  two stages use different operators: 以上 is inclusive, 過半数 is strict.

Scope: ONLY the two explicit numeric voting thresholds of 第九条第一項 are
modelled — the 1/2 attendance quorum and the strict majority of attendees.
The 可否同数 chair tie-break, 第九条第二項 (the 三分の二 supermajority for a
special meeting), the remaining paragraphs, the meeting procedure and other
articles are NOT MODELLED.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.TwoStageVotingThreshold

/-- 「会員の二分の一以上の者が出席」: 二分の一 = 1/2, 以上 INCLUSIVE (>=). -/
def quorumMet (present total : Nat) : Bool :=
  decide (total > 0 && 2 * present >= total)

/-- 「その出席者の過半数で決する」: 過半数 = STRICT > 1/2 (not 以上). -/
def majorityFor (yes present : Nat) : Bool :=
  decide (present > 0 && 2 * yes > present)

/-- Exactly 1/2: 2 * 1 = 2 >= 2; 以上 is inclusive. -/
theorem quorum_one_of_two_true : quorumMet 1 2 = true := by
  unfold quorumMet
  have h : 2 * 1 >= 2 := by omega
  simp [h]

/-- 0 of 2: 2 * 0 = 0 < 2, so no quorum. -/
theorem quorum_zero_of_two_false : quorumMet 0 2 = false := by
  unfold quorumMet
  have h : ¬ 2 * 0 >= 2 := by omega
  simp [h]

/-- 1 of 3 = 1/3 < 1/2: 2 * 1 = 2 < 3, so the quorum is NOT met. -/
theorem quorum_one_of_three_false : quorumMet 1 3 = false := by
  unfold quorumMet
  have h : ¬ 2 * 1 >= 3 := by omega
  simp [h]

/-- 2 of 3 >= 1/2: 2 * 2 = 4 >= 3; quorum first met at present = 2. -/
theorem quorum_two_of_three_true : quorumMet 2 3 = true := by
  unfold quorumMet
  have h : 2 * 2 >= 3 := by omega
  simp [h]

/-- Zero total: the ratio is undefined (zero denominator), so false. -/
theorem quorum_zero_total_false : quorumMet 0 0 = false := by
  unfold quorumMet
  have h : ¬ 0 > 0 := by omega
  simp [h]

/-- 2 of 3 > 1/2: 2 * 2 = 4 > 3; 過半数 passes. -/
theorem majority_two_of_three_true : majorityFor 2 3 = true := by
  unfold majorityFor
  have h : 2 * 2 > 3 := by omega
  simp [h]

/-- 1 of 2 is a tie (2 * 1 = 2, not > 2): 過半数 strict => false. -/
theorem majority_one_of_two_tie_false : majorityFor 1 2 = false := by
  unfold majorityFor
  have h : ¬ 2 * 1 > 2 := by omega
  simp [h]

/-- 2 of 4 is also a tie (2 * 2 = 4, not > 4): false. -/
theorem majority_two_of_four_tie_false : majorityFor 2 4 = false := by
  unfold majorityFor
  have h : ¬ 2 * 2 > 4 := by omega
  simp [h]

/-- 2 of 2 is unanimous (2 * 2 = 4 > 2), NOT a tie: 過半数 passes. -/
theorem majority_two_of_two_unanimous_true : majorityFor 2 2 = true := by
  unfold majorityFor
  have h : 2 * 2 > 2 := by omega
  simp [h]

/-- 3 of 5 > 1/2: 2 * 3 = 6 > 5; passes. -/
theorem majority_three_of_five_true : majorityFor 3 5 = true := by
  unfold majorityFor
  have h : 2 * 3 > 5 := by omega
  simp [h]

/-- Zero attendees: the ratio is undefined (zero denominator), so false. -/
theorem majority_zero_present_false : majorityFor 0 0 = false := by
  unfold majorityFor
  have h : ¬ 0 > 0 := by omega
  simp [h]

end JapanTaxLaw.TwoStageVotingThreshold
