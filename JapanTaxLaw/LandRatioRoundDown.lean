import JapanTaxLaw.TaxFinance

/-!
# LandRatioRoundDown — 地価税法施行令 第23条第2項（割合の端数切り捨て）

Sources (pinned):
  Law id: 407CO0000000029
  Revision: 407CO0000000029_20110101_422CO0000000058
  Raw snapshot: data/raw/407CO0000000029_20110101_422CO0000000058.law.json
  Article: 第23条第2項
  Normative unit: 99bfc8eebf9e… (CONDITION / 端数処理)

原文逐語:
  「２ 前項の割合に百分の十未満の端数があるときは、その端数を切り捨てる。」

The preceding paragraph defines the ratio as 附属施設以外の床面積 ÷（附属施設床面積 +
附属施設以外床面積）. The rule discards a fractional remainder below 10%, i.e.
rounds the ratio DOWN to a multiple of 10% (0.1).

Representation: the ratio is encoded in tenths of a whole (0..10 scale); a
fraction below 10% is the remainder modulo 10. Domain: Nat (tenths). The result
is the largest multiple of 10 not exceeding the input. Eligibility and the area
measurements themselves are caller-established and NOT MODELLED.
-/

namespace JapanTaxLaw.LandRatioRoundDown

/-- 端数単位: 百分の十 = 全体の十分の一 → 10 単位. -/
def step : Nat := 10

/-- 実装: 10 未満の端数を切り捨て（最大の 10 の倍数）。 -/
def roundDownTenths (ratioTenths : Nat) : Nat :=
  ratioTenths - ratioTenths % step

end JapanTaxLaw.LandRatioRoundDown
