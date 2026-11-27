/-!
# ForeignCorpRedemptionTaxCredit — law 362CO0000000335 art.3 (CONDITION)

Sources (pinned): law `362CO0000000335`; revision and raw snapshot pinned in the transcription pin.
Raw snapshot: pinned revision raw JSON under data/raw/.

原文:
「株主等償還差益に対する所得税の額に当該外国法人の当該株主等償還差益に係る割引債に係る所有期間割合を乗じて計算した金額から当該株主等償還差益に係る期間対応差益（当該株主等償還差益に当該外国法人の当該割引債に係る所有期間割合を乗じて計算した金額をいう。）に当該株主等償還差益に係る期間対応差益に対して適用される限度税率を乗じて計算した金額を控除した残額に相当する金額」

Computation: 所有期間割合を乗じた所得税額から、期間対応差益に限度税率を乗じた額を控除する。
Scope: 割合の算出・限度税率の特定は NOT MODELLED（入力として受け取る）。法的レビューを提供しない。
-/

namespace JapanTaxLaw.ForeignCorpRedemptionTaxCredit

/-- 割合適用（分母 0 のときは 0、自然数除算は切捨て）。 -/
def applyRatio (amount : Nat) (num : Nat) (den : Nat) : Nat :=
  if den = 0 then 0 else amount * num / den

/-- 期間対応差益に限度税率（百分率）を乗じた金額。 -/
def limitedTax (gain : Nat) (num : Nat) (den : Nat) (ratePct : Nat) : Nat :=
  applyRatio gain num den * ratePct / 100

/-- 控除後の残額（Nat の saturation 減算）。 -/
def credit (incomeTax : Nat) (gain : Nat) (num : Nat) (den : Nat) (ratePct : Nat) : Nat :=
  applyRatio incomeTax num den - limitedTax gain num den ratePct

example : credit 100 100 1 2 20 = 40 := by decide
example : credit 100 100 2 2 20 = 80 := by decide
example : credit 100 100 0 2 20 = 0 := by decide
example : credit 100 100 1 0 20 = 0 := by decide
example : credit 100 100 1 2 0 = 50 := by decide

end JapanTaxLaw.ForeignCorpRedemptionTaxCredit
