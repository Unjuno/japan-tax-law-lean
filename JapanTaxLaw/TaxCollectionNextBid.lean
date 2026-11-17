import JapanTaxLaw.TaxFinance

/-!
# TaxCollectionNextBid — 国税徴収法 art. 104の2（次順位買受申込者の決定）L4 モデル

Source (pinned):

  Law id: 334AC0000000147
  Revision: 334AC0000000147_20260525_506AC0000000052
  Amendment enforcement date: 2026-05-25
  Raw snapshot: data/raw/334AC0000000147_20260525_506AC0000000052.law.json

Models the computable core of art. 104の2(1) — pinned bytes 逐語:

  「最高価申込者の入札価額（…「最高入札価額」という。）に次ぐ高い価額
    （見積価額以上で、かつ、最高入札価額から公売保証金の額を控除した金額以上である
    ものに限る。）による入札者…から次順位による買受けの申込みがあるときは、
    その者を次順位買受申込者として定めなければならない。」

Computation (Money = Nat):

  nextBidFloor estimate highestBid deposit =
    max estimate (highestBid - deposit)   -- saturating Nat subtraction

  nextBidEligible estimate highestBid deposit bid =
    bid < highestBid && nextBidFloor estimate highestBid deposit ≤ bid

Scope & honest boundaries:

* 入札価額・見積価額・公売保証金・入札者は caller-established。本モデルは
  「どの価額が次順位として適格か」の算術条件のみを扱う。
* 第2項（申込时期）、第3項（同額二人以上のくじ）、art. 104(2)（最高価申込者を
  くじで定めた場合の特例）は法的手続 — NOT MODELLED / caller-established。
* 丸めの規定は本条になく、金額は円単位の Nat。
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- art. 104の2(1) — 次順位入札価額の下限。 -/
def nextBidFloor (estimate highestBid deposit : Money) : Money :=
  max estimate (highestBid - deposit)

/-- art. 104の2(1) — 入札価額が次順位として適格か。 -/
def nextBidEligible (estimate highestBid deposit bid : Money) : Bool :=
  decide (bid < highestBid && nextBidFloor estimate highestBid deposit ≤ bid)

-- ==== verified facts ====

theorem nextBidFloor_ge_estimate (estimate highestBid deposit : Money) :
    estimate ≤ nextBidFloor estimate highestBid deposit := by
  unfold nextBidFloor
  exact Nat.le_max_left _ _

theorem nextBidFloor_ge_highest_minus_deposit (estimate highestBid deposit : Money) :
    highestBid - deposit ≤ nextBidFloor estimate highestBid deposit := by
  unfold nextBidFloor
  exact Nat.le_max_right _ _

theorem nextBidEligible_iff (estimate highestBid deposit bid : Money) :
    nextBidEligible estimate highestBid deposit bid = true ↔
      bid < highestBid && nextBidFloor estimate highestBid deposit ≤ bid := by
  unfold nextBidEligible
  constructor
  · intro h
    exact of_decide_eq_true h
  · intro h
    exact decide_eq_true h

theorem nextBidEligible_excludes_highest (estimate deposit bid : Money) :
    nextBidEligible estimate bid deposit bid = false := by
  unfold nextBidEligible nextBidFloor
  simp

theorem nextBidEligible_excludes_below_floor (estimate highestBid deposit bid : Money)
    (h : bid < nextBidFloor estimate highestBid deposit) :
    nextBidEligible estimate highestBid deposit bid = false := by
  unfold nextBidEligible
  simp [h]

-- ==== kernel-decided smoke checks ====

-- 見積100万、最高200万、保証金20万 → 下限 max(100万,180万)=180万
example : nextBidFloor 1_000_000 2_000_000 200_000 = 1_800_000 := by decide
-- 見積が高い場合: 見積190万、最高200万、保証金20万 → 下限190万
example : nextBidFloor 1_900_000 2_000_000 200_000 = 1_900_000 := by decide
-- 保証金が最高を超える → saturating 0、下限は見積
example : nextBidFloor 100_000 200_000 300_000 = 100_000 := by decide
-- 適格: 190万は 180万≤190万<200万 → true
example : nextBidEligible 1_000_000 2_000_000 200_000 1_900_000 = true := by decide
-- 不適格: 最高と同額 / 下限未満
example : nextBidEligible 1_000_000 2_000_000 200_000 2_000_000 = false := by decide
example : nextBidEligible 1_000_000 2_000_000 200_000 1_700_000 = false := by decide

end JapanTaxLaw
