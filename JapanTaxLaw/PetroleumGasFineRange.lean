import JapanTaxLaw.TaxFinance

/-
# PetroleumGasFineRange — 石油ガス税法 art.27（罰金の範囲）bounded Nat/Bool モデル

Sources (pinned):
  Law id: 340AC0000000156
  Revision: 340AC0000000156_20260525_506AC0000000052
  Raw snapshot: data/raw/340AC0000000156_20260525_506AC0000000052.law.json
  SHA-256 (raw JSON bytes): 537d080b0297f777c2ef10a5b7439b00c09cb6dfe1c28c40fdfeac346f36f153
  Article Num 27; scoped normalized text 454 chars.

原文逐語 (paragraph sentence, verbatim):
  「前項の犯罪に係る課税石油ガスに対する石油ガス税に相当する金額の三倍が五十万円を超える場合には、情状により、同項の罰金は、五十万円を超え当該石油ガス税に相当する金額の三倍以下とすることができる。」

Computation (原文逐語から導出):
  fineUpper tax = 3 * tax        （三倍）
  fineFloor     = 500,000        （五十万円）
  rangeApplies tax = fineFloor < fineUpper tax
                                 （三倍が五十万円を超える場合）
  fineWithinRange fine tax = fineFloor < fine && fine <= fineUpper tax
                                 （五十万円を超え = strict; 三倍以下 = inclusive）

Variable contract: `tax : Nat` = 石油ガス税に相当する金額 (円);
`fine : Nat` = 罰金 (円). Both are non-negative Nat amounts.

Scope: only the explicit numeric condition and fine range of art.27.
「情状により」の裁量、犯罪の成立要件、他の条項および徴収手続は NOT MODELLED。
本モデルは法的レビューを提供しない。

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.PetroleumGasFineRange

/-- 三倍: 罰金の上限 = 3 * tax。 -/
def fineUpper (tax : Nat) : Nat := 3 * tax

/-- 五十万円: 適用必要条件の下限 = 500,000。 -/
def fineFloor : Nat := 500_000

/-- 三倍が五十万円を超える場合: `fineFloor < fineUpper tax`。 -/
def rangeApplies (tax : Nat) : Bool := decide (fineFloor < fineUpper tax)

/-- 五十万円を超え三倍以下: 下限は strict (`<`)、上限は inclusive (`<=`)。 -/
def fineWithinRange (fine tax : Nat) : Bool :=
  decide (fineFloor < fine && fine <= fineUpper tax)

/- Behaviour theorems (kernel-decided). -/

example : fineUpper 166_667 = 500_001 := by decide
example : rangeApplies 166_667 = true := by decide
example : fineWithinRange 500_001 166_667 = true := by decide
example : fineUpper 166_666 = 499_998 := by decide
example : rangeApplies 166_666 = false := by decide
example : fineWithinRange 500_000 166_667 = false := by decide
example : fineWithinRange (fineUpper 166_667) 166_667 = true := by decide
example : fineWithinRange 500_002 166_667 = false := by decide

/-- 範囲適用の必要条件は、まさに 500,000 < 3 * tax と同値。 -/
theorem rangeApplies_iff (tax : Nat) :
    rangeApplies tax = true ↔ fineFloor < fineUpper tax := by
  unfold rangeApplies fineFloor fineUpper
  simp

/-- 範囲内判定は、まさに 500,000 < fine かつ fine ≤ 3 * tax と同値。 -/
theorem fineWithinRange_iff (fine tax : Nat) :
    fineWithinRange fine tax = true ↔ fineFloor < fine ∧ fine ≤ fineUpper tax := by
  unfold fineWithinRange fineFloor fineUpper
  simp

/-- 上限は tax に関して単調（Monotone を使わず直接不等式で記述）。 -/
theorem fineUpper_mono {a b : Nat} (h : a <= b) : fineUpper a <= fineUpper b := by
  unfold fineUpper
  omega

end JapanTaxLaw.PetroleumGasFineRange
