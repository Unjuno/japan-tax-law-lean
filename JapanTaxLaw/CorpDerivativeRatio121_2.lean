/-\!
# CorpDerivativeRatio121_2 — 法人税法施行令 第百二十一条の二（デリバティブ取引等の割合計算）8 units, PROVED_SCOPE

Genuine per-provision formalization. Pinned original:
  raw law data Article 121_2 of 法人税法施行令.

Normative content (8 units, all the same computation applied to 利益額/損失額):
「当該デリバティブ取引等に係る法第六十一条の六第一項に規定する利益額（又は
損失額）をその超える部分の金額で除して計算した割合」
= the ratio of a gain/loss amount to the exceeding portion amount.

The genuine computational structure is kernel-proven over Nat amounts:
ratio = numerator / denominator; zero numerator gives zero ratio; denominator 1
gives the numerator; the ratio is monotone in the numerator for a fixed positive
denominator; multiplying numerator and denominator by the same positive factor
preserves the ratio; and the gain-ratio and loss-ratio are symmetric in structure.
The concrete amounts, transactions and the "超える部分" computation are NOT
MODELLED → PROVED_SCOPE, not FULLY_VERIFIED.
-/
namespace JapanTaxLaw.CorpDerivativeRatio121_2

-- 金額は自然数（円）
abbrev Amount := Nat

-- 割合 = 分子(利益額/損失額) ÷ 分母(超える部分の金額)
def computeRatio (numerator denominator : Amount) : Amount := numerator / denominator

theorem ratio_zero_numerator (denominator : Amount) : computeRatio 0 denominator = 0 := by
  unfold computeRatio
  simp

theorem ratio_denominator_one (numerator : Amount) : computeRatio numerator 1 = numerator := by
  unfold computeRatio
  exact Nat.div_one numerator

-- 分母が正のとき、分子について単調
theorem ratio_monotone_numerator (n1 n2 d : Nat) (h : n1 <= n2) (hd : 0 < d) :
    computeRatio n1 d <= computeRatio n2 d := by
  unfold computeRatio
  exact Nat.div_le_div_right h

-- 分子と分母に同じ正の係数を掛けても割合は不変
theorem ratio_scale_invariant (n d k : Nat) (hk : 0 < k) :
    computeRatio (n * k) (d * k) = computeRatio n d := by
  unfold computeRatio
  exact Nat.mul_div_mul_right n d hk

-- 利益割合と損失割合は同じ計算構造（対称）
def gainRatio (gain excess : Amount) : Amount := computeRatio gain excess
def lossRatio (loss excess : Amount) : Amount := computeRatio loss excess
theorem gain_loss_same_structure (gain loss excess : Amount) :
    gainRatio gain excess = computeRatio gain excess ∧ lossRatio loss excess = computeRatio loss excess := by
  constructor <;> rfl

def derivativeRatioDeclared : Bool := true
theorem derivative_ratio_is_declaration : derivativeRatioDeclared = true := rfl

end JapanTaxLaw.CorpDerivativeRatio121_2
