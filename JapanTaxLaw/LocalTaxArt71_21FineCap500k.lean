import JapanTaxLaw.TaxFinance

/-!
# LocalTaxArt71_21FineCap500k — 地方税法 art.71の21 罰金上限 50万円（bounded L4 モデル）

Sources (pinned): law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002,
raw data/raw/325AC0000000226_20261101_508AC0000000002.law.json.
原文逐語: 「…一年以下の拘禁刑又は五十万円以下の罰金に処する。」
Computation（罰金上限の判定のみ、単位: 円）:
  withinCap(fine) = fine <= 500000  （「以下」は境界値を含む）
Scope / NOT MODELLED: 各号の該当要件・拘禁刑・科刑手続は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.LocalTaxArt71_21FineCap500k

open JapanTaxLaw.TaxFinance

def fineCap : Money := 500000

def withinCap (fine : Money) : Bool :=
  fine <= fineCap

example : withinCap 500000 = true := by decide
example : withinCap 500001 = false := by decide

end JapanTaxLaw.LocalTaxArt71_21FineCap500k
