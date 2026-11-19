import JapanTaxLaw.LandValueTaxBasicDeduction

/-!
# LandValueTaxBasicDeduction tests — kernel-decided smoke checks

Decidable smoke tests for the 地価税法 art. 18 bounded model, pinned to

  Law id: 403AC0000000069
  Revision: 403AC0000000069_20250601_504AC0000000068
  Amendment enforcement date: 2025-06-01

No new theorem names are introduced; every check is an `example ... := by decide`.
Boundaries covered: 一号 > 二号 (土地等なし), 二号 > 一号 (面積 40_000 / 60_000),
二分の一適用 (前条係数 ⟨1,2⟩), 割合 0, 面積 0, 同値 (max の一致点), 区画の連結。
前条適用判定・相互会社該当性・割合・面積は caller-established であり、
本ファイルではそれらを決め打ちした値のみを検査する。
-/

namespace JapanTaxLaw.LandValueTaxBasicDeduction

open JapanTaxLaw.TaxFinance

-- ==== 金額定数（原文「一億円」「十億円」「十五億円」「三万円」） ====

example : capitalThreshold = 100_000_000 := by decide
example : item1LargeCorpAmount = 1_000_000_000 := by decide
example : item1OtherAmount = 1_500_000_000 := by decide
example : unitPriceBase = 30_000 := by decide
example : item1LargeCorpAmount < item1OtherAmount := by decide

-- ==== 前条係数 ====

example : prevNoAdjust.numDen = (1, 1) := by decide
example : prevHalf.numDen = (1, 2) := by decide

-- ==== 一号: 区分に応じた金額 ====

example : item1Amount .largeCorp = 1_000_000_000 := by decide
example : item1Amount .individualOrOther = 1_500_000_000 := by decide
example : 0 < item1Amount .largeCorp := by decide
example : item1Amount .largeCorp < item1Amount .individualOrOther := by decide

-- ==== 二号: 一平方メートル当たり金額（イ / ロ / ハ、二分の一、割合 0） ====

example : unitPricePerSqm .noLeasehold ⟨1, 1, by decide⟩ ⟨1, 1, by decide⟩ = 30_000 := by decide
example : unitPricePerSqm .noLeasehold ⟨1, 1, by decide⟩ ⟨1, 2, by decide⟩ = 15_000 := by decide
example : unitPricePerSqm .leaseholdRight ⟨7, 10, by decide⟩ ⟨1, 1, by decide⟩ = 21_000 := by decide
example : unitPricePerSqm .leaseholdRight ⟨7, 10, by decide⟩ ⟨1, 2, by decide⟩ = 10_500 := by decide
example : unitPricePerSqm .underlyingLand ⟨3, 10, by decide⟩ ⟨1, 1, by decide⟩ = 9_000 := by decide
example : unitPricePerSqm .underlyingLand ⟨3, 10, by decide⟩ ⟨1, 2, by decide⟩ = 4_500 := by decide
example : unitPricePerSqm .leaseholdRight ⟨0, 1, by decide⟩ ⟨1, 1, by decide⟩ = 0 := by decide
example : unitPricePerSqm .underlyingLand ⟨0, 1, by decide⟩ ⟨1, 1, by decide⟩ = 0 := by decide

-- ==== 二号: 区画金額（面積 0 / 二分の一 / 割合 0） ====

example : parcelAmount { cls := .noLeasehold, ratio := ⟨1, 1, by decide⟩, prev := ⟨1, 1, by decide⟩, area := 0 } = 0 := by decide
example : parcelAmount { cls := .noLeasehold, ratio := ⟨1, 1, by decide⟩, prev := ⟨1, 1, by decide⟩, area := 100 } = 3_000_000 := by decide
example : parcelAmount { cls := .noLeasehold, ratio := ⟨1, 1, by decide⟩, prev := ⟨1, 2, by decide⟩, area := 100 } = 1_500_000 := by decide
example : parcelAmount { cls := .leaseholdRight, ratio := ⟨0, 1, by decide⟩, prev := ⟨1, 1, by decide⟩, area := 1_000 } = 0 := by decide
example : parcelAmount { cls := .underlyingLand, ratio := ⟨0, 1, by decide⟩, prev := ⟨1, 1, by decide⟩, area := 1_000 } = 0 := by decide

-- ==== 二号: 合計額（複数区画、順序非依存、空リスト） ====

example : item2Amount [] = 0 := by decide
example : item2Amount
    [ { cls := .noLeasehold, ratio := ⟨1, 1, by decide⟩, prev := ⟨1, 1, by decide⟩, area := 100 }
    , { cls := .leaseholdRight, ratio := ⟨7, 10, by decide⟩, prev := ⟨1, 1, by decide⟩, area := 1_000 }
    ] = 3_000_000 + 21_000_000 := by decide
example : item2Amount
    [ { cls := .leaseholdRight, ratio := ⟨7, 10, by decide⟩, prev := ⟨1, 1, by decide⟩, area := 1_000 }
    , { cls := .noLeasehold, ratio := ⟨1, 1, by decide⟩, prev := ⟨1, 1, by decide⟩, area := 100 }
    ] = 3_000_000 + 21_000_000 := by decide

-- ==== 基礎控除: 一号 > 二号（土地等なし → 二号 = 0） ====

example : basicDeduction .largeCorp [] = 1_000_000_000 := by decide
example : basicDeduction .individualOrOther [] = 1_500_000_000 := by decide

-- ==== 基礎控除: 二号 > 一号（面積 40_000 / 60_000） ====

example : basicDeduction .largeCorp [{ cls := .noLeasehold, ratio := ⟨1, 1, by decide⟩, prev := ⟨1, 1, by decide⟩, area := 40_000 }] = 1_200_000_000 := by decide
example : basicDeduction .individualOrOther [{ cls := .noLeasehold, ratio := ⟨1, 1, by decide⟩, prev := ⟨1, 1, by decide⟩, area := 60_000 }] = 1_800_000_000 := by decide

-- ==== 基礎控除: 二分の一適用 / 割合 0 / 面積 0 では二号が一号を超えない ====

example : item2Amount [{ cls := .noLeasehold, ratio := ⟨1, 1, by decide⟩, prev := ⟨1, 2, by decide⟩, area := 100 }] = 1_500_000 := by decide
example : basicDeduction .largeCorp [{ cls := .noLeasehold, ratio := ⟨1, 1, by decide⟩, prev := ⟨1, 2, by decide⟩, area := 100 }] = 1_000_000_000 := by decide
example : basicDeduction .largeCorp [{ cls := .leaseholdRight, ratio := ⟨0, 1, by decide⟩, prev := ⟨1, 1, by decide⟩, area := 1_000 }] = 1_000_000_000 := by decide
example : basicDeduction .largeCorp [{ cls := .noLeasehold, ratio := ⟨1, 1, by decide⟩, prev := ⟨1, 1, by decide⟩, area := 0 }] = 1_000_000_000 := by decide

-- ==== 基礎控除: 同値（max の一致点）と境界をまたぐ単調性 ====

example : basicDeduction .largeCorp [{ cls := .noLeasehold, ratio := ⟨1, 1, by decide⟩, prev := ⟨1, 1, by decide⟩, area := 33_333 }] = 1_000_000_000 := by decide
example : basicDeduction .largeCorp [{ cls := .noLeasehold, ratio := ⟨1, 1, by decide⟩, prev := ⟨1, 1, by decide⟩, area := 33_334 }] = 1_000_020_000 := by decide
example : basicDeduction .largeCorp [{ cls := .noLeasehold, ratio := ⟨1, 1, by decide⟩, prev := ⟨1, 1, by decide⟩, area := 40_000 }] ≥
    basicDeduction .largeCorp [{ cls := .noLeasehold, ratio := ⟨1, 1, by decide⟩, prev := ⟨1, 2, by decide⟩, area := 40_000 }] := by decide

end JapanTaxLaw.LandValueTaxBasicDeduction
