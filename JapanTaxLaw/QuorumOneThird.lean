import JapanTaxLaw.TaxFinance

/-
# QuorumOneThird — 関税等不服審査会令 第七条（会議の定足数: 三分の一以上）

Pinned source:
  Law id: 412CO0000000277
  Official title: 関税等不服審査会令
  Law number: 平成十二年政令第二百七十七号
  Law type: CabinetOrder (政令)
  Revision: 412CO0000000277_20160401_428CO0000000168
  Raw snapshot: data/raw/412CO0000000277_20160401_428CO0000000168.law.json
  sha256: c473d24ee2e16ec16f15f5ff52b870890a6ae70648672b3a47c0c26f75cc7709
  Statutory article: 第七条 (art. 7; raw JSON Article attr.Num = "7").
  Source path: law_full_text → Article[Num=7] (verified by independent
  re-extraction: 1 structural hit, needle verbatim once, raw bytes 16889).

原文逐語（pinned, 一字一句改変なし）:
  「審査会は、委員の三分の一以上が出席しなければ、会議を開き、議決することができない。」

Variable contract:
  `present : Nat` = 出席委員数 (number of commissioners attending).
  `total : Nat` = 委員の総数 (total number of commissioners).
  三分の一 = 1/3 = 三分之一; 「以上」 = INCLUSIVE (>=), so exactly 1/3 suffices.

Algebra (exact integer cross-multiplication, no division/rounding):
  present / total >= 1 / 3  ⇔  3 * present >= total   (total > 0).
  `quorumMet present total := decide (total > 0 && 3 * present >= total)`.
  The `total > 0` guard makes an undefined (zero-denominator) ratio false.
  Note: total = 4 needs 3 * present >= 4, so present = 1 is NOT enough
  (3 < 4, i.e. 1/4 < 1/3); the threshold is first met at present = 2.

Scope: ONLY the explicit quorum condition is modelled — the meeting may be held
and decided only if at least one-third of the commissioners attend. The other
conditions of 第七条, the 会議を開き議決する procedure, the composition of the
commission, other paragraphs and other articles are NOT MODELLED.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.QuorumOneThird

/-- 「委員の三分の一以上が出席」: 三分の一 = 1/3 via exact cross-multiplication. -/
def quorumMet (present total : Nat) : Bool :=
  decide (total > 0 && 3 * present >= total)

/-- Exactly 1/3: 3 * 1 = 3 >= 3; 以上 is inclusive. -/
theorem one_third_exact_true : quorumMet 1 3 = true := by
  unfold quorumMet
  have h : 3 * 1 >= 3 := by omega
  simp [h]

/-- 1/4 < 1/3: 3 * 1 = 3 < 4, so a single attendee among four fails. -/
theorem one_in_four_false : quorumMet 1 4 = false := by
  unfold quorumMet
  have h : ¬ 3 * 1 >= 4 := by omega
  simp [h]

/-- 2/4 >= 1/3: 3 * 2 = 6 >= 4; two attendees among four suffice. -/
theorem two_in_four_true : quorumMet 2 4 = true := by
  unfold quorumMet
  have h : 3 * 2 >= 4 := by omega
  simp [h]

/-- 0/3 = 0 < 1/3: no attendee cannot open the meeting. -/
theorem zero_present_false : quorumMet 0 3 = false := by
  unfold quorumMet
  have h : ¬ 3 * 0 >= 3 := by omega
  simp [h]

/-- 1/2 >= 1/3: 3 * 1 = 3 >= 2. -/
theorem one_in_two_true : quorumMet 1 2 = true := by
  unfold quorumMet
  have h : 3 * 1 >= 2 := by omega
  simp [h]

/-- 2/7 < 1/3: 3 * 2 = 6 < 7, so the quorum is not met. -/
theorem two_in_seven_false : quorumMet 2 7 = false := by
  unfold quorumMet
  have h : ¬ 3 * 2 >= 7 := by omega
  simp [h]

/-- Zero total: the ratio is undefined (zero denominator), so false. -/
theorem zero_total_false : quorumMet 0 0 = false := by
  unfold quorumMet
  have h : ¬ 0 > 0 := by omega
  simp [h]

end JapanTaxLaw.QuorumOneThird
