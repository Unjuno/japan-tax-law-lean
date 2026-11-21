import JapanTaxLaw.TaxFinance

/-!
# GasolineTaxCombination — 揮発油税・地方揮発油税の合算（政令 art.32）bounded L4 モデル

Sources (pinned):
  Law id: 330CO0000000100
  Revision: 330CO0000000100_20250401_506CO0000000372
  Raw snapshot: data/raw/330CO0000000100_20250401_506CO0000000372.law.json
  Article Num 32, flat/normalized leaf text 126 chars, U+3000 count 0.

原文逐語:
  「課税物品が…揮発油である場合には、揮発油税及び地方揮発油税を一の税目とみなし、
   これらの税の税率又は税額をそれぞれ合算した額を内国消費税の税率又は税額とみなして、
   この政令の規定を適用する。」

Computation（原文逐語から導出、合算操作のみ）:
  combinedAmount(national, local) = national + localTax
  combinedRate(r1, r2) = r1 + r2（税率も同様に合算）

Scope / NOT MODELLED:
  - 法2条2号の揮発油の定義・認定は NOT MODELLED。
  - 合算後の内国消費税としての手続・申告は NOT MODELLED。
  - 本スライスは「税率・税額を合算する」操作のみを扱う。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.GasolineTaxCombination

open JapanTaxLaw.TaxFinance

/-- 合算税額 = 揮発油税 + 地方揮発油税。 -/
def combinedAmount (national localTax : Money) : Money :=
  national + localTax

example : combinedAmount 0 0 = 0 := by decide
example : combinedAmount 100 50 = 150 := by decide
example : combinedAmount 1_000 2_000 = 3_000 := by decide

end JapanTaxLaw.GasolineTaxCombination
