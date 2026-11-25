import JapanTaxLaw.TaxFinance

/-!
# InheritanceTaxEvasionFineCap10M — 相続税法 art.68 脱税罰金上限 1000万円（bounded L4 モデル）

Sources (pinned): law 325AC0000000073, revision 325AC0000000073_20260401_506AC0000000008,
raw data/raw/325AC0000000073_20260401_506AC0000000008.law.json.
原文逐語: 「…十年以下の拘禁刑若しくは千万円以下の罰金に処し、又はこれを併科する。」
Computation（罰金上限の判定のみ、単位: 円）:
  withinCap(fine) = fine <= 10000000  （「以下」は境界値を含む）
Scope / NOT MODELLED: 拘禁刑・不正行為の認定・併科の判断は NOT MODELLED。
本モデルは罰金額の上限判定のみを扱い、法的レビューを提供しない。
-/

namespace JapanTaxLaw.InheritanceTaxEvasionFineCap10M

open JapanTaxLaw.TaxFinance

def fineCap : Money := 10000000

def withinCap (fine : Money) : Bool :=
  fine <= fineCap

example : withinCap 10000000 = true := by decide
example : withinCap 10000001 = false := by decide

end JapanTaxLaw.InheritanceTaxEvasionFineCap10M
