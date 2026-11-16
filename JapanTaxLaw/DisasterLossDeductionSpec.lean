import JapanTaxLaw.DisasterLossDeduction

/-!
# DisasterLossDeduction spec — independent restatement of
  地方税法 art. 34(1)第一号（雑損控除）

Sources (pinned; identical to DisasterLossDeduction.lean):

  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Amendment enforcement date: 2026-11-01
  Raw snapshot sha256: 3DD29E0078BF24E09C79436CE7B0F00FD2CFB5A5BBCB97BD4F4352971BE68D53

Independent restatement of:
  * art. 34(1)第一号 — 災害等により自己又は自己と生計を一にする配偶者その他の親族で政令で定めるものの
    有する資産について損失を受けた場合、当該損失の金額の合計額が、次に掲げる場合の区分に応じ、
    それぞれ次に定める金額を超える所得割の納税義務者…その超える金額
    イ： 災害関連支出の金額が ¥50,000 以下のときは、総所得金額等の 10/100
    ロ： 災害関連支出の金額が ¥50,000 超の場合、min(損失 − (災害関連支出 − ¥50,000), イ)
    ハ： 全ての損失が災害関連支出のとき、min(¥50,000, イ)
from the statutory text itself.

Scope boundaries identical to the implementation.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- Spec: art. 34(1)第一号 イ --
    総所得金額等の十分の一に相当する金額。 -/
def specTenth (totalIncome : Money) : Money := totalIncome * 10 / 100

/-- Spec: art. 34(1)第一号 雑損控除閾値。 -/
def specDisasterLossDeductionThreshold (totalIncome lossTotal disasterRelatedSpending : Money) : Money :=
  if disasterRelatedSpending ≤ 50_000 then
    specTenth totalIncome
  else if lossTotal = disasterRelatedSpending then
    min 50_000 (specTenth totalIncome)
  else
    min (lossTotal - (disasterRelatedSpending - 50_000)) (specTenth totalIncome)

/-- Spec: art. 34(1)第一号 雑損控除額。 -/
def specDisasterLossDeduction (totalIncome lossTotal disasterRelatedSpending : Money) : Money :=
  let th := specDisasterLossDeductionThreshold totalIncome lossTotal disasterRelatedSpending
  if lossTotal > th then lossTotal - th else 0

-- ==== points ====

example : specTenth 0 = 0 := by decide
example : specTenth 1_000_000 = 100_000 := by decide
example : specTenth 999_999 = 99_999 := by decide

example : specDisasterLossDeductionThreshold 1_000_000 150_000 0 = 100_000 := by decide
example : specDisasterLossDeductionThreshold 1_000_000 200_000 80_000 = 100_000 := by decide
example : specDisasterLossDeductionThreshold 1_000_000 80_000 80_000 = 50_000 := by decide

example : specDisasterLossDeduction 0 0 0 = 0 := by decide
example : specDisasterLossDeduction 1_000_000 150_000 0 = 50_000 := by decide
example : specDisasterLossDeduction 1_000_000 100_000 0 = 0 := by decide
example : specDisasterLossDeduction 1_000_000 80_000 80_000 = 30_000 := by decide
example : specDisasterLossDeduction 0 100_000 0 = 100_000 := by decide
example : specDisasterLossDeduction 1_000_000 200_000 80_000 = 100_000 := by decide

/-- Agreement checks between implementation and Spec. -/
def agreeDisasterLossDeductionPoints : Bool :=
  [ (0, 0, 0), (1_000_000, 150_000, 0), (1_000_000, 100_000, 0),
    (1_000_000, 200_000, 80_000), (1_000_000, 80_000, 80_000),
    (0, 100_000, 0), (999_999, 150_000, 0), (1_000_000, 300_000, 100_000),
    (5_000_000, 80_000, 80_000), (5_000_000, 500_000, 0) ].all fun (inc, loss, spend) =>
    disasterLossDeduction ⟨inc, loss, spend⟩ ==
      specDisasterLossDeduction inc loss spend

example : agreeDisasterLossDeductionPoints = true := by decide

end JapanTaxLaw
