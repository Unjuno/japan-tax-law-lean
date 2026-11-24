import JapanTaxLaw.TaxFinance

/-!
# InheritanceTaxLateFilingFineCap500k — 相続税法 art.69 無申告等の罰金上限 50万円（bounded L4 モデル）

Sources (pinned): law 325AC0000000073, revision 325AC0000000073_20260401_506AC0000000008,
raw data/raw/325AC0000000073_20260401_506AC0000000008.law.json.
原文逐語: 「…一年以下の拘禁刑又は五十万円以下の罰金に処する。」
Computation（罰金上限の判定のみ、単位: 円）:
  withinCap(fine) = fine <= 500000  （「以下」は境界値を含む）
Scope / NOT MODELLED: 拘禁刑・构成要件（正当な理由・提出期限）・科刑手続は NOT MODELLED。
本モデルは罰金額の上限判定のみを扱い、法的レビューを提供しない。
-/

namespace JapanTaxLaw.InheritanceTaxLateFilingFineCap500k

open JapanTaxLaw.TaxFinance

def fineCap : Money := 500000

def withinCap (fine : Money) : Bool :=
  fine <= fineCap

example : withinCap 500000 = true := by decide
example : withinCap 500001 = false := by decide

end JapanTaxLaw.InheritanceTaxLateFilingFineCap500k
