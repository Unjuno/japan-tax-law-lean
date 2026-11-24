import JapanTaxLaw.TaxFinance

/-!
# OilGasGrantArt4Rounding — 石油ガス譲与税法 art. 4（千円未満端数控除）bounded L4 モデル

Sources (pinned):
  Law id: 340AC0000000157
  Revision: 340AC0000000157_20090401_421AC0000000009
  Raw snapshot: data/raw/340AC0000000157_20090401_421AC0000000009.law.json
  SHA-256: 3f8c479bf7015d58132f75e6bf796ea88a0f68675d444083a6f1f2f77b6af058
  Article Num 4, scoped flat text 147 chars, U+3000 count 0.

原文逐語:
  「各都道府県及び指定市に対する前条第一項に規定する各譲与時期ごとに
   譲与すべき石油ガス譲与税の額として前二条の規定を適用して計算した金額に
   千円未満の端数金額があるときは、その端数金額を控除した金額をもつて、
   当該各譲与時期ごとに譲与すべき石油ガス譲与税の額とする。」

Computation（原文逐語から導出、端数処理スライスのみ、単位: 円）:
  computed : Money — 前二条の規定を適用して計算した金額（caller-established）
  grantYenRounded computed = computed / 1000 * 1000（千円未満を控除 = 切り捨て）

Scope / NOT MODELLED:
  - 前条第一項の譲与時期、前二条の譲与額算定、指定市の認定は NOT MODELLED。
  - 端数が「あるとき」以外の手続・経過措置は NOT MODELLED。
  - 本モデルは computable slice のみであり、条文全体の意味検証を主張しない。
  - 人間による法的レビューは未了（LEGAL_REVIEW_PENDING）。

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.OilGasGrantArt4Rounding

open JapanTaxLaw.TaxFinance

/-- 千円未満の端数を控除した譲与額。端数処理は切り捨て（控除）であり四捨五入ではない。 -/
def grantYenRounded (computed : Money) : Money :=
  computed / 1000 * 1000

example : grantYenRounded 0 = 0 := by decide
example : grantYenRounded 999 = 0 := by decide
example : grantYenRounded 1000 = 1000 := by decide
example : grantYenRounded 1001 = 1000 := by decide
example : grantYenRounded 2500 = 2000 := by decide

/-- 千円未満の端数金额そのもの。 -/
def fractionBelowThousand (computed : Money) : Money :=
  computed % 1000

example : fractionBelowThousand 2500 = 500 := by decide

end JapanTaxLaw.OilGasGrantArt4Rounding
