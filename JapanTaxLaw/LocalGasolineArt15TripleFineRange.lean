import JapanTaxLaw.TaxFinance

/-!
# LocalGasolineArt15TripleFineRange — 地方揮発油税法 art.15(4)（三倍額・50万円の罰金範囲）bounded L4 モデル

Sources (pinned):
  Law id: 330AC0000000104
  Revision: 330AC0000000104_20260401_508AC0000000012
  Raw snapshot: data/raw/330AC0000000104_20260401_508AC0000000012.law.json
  SHA-256: c37f8a705911e90745b865522b1040e3ede192c0a3fee7bbb95727320bc9900a
  Article Num 15, Paragraph 4, scoped flat text 493 chars.

原文逐語:
  「前項の犯罪に係る揮発油に対する地方揮発油税に相当する金額の三倍が
   五十万円を超える場合には、情状により、同項の罰金は、五十万円を超え
   当該地方揮発油税に相当する金額又は還付金に相当する金額の三倍以下と
   することができる。」

Computation（原文逐語から導出、条件・金額スライスのみ、単位: 円）:
  triple a = 3 * a（相当金額の三倍）
  specialApplies a := triple a > 500000（五十万円を超える場合）
  fineBounds a := (500000, triple a)（五十万円を超え三倍以下）

Scope / NOT MODELLED:
  - 「情状により…ことができる」は裁判所の裁量であり、最小化・最大化の選択は
    NOT MODELLED。範囲の上下限と適用条件のみを形式化する。
  - 犯罪の成立、前項の罰金、其他号・他項、告知手続は NOT MODELLED。
  - 本モデルは computable slice のみ。条文全体の意味検証を主張しない。
  - 人間による法的レビューは未了（LEGAL_REVIEW_PENDING）。

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.LocalGasolineArt15TripleFineRange

open JapanTaxLaw.TaxFinance

/-- 相当金額の三倍。 -/
def triple (a : Money) : Money := 3 * a

/-- 五十万円（特別範囲の下限）。 -/
def fineFloor : Money := 500000

/-- 三倍額が五十万円を超える場合に特別範囲が適用される。 -/
def specialApplies (a : Money) : Bool := triple a > fineFloor

/-- 特別範囲の上限（相当金額の三倍）。 -/
def fineCeiling (a : Money) : Money := triple a

/-- 罰金が「五十万円を超え三倍以下」の範囲内か。 -/
def withinFineRange (a fine : Money) : Bool :=
  fine > fineFloor && fine <= fineCeiling a

example : triple 0 = 0 := by decide
example : triple 2 = 6 := by decide
example : triple 3 = 9 := by decide
example : triple 4 = 12 := by decide
example : triple 166667 = 500001 := by decide
example : triple 499999 = 1499997 := by decide
example : triple 500000 = 1500000 := by decide
example : triple 500001 = 1500003 := by decide
example : specialApplies 166666 = false := by decide
example : specialApplies 166667 = true := by decide
example : withinFineRange 200000 500000 = false := by decide
example : withinFineRange 200000 600000 = true := by decide
example : withinFineRange 200000 600001 = false := by decide

end JapanTaxLaw.LocalGasolineArt15TripleFineRange
