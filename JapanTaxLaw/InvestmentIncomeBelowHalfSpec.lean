import JapanTaxLaw.InvestmentIncomeBelowHalf

/-
# InvestmentIncomeBelowHalfSpec — independent spec for 投資関連所得割合百分の五十未満

Pinned source: law 362CO0000000335, revision 362CO0000000335_20260521_506CO0000000150.
Source: data/raw/362CO0000000335_20260521_506CO0000000150.law.json
SHA-256: 8b21ff78cd78a30af9f90521756b31c40e33d0fd919481bb90822de542421e18
Article Num 6_9. Needle verbatim:
  「直前事業年度の総収入金額のうちに当該直前事業年度の投資関連所得（利子所得、配当所得その他の総務省令、財務省令で定める所得をいう。ロにおいて同じ。）に係る収入金額の占める割合が百分の五十に満たないこと。」

Independent formulation (no implementation identifiers in the spec definitions):
  specThreshold = 五十 = 50 (numerator of the 百分の五十 threshold);
  specScale = 百分 = 100 (per-hundred denominator, documented for the norm);
  specBelow p = decide (p < specThreshold) — STRICT (満たない, NOT 以下).
  p = 50 fails; p = 49 qualifies. This is the complement of STRICT-ABOVE >50%.
-/

namespace JapanTaxLaw.InvestmentIncomeBelowHalf

def specThreshold : Nat := 50

def specScale : Nat := 100

def specBelow (p : Nat) : Bool := decide (p < specThreshold)

theorem agreeThreshold : thresholdPercent = specThreshold := by unfold thresholdPercent specThreshold; rfl

theorem agreeScale : percentScale = specScale := by unfold percentScale specScale; rfl

theorem agreeBelow (p : Nat) : belowHalf p = specBelow p := by
  unfold belowHalf specBelow thresholdPercent specThreshold
  rfl

example : specBelow 0 = true := by decide
example : specBelow 49 = true := by decide
example : specBelow 50 = false := by decide
example : specBelow 51 = false := by decide

example : thresholdPercent = specThreshold := agreeThreshold
example : percentScale = specScale := agreeScale
example : belowHalf 49 = specBelow 49 := agreeBelow 49
example : belowHalf 50 = specBelow 50 := agreeBelow 50
example : belowHalf 51 = specBelow 51 := agreeBelow 51

end JapanTaxLaw.InvestmentIncomeBelowHalf
