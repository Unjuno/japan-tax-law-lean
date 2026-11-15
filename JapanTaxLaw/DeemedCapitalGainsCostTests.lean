import JapanTaxLaw.DeemedCapitalGainsCost

/-!
# DeemedCapitalGainsCost tests — 租税特別措置法 art. 31の4 smoke checks

Decidable smoke tests for the long-term capital gains deemed-cost slice, pinned to
  Law id: 332AC0000000026
  Revision: 332AC0000000026_20261101_507AC0000000013
  Amendment enforcement date: 2026-11-01

Each `example` covers an art. 31の4(1) boundary: the two eligibility gates
(個人・昭和二十七年十二月三十一日以前から引き続き所有), the 5% deemed-cost
threshold, the alternative proven-documented-cost fallback, zero transfer
price, and the cutoff edge at 5%.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

-- art. 31の4(1): 個人が昭和二十七年十二月三十一日以前から引き続き所有
example : deemedCost ⟨true, true, 100_000_000, 0, false⟩ = 5_000_000 := by decide

-- art. 31の4(1) 但書: 証明された金額が百分の五の金額より大きい
example : deemedCost ⟨true, true, 100_000_000, 20_000_000, true⟩ = 20_000_000 := by decide

-- art. 31の4(1) 但書: 証明された金額が百分の五の金額に満たない
example : deemedCost ⟨true, true, 100_000_000, 4_999_999, true⟩ = 5_000_000 := by decide
example : deemedCost ⟨true, true, 100_000_000, 5_000_000, true⟩ = 5_000_000 := by decide
example : deemedCost ⟨true, true, 100_000_000, 5_000_001, true⟩ = 5_000_001 := by decide

-- art. 31の4(1): 証明不能なら百分の五
example : deemedCost ⟨true, true, 100_000_000, 99_000_000_000, false⟩ = 5_000_000 := by decide

-- 柱書要件を満たさない
example : deemedCost ⟨false, true, 100_000_000, 20_000_000, true⟩ = 0 := by decide
example : deemedCost ⟨true, false, 100_000_000, 20_000_000, true⟩ = 0 := by decide
example : deemedCost ⟨false, false, 100_000_000, 20_000_000, true⟩ = 0 := by decide

-- ゼロ
example : deemedCost ⟨true, true, 0, 0, true⟩ = 0 := by decide
example : deemedCost ⟨true, true, 0, 20_000_000, true⟩ = 20_000_000 := by decide

-- 百分の五の端数
example : deemedCost ⟨true, true, 20, 0, false⟩ = 1 := by decide
example : deemedCost ⟨true, true, 19, 0, false⟩ = 0 := by decide
example : deemedCost ⟨true, true, 101, 0, false⟩ = 5 := by decide

-- 証明額が非常に大きい場合（百分の五より証明額が小さければ百分の五）
example : deemedCost ⟨true, true, 50_000_000, 10_000_000, true⟩ = 10_000_000 := by decide
example : deemedCost ⟨true, true, 99_999_999, 5_000_000, true⟩ = 5_000_000 := by decide

-- 適格要件スモーク（同じ facts で2回計算 → 同じ値）
example :
    deemedCost ⟨true, true, 25_000_000, 4_000_000, true⟩ =
    4_000_000 := by decide

end JapanTaxLaw
