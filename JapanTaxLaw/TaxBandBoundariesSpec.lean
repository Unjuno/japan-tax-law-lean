/-!
# TaxBandBoundariesSpec — 独立形式仕様

pinned 原文から独立に読み取った仕様。実装 (TaxBandBoundaries.lean) を import しない。

- 347CO0000000151 art.19: 「二百万円以上五百万円未満の金額」 → 2,000,000 <= amount < 5,000,000 (下限包含 / 上限排他)
- 325AC0000000073 art.23: 「残存期間が二十年を超え二十五年以下のもの」 → 20 < years <= 25 (下限排他 / 上限包含)
-/
namespace JapanTaxLaw.TaxBandBoundariesSpec

/-- 原文A: 二百万円以上五百万円未満（円, caller-established Nat）。 -/
def amountBandSpec (amount : Nat) : Prop :=
  2_000_000 <= amount ∧ amount < 5_000_000

/-- 原文B: 二十年を超え二十五年以下（年, caller-established Nat）。 -/
def periodBandSpec (years : Nat) : Prop :=
  20 < years ∧ years <= 25

end JapanTaxLaw.TaxBandBoundariesSpec
