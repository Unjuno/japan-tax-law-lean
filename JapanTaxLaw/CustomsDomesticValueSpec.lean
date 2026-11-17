import JapanTaxLaw.CustomsDomesticValue

/-!
# CustomsDomesticValue spec — 関税定率法 art. 4の3

Sources (pinned; identical to CustomsDomesticValue.lean):

  Law id: 143AC0000000054
  Revision: 143AC0000000054_20260601_508AC0000000005
  Amendment enforcement date: 2026-06-01

Independent restatement of:
  * 国内販売価格法: 価格 − (加工 + 手数料利潤 + 国内運賃 + 本邦公課)
  * 製造原価法: 原価 + 利潤一般経費 + 輸入港まで運賃
  * 申出があれば製造原価法を先立てる
  impl が構造体・補助 def を使うのに対し、spec は Nat 引数直接の式で独立定式。

Scope boundaries identical to the implementation.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- Spec: 控除合計（独立定式）。 -/
def specDeductionsTotal (p c f d : Money) : Money := p + c + f + d

/-- Spec: 国内販売価格法（独立定式）。 -/
def specDomesticSalesValue (price proc comm freight duty : Money) : Money :=
  price - specDeductionsTotal proc comm freight duty

/-- Spec: 製造原価法（独立定式）。 -/
def specComputedValue (cost profit freight : Money) : Money := cost + profit + freight

/-- Spec: art. 4の3 選択（独立定式）。 -/
def specArt4_3 (price proc comm freight duty cost profit costFreight : Money) (useCost : Bool) : Money :=
  if useCost then specComputedValue cost profit costFreight
  else specDomesticSalesValue price proc comm freight duty

-- ==== points (kernel-decided) ====

example : specDomesticSalesValue 1_000_000 20_000 30_000 10_000 40_000 = 900_000 := by decide
example : specComputedValue 500_000 100_000 20_000 = 620_000 := by decide
example : specArt4_3 1_000_000 20_000 30_000 10_000 40_000 500_000 100_000 20_000 true = 620_000 := by decide
example : specArt4_3 1_000_000 20_000 30_000 10_000 40_000 500_000 100_000 20_000 false = 900_000 := by decide

/-- Agreement checks between implementation and Spec. -/
def agreeCustomsDomesticValue : Bool :=
  let d : DomesticDeductions := ⟨20_000, 30_000, 10_000, 40_000⟩
  domesticDeductionsTotal d == specDeductionsTotal 20_000 30_000 10_000 40_000
    && domesticSalesValue 1_000_000 d == specDomesticSalesValue 1_000_000 20_000 30_000 10_000 40_000
    && computedValue 500_000 100_000 20_000 == specComputedValue 500_000 100_000 20_000
    && customsValueArt4_3 1_000_000 d 500_000 100_000 20_000 true
        == specArt4_3 1_000_000 20_000 30_000 10_000 40_000 500_000 100_000 20_000 true
    && customsValueArt4_3 1_000_000 d 500_000 100_000 20_000 false
        == specArt4_3 1_000_000 20_000 30_000 10_000 40_000 500_000 100_000 20_000 false

example : agreeCustomsDomesticValue = true := by decide

end JapanTaxLaw
