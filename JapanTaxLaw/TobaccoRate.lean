import JapanTaxLaw.TaxFinance

/-!
# TobaccoRate — たばこ税法 art.11（税率）bounded L4 モデル

Sources (pinned):
  Law id: 359AC0000000072
  Revision: 359AC0000000072_20260525_506AC0000000052
  Raw snapshot: data/raw/359AC0000000072_20260525_506AC0000000052.law.json
  Article Num 11, flat/normalized leaf text 151 chars, U+3000 count 0.

原文逐語（税率スライス）:
  「たばこ税の税率は、千本につき六千八百二円とする。」

Computation（原文逐語から導出、税率スライスのみ）:
  ratePerThousand = 6,802（六千八百二円 / 千本）
  taxYen(thousandUnits) = 6,802 × 千本数

Scope / NOT MODELLED:
  - 特定販売業者に係る §2 以降の特例、課税標準、製造・販売の認定は NOT MODELLED。
  - 本スライスは §1 の「千本につき六千八百二円」の税率定数のみを扱う。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.TobaccoRate

open JapanTaxLaw.TaxFinance

/-- 税率 = 千本につき六千八百二円。 -/
def ratePerThousandYen : Money := 6_802

/-- n 千本あたりのたばこ税額。 -/
def tobaccoTaxYen (thousandUnits : Nat) : Money :=
  ratePerThousandYen * thousandUnits

example : ratePerThousandYen = 6_802 := by decide
example : tobaccoTaxYen 0 = 0 := by decide
example : tobaccoTaxYen 1 = 6_802 := by decide
example : tobaccoTaxYen 10 = 68_020 := by decide

end JapanTaxLaw.TobaccoRate
