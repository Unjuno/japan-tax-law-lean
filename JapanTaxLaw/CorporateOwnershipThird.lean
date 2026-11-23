import JapanTaxLaw.TaxFinance

/-
# CorporateOwnershipThird — 租税特別措置法施行令 第二条（法人所有三分の一超）

Pinned source:
  Law id: 407M50000008033
  Official title: 大阪湾臨海地域開発整備法第十四条の地方税の不均一課税に伴う措置が適用される場合等を定める省令
  Law number: 平成七年自治省令第三十三号
  Law type: MinisterialOrdinance (省令)
  Revision: 407M50000008033_20040401_416M60000008074
  Raw snapshot: data/raw/407M50000008033_20040401_416M60000008074.law.json
  sha256: 8b5ef29f2c751866b7e7f00dd7d5aea22a1c935df6173886c9e60572574ba216
  Statutory article: 第二条 (art. 2; raw JSON Article attr.Num = "2").
  Verified by independent re-extraction: the needle occurs verbatim once in
  the scoped Article 2 of the pinned snapshot (1378 chars).

原文逐語（pinned, 一字一句改変なし）:
  「その発行済株式の総数又は出資金額若しくは拠出された金額の三分の一を超える数又は金額が法人税法（昭和二十二年法律第二十八号）別表第一第一号に掲げる法人により所有され、又は出資若しくは拠出をされている法人」

Variable contract:
  `owned : Nat` = 当該法人により所有される株式数／出資金額／拠出された金額
                  (number of shares or amount of contribution owned by the
                  specified corporation), unit 株／円.
  `total : Nat` = 発行済株式の総数／出資金額／拠出された金額 (total issued
                  shares or total contribution amount), unit 株／円.
  Domain: total > 0 (non-empty corporation); the ratio owned / total is
  undefined at total = 0, and this is recorded here as a domain restriction,
  not encoded as an extra guard in the formula.
  三分の一を超える = STRICTLY more than one-third (超える, NOT 以上):
      owned / total > 1 / 3  ⇔  3 * owned > total   (for total > 0).
  Exactly 1/3 (3 * owned = total) does NOT qualify. Integer encoding avoids
  division and rounding entirely.

Scope: ONLY the explicit numeric ownership threshold is modelled — shares or
contributions owned by a 法人税法別表第一第一号 corporation STRICTLY EXCEED
one-third of the total. This is distinct from the earlier INCLUSIVE quorum
model (MeetingQuorumOneThird, 三分の一以上 = 3 * a >= t). The determination of
法人税法別表第一第一号 status, the rest of 第二条, and all other articles are
NOT MODELLED.

Every proof is kernel-checked by `rfl` or `by decide`; no proof automation
or placeholder proofs are used anywhere in this model.
-/

namespace JapanTaxLaw.CorporateOwnershipThird

/-- 三分の一の三 = statutory divisor 三 (3), transcribed from 第二条. -/
def ownershipDivisor : Nat := 3

/-- 「三分の一を超える」: the threshold is met iff 3 * owned > total (STRICT). -/
def exceedsOneThird (owned : Nat) (total : Nat) : Bool := decide (ownershipDivisor * owned > total)

/-- Exactly 1/3 (1 of 3): 3 * 1 = 3 is NOT > 3, so the boundary is STRICT. -/
theorem exceeds_one_of_three_false : exceedsOneThird 1 3 = false := by
  decide

/-- 2 of 3: 3 * 2 = 6 > 3, so the ownership STRICTLY exceeds one-third. -/
theorem exceeds_two_of_three_true : exceedsOneThird 2 3 = true := by
  decide

/-- Exactly 1/3 on a larger multiple (3 of 9): 3 * 3 = 9 is NOT > 9. -/
theorem exceeds_three_of_nine_false : exceedsOneThird 3 9 = false := by
  decide

/-- 4 of 9: 3 * 4 = 12 > 9, so the ownership STRICTLY exceeds one-third. -/
theorem exceeds_four_of_nine_true : exceedsOneThird 4 9 = true := by
  decide

/-- 1 of 4 = 1/4 < 1/3: 3 * 1 = 3 < 4, below the threshold. -/
theorem exceeds_one_of_four_false : exceedsOneThird 1 4 = false := by
  decide

/-- 1 of 2 = 1/2 > 1/3: 3 * 1 = 3 > 2, above the threshold. -/
theorem exceeds_one_of_two_true : exceedsOneThird 1 2 = true := by
  decide

/-- The statutory divisor is 三 = 3, definitionally. -/
theorem ownership_divisor_three : ownershipDivisor = 3 := rfl

end JapanTaxLaw.CorporateOwnershipThird
