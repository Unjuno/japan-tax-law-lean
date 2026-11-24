import JapanTaxLaw.TaxFinance

/-!
# GasolineTaxArt27TripleFineRange — 揮発油税法 art.27(2)（三倍額・100万円の罰金範囲）bounded L4 モデル

Sources (pinned):
  Law id: 332AC0000000055
  Revision: 332AC0000000055_20260525_506AC0000000052
  Raw snapshot: data/raw/332AC0000000055_20260525_506AC0000000052.law.json
  SHA-256: e5e7d4286963a6424652cc86c75341a6c64d972e4e3e7ef22670ddcf2801de9a
  Article Num 27, Paragraph 2. Norm unit NORM|0b733f32ad62ee9eb…d38bc24b.

原文逐語:
  「前項の犯罪に係る揮発油に対する揮発油税に相当する金額又は還付金に相当する金額の三倍が百万円を超える場合には、情状により、同項の罰金は、百万円を超え当該…三倍以下とすることができる。」

Computation（原文逐語から導出、条件・金額スライスのみ、単位: 円）:
  triple a = 3 * a
  specialApplies a := triple a > 1000000（百万円を超える場合）
  fine range: fine > 1000000 && fine <= triple a

Scope / NOT MODELLED:
  - 「情状により…ことができる」の裁判所裁量、犯罪成立、前項の罰金は NOT MODELLED。
  - art.27(4) の五十万円 special case は別条文スライスとして NOT MODELLED。
  - 本モデルは computable slice のみ。条文全体の意味検証を主張しない。
  - 人間による法的レビューは未了（LEGAL_REVIEW_PENDING）。

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.GasolineTaxArt27TripleFineRange

open JapanTaxLaw.TaxFinance

def triple (a : Money) : Money := 3 * a

def fineFloor : Money := 1000000

def specialApplies (a : Money) : Bool := triple a > fineFloor

def withinFineRange (a fine : Money) : Bool :=
  fine > fineFloor && fine <= triple a

example : triple 0 = 0 := by decide
example : triple 2 = 6 := by decide
example : triple 3 = 9 := by decide
example : triple 4 = 12 := by decide
example : triple 333333 = 999999 := by decide
example : triple 333334 = 1000002 := by decide
example : specialApplies 333333 = false := by decide
example : specialApplies 333334 = true := by decide
example : withinFineRange 400000 1000000 = false := by decide
example : withinFineRange 400000 1200000 = true := by decide
example : withinFineRange 400000 1200001 = false := by decide

end JapanTaxLaw.GasolineTaxArt27TripleFineRange
