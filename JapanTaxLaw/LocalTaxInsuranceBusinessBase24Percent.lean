import JapanTaxLaw.TaxFinance

/-!
# LocalTaxInsuranceBusinessBase24Percent — 地方税法 art.72の24の2(1) 個人保険 収入保険料×24% bounded L4 モデル

Sources (pinned):
  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Raw snapshot: data/raw/325AC0000000226_20261101_508AC0000000002.law.json
  SHA-256: 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53
  Norm unit NORM|de9d9d7db6b069f23f2cee36210cfd6504860b0579ad1616170cc928549d5def
  Source path: LawBody[2]/MainProvision/MainProvision[1]/Article:72_24_2/Article#72_24_2/Paragraph#2/Item#1/ItemSentence/Sentence#1

原文逐語:
  「個人保険…のうち…貯蓄保険以外のものにあつては、各事業年度の収入保険料…に百分の二十四を乗じて得た金額」

Computation（原文逐語から導出、算定スライスのみ、単位: 円）:
  premium : Money — 収入保険料（再保険料を除く、caller-established）
  businessBase premium := premium * 24 / 100（百分の二十四を乗じて得た金額）
  端数処理は本条に明示がないため Nat 除算（切捨て）を仮定するが法的確定ではない。

Scope / NOT MODELLED:
  - 個人保険・貯蓄保険の認定、再保険料の控除、他の保険種別・号は NOT MODELLED。
  - 端数処理の法的確定、課税標準・税率・税額計算は NOT MODELLED。
  - 本モデルは computable slice のみ。人間による法的レビューは未了。

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.LocalTaxInsuranceBusinessBase24Percent

open JapanTaxLaw.TaxFinance

/-- 原文の「百分の二十四」。 -/
def insuranceRateNum : Nat := 24

def insuranceRateDen : Nat := 100

/-- 収入保険料に 24/100 を乗じて得た金額（自然数除算で切り捨て）。 -/
def businessBase (premium : Money) : Money :=
  premium * insuranceRateNum / insuranceRateDen

example : businessBase 0 = 0 := by decide
example : businessBase 1 = 0 := by decide
example : businessBase 24 = 5 := by decide
example : businessBase 25 = 6 := by decide
example : businessBase 100 = 24 := by decide
example : businessBase 101 = 24 := by decide

end JapanTaxLaw.LocalTaxInsuranceBusinessBase24Percent
