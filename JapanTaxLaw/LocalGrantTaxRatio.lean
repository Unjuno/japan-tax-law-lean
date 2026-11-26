import JapanTaxLaw.TaxFinance

/-!
# LocalGrantTaxRatio — 普通交付税94%・特別交付税6%（地方交付税法 art.6の2 §2-3）bounded L4 モデル

Sources (pinned):
  Law id: 325AC0000000211
  Revision: 325AC0000000211_20261102_508AC0000000062
  Raw snapshot: data/raw/data/raw/325AC0000000211_20261102_508AC0000000062.law.json
  Article Num 6_2 §2-3, flat/normalized leaf text 130 chars. Needles contain no U+3000.

原文逐語:
  「毎年度分として交付すべき普通交付税の総額は、前条第二項の額の百分の九十四に相当する額とする。」
  「毎年度分として交付すべき特別交付税の総額は、前条第二項の額の百分の六に相当する額とする。」

Computation（原文逐語から導出、2 種類への配分、単位: 円）:
  ordinary(base) = base * 94 / 100
  special(base)  = base * 6 / 100

Scope / NOT MODELLED:
  - 前条第二項の額（基準財政需要額 - 基準財政収入額）の算定は NOT MODELLED。
  - 端数処理・交付の実際の手続・特別交付税の偏重是正の調整は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.LocalGrantTaxRatio

open JapanTaxLaw.TaxFinance

/-- 普通交付税総額 = 基準額 × 94%。 -/
def ordinary (base : Money) : Money := base * 94 / 100

/-- 特別交付税総額 = 基準額 × 6%。 -/
def special (base : Money) : Money := base * 6 / 100

example : ordinary 100000 = 94000 := by decide
example : special 100000 = 6000 := by decide
example : ordinary 100000 + special 100000 = 100000 := by decide  -- 94%+6%=100%

end JapanTaxLaw.LocalGrantTaxRatio
