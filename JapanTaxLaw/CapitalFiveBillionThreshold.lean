import JapanTaxLaw.TaxFinance

/-
# CapitalFiveBillionThreshold — 国税局課税部等の統括国税調査官等の所掌に属する事務の範囲を定める省令 第二条

Pinned source:
  Law id: 352M50000040032
  Official title: 国税局課税部等の統括国税調査官等の所掌に属する事務の範囲を定める省令
  Law type: MinisterialOrdinance (省令)
  Revision: 352M50000040032_20220710_504M60000040044
  Raw snapshot: data/raw/352M50000040032_20220710_504M60000040044.law.json
  sha256: d626cf16d9fed1f7c4c51c463edd7e23b40bd66063cbbd79f3fe3055324610ed
  Statutory article: 第二条 (art. 2)

原文逐語（pinned, 一字一句改変なし, table-cell condition）:
  「当該法人の資本金額又は出資金額が五十億円以上であること」

Variable contract:
  `capitalFloor : Nat := 5_000_000_000` = 五十億円, inclusive lower bound (以上).
  `atLeastCapitalFloor (amount : Nat) : Bool := capitalFloor <= amount`.
  Unit 円; domain Nat (whole yen). 「以上」 = inclusive >=.

Scope: ONLY the explicit numeric condition is modelled — a corporation's capital
or contribution amount is at least 五十億円. The rest of the 第二条 table
(other cells/rows), the assignment of duties to officials, the other articles,
and all enforcement/operational rules are NOT MODELLED.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.CapitalFiveBillionThreshold

/-- 五十億円 — inclusive lower bound (以上). Unit 円; domain Nat. -/
def capitalFloor : Nat := 5_000_000_000

/-- 「資本金額又は出資金額が五十億円以上」: amount is at least ¥5,000,000,000. -/
def atLeastCapitalFloor (amount : Nat) : Bool :=
  capitalFloor <= amount

/-- Below the floor (4,999,999,999 < 五十億円) the condition is false. -/
theorem below_floor_false : atLeastCapitalFloor 4_999_999_999 = false := by
  unfold atLeastCapitalFloor capitalFloor
  decide

/-- 以上 is inclusive: both the floor itself and one yen above qualify. -/
theorem at_or_above_floor_true :
    atLeastCapitalFloor 5_000_000_000 = true ∧
    atLeastCapitalFloor 5_000_000_001 = true := by
  constructor
  · unfold atLeastCapitalFloor capitalFloor
    decide
  · unfold atLeastCapitalFloor capitalFloor
    decide

/-- Zero capital/contribution does not satisfy the condition. -/
theorem zero_false : atLeastCapitalFloor 0 = false := by
  unfold atLeastCapitalFloor capitalFloor
  decide

end JapanTaxLaw.CapitalFiveBillionThreshold
