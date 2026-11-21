import JapanTaxLaw.TaxFinance

/-
# RefundFineRange1M — 輸入品に対する内国消費税の徴収等に関する法律 第二十三条（還付金等罰則）bounded Nat/Bool モデル

Pinned source:
  Law id: 330AC0000000037
  Official title: 輸入品に対する内国消費税の徴収等に関する法律 (abbrev 輸徴法; article caption （罰則）)
  Law type: Act (法律)
  Revision: 330AC0000000037_20260401_508AC0000000012
  Raw snapshot: data/raw/330AC0000000037_20260401_508AC0000000012.law.json
  SHA-256 (raw JSON bytes): 21c2b44d6e9a1d85d22b71b5c028b3e9276133d5e33a14d4e7c1a547e6068f94
  Article Num 23 (第二十三条, 見出し （罰則）), verbatim needle below; structural hit count 1.

原文逐語 (paragraph sentence, verbatim, 一字一句改変なし):
  「前項の犯罪に係る還付金相当額の三倍が百万円を超えるときは、情状により、同項の罰金は、百万円を超え当該相当額の三倍以下とすることができる。」

Computation (原文逐語から導出; two anchors 三倍 = 3, 百万円 = 1,000,000):
  fineUpper tax = 3 * tax        （三倍）
  fineFloor     = 1_000_000      （百万円）
  rangeApplies tax = fineFloor < fineUpper tax
                                  （三倍が百万円を超える = STRICT >, not >=）
  fineWithinRange fine tax = fineFloor < fine && fine <= fineUpper tax
                                  （百万円を超え = STRICT lower; 三倍以下 = INCLUSIVE upper）

Variable contract: `tax : Nat` = 還付金相当額 (円, whole yen);
  `fine : Nat` = 同項の罰金 (円, whole yen). Both are non-negative Nat amounts.

Scope: ONLY the explicit numeric fine range of the pinned sentence is modelled.
  「情状により」の裁量、犯罪の成立要件、拘禁刑、前項の百万円以下の罰金、
  他の条項、他の法律、徴収手続は NOT MODELLED。本モデルは法的レビューを提供しない。

Kernel-decided / reflexive throughout: no unproved constants, no non-constructive
choice, no monotonicity abstraction, and no struct literals as arguments.
-/

namespace JapanTaxLaw.RefundFineRange1M

/-- 三倍: 罰金の上限 = 3 * tax。 -/
def fineUpper (tax : Nat) : Nat := 3 * tax

/-- 百万円: 適用必要条件の下限 = 1,000,000。 -/
def fineFloor : Nat := 1_000_000

/-- 三倍が百万円を超える (STRICT): `fineFloor < fineUpper tax`。 -/
def rangeApplies (tax : Nat) : Bool := decide (fineFloor < fineUpper tax)

/-- 百万円を超え三倍以下: 下限 strict (`<`), 上限 inclusive (`<=`)。 -/
def fineWithinRange (fine tax : Nat) : Bool :=
  decide (fineFloor < fine && fine <= fineUpper tax)

/- Behaviour theorems (kernel-decided). -/

/-- tax = 333,334: 3 * 333,334 = 1,000,002 > 1,000,000 → 範囲適用。 -/
theorem range_applies_at_333334 : rangeApplies 333_334 = true := by
  decide

/-- tax = 333,333: 3 * 333,333 = 999,999 ≤ 1,000,000 → 範囲非適用。 -/
theorem range_not_applies_at_333333 : rangeApplies 333_333 = false := by
  decide

/-- 百万円ちょうどは「超え」でないため範囲外。 -/
theorem fine_floor_excluded : fineWithinRange 1_000_000 333_334 = false := by
  decide

/-- 百万円を 1 円超えた値は範囲内。 -/
theorem fine_above_floor_included : fineWithinRange 1_000_001 333_334 = true := by
  decide

/-- 「三倍以下」は inclusive なので上限値自体は範囲内。 -/
theorem fine_upper_inclusive : fineWithinRange (fineUpper 333_334) 333_334 = true := by
  decide

/-- 上限超過は範囲外。 -/
theorem over_cap_excluded : fineWithinRange 1_000_003 333_334 = false := by
  decide

/-- 範囲適用の必要条件は 1,000,000 < 3 * tax と同値。 -/
theorem rangeApplies_iff (tax : Nat) :
    rangeApplies tax = true ↔ fineFloor < fineUpper tax := by
  unfold rangeApplies fineFloor fineUpper
  simp

/-- 範囲内判定は 1,000,000 < fine かつ fine ≤ 3 * tax と同値。 -/
theorem fineWithinRange_iff (fine tax : Nat) :
    fineWithinRange fine tax = true ↔ fineFloor < fine ∧ fine ≤ fineUpper tax := by
  unfold fineWithinRange fineFloor fineUpper
  simp

end JapanTaxLaw.RefundFineRange1M
