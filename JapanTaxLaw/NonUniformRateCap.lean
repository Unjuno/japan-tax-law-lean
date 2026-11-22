import JapanTaxLaw.TaxFinance

/-!
# NonUniformRateCap — 不均一課税の適用税率の上限（政令 art.2 第1項）bounded L4 モデル

Sources (pinned):
  Law id: 505M60000008043
  Revision: 505M60000008043_20240426_506M60000008046
  Raw snapshot: data/raw/505M60000008043_20240426_506M60000008046.law.json
  Article Num 2 §1 (item ロ/), flat/normalized leaf text 29511 chars, U+3000 count 0.

原文逐語:
  「当該道県が…不均一課税に際して適用する税率。ただし、当該率が０．０５を超える
   ときは、０．０５とする。」

Computation（原文逐語から導出、上限処理のみ）:
  上限 = 0.05（＝50/1000 として整数表現）
  cappedRate(ratePerThousand) = min(ratePerThousand, 50)

Scope / NOT MODELLED:
  - 復興特別区域法等の適用判定・課税標準額の算定は NOT MODELLED。
  - 税率の単位解釈（百分率か倍率か）・不均一課税の具体算定は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.NonUniformRateCap

open JapanTaxLaw.TaxFinance

/-- 税率上限 = 0.05（千分率 50 として表現）。 -/
def rateCapPerThousand : Nat := 50

/-- 適用税率（上限を適用）。 -/
def cappedRate (ratePerThousand : Nat) : Nat :=
  if ratePerThousand > rateCapPerThousand then rateCapPerThousand else ratePerThousand

example : rateCapPerThousand = 50 := by decide
example : cappedRate 30 = 30 := by decide
example : cappedRate 50 = 50 := by decide
example : cappedRate 80 = 50 := by decide

end JapanTaxLaw.NonUniformRateCap
