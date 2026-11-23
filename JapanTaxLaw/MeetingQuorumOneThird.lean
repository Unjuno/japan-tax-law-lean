import JapanTaxLaw.TaxFinance

/-
# MeetingQuorumOneThird — 関税・外国為替等審議会令 第九条（三分の一以上の出席）

Pinned source:
  Law id: 412CO0000000276
  Official title: 関税・外国為替等審議会令
  Law number: 平成十二年政令第二百七十六号
  Law type: CabinetOrder (政令)
  Revision: 412CO0000000276_20260401_508CO0000000085
  Raw snapshot: data/raw/412CO0000000276_20260401_508CO0000000085.law.json
  sha256: e7d2da2024d3909ca5b0db031f8a2bba4e9b6e4e221e9c8d94eaa74e95a9bd18
  Statutory article: 第九条 (art. 9; raw JSON Article attr.Num = "9").
  Verified by independent re-extraction: the needle occurs verbatim once in
  the scoped Article 9 of the pinned snapshot (155 chars).

原文逐語（pinned, 一字一句改変なし）:
  「審議会は、委員及び議事に関係のある臨時委員の三分の一以上が出席しなければ、会議を開き、議決することができない。」

Variable contract:
  `a : Nat` = 出席者数 (number attending), unit 人.
  `t : Nat` = 委員及び議事に関係のある臨時委員の総数 (total of members and
              temporary members), unit 人.
  Domain: t > 0 (non-empty council); the ratio a / t is undefined at t = 0,
  and this condition is recorded here as a domain restriction, not encoded
  as an extra guard in the formula.
  三分の一以上 = at least one-third, INCLUSIVE (>=):
      a / t >= 1 / 3  ⇔  3 * a >= t   (for t > 0).
  Exact integer cross-multiplication only: no division and no rounding.

Scope: ONLY the explicit quorum ratio is modelled — a meeting may be opened
  and a resolution passed only if at least one-third of (委員 + 議事に関係のある
  臨時委員) attend. The 会議を開き議決する procedure, the composition and
  appointment of 審議会, the remaining text of 第九条 and all other articles
  are NOT MODELLED.

Every proof is kernel-checked by `rfl` or `by decide`; no proof automation
or placeholder proofs are used anywhere in this model.
-/

namespace JapanTaxLaw.MeetingQuorumOneThird

/-- 三分の一の三 = statutory divisor 三 (3), transcribed from 第九条. -/
def quorumDivisor : Nat := 3

/-- 「三分の一以上の出席」: the quorum is met iff 3 * a >= t (INCLUSIVE). -/
def quorumMet (a : Nat) : Nat -> Bool := fun t => decide (quorumDivisor * a >= t)

/-- Exactly 1/3 (1 of 3): 3 * 1 = 3 >= 3, so the boundary is INCLUSIVE. -/
theorem quorum_one_of_three_true : quorumMet 1 3 = true := by
  decide

/-- 0 of 3 = 0 < 1/3: an empty attendance cannot open the meeting. -/
theorem quorum_zero_of_three_false : quorumMet 0 3 = false := by
  decide

/-- 1 of 4 = 1/4 < 1/3: 3 * 1 = 3 < 4, so the quorum is not met. -/
theorem quorum_one_of_four_false : quorumMet 1 4 = false := by
  decide

/-- 2 of 4 = 1/2 >= 1/3: 3 * 2 = 6 >= 4, so the quorum is met. -/
theorem quorum_two_of_four_true : quorumMet 2 4 = true := by
  decide

/-- 3 of 9 = 1/3 exactly: 3 * 3 = 9 >= 9, INCLUSIVE at the boundary. -/
theorem quorum_three_of_nine_true : quorumMet 3 9 = true := by
  decide

/-- The statutory divisor is 三 = 3, definitionally. -/
theorem quorum_divisor_three : quorumDivisor = 3 := rfl

end JapanTaxLaw.MeetingQuorumOneThird
