import JapanTaxLaw.TaxFinance

/-!
# LocalTobaccoRate — 地方税法 第74条の5（たばこ税の税率）L4 モデル

Sources (pinned):
  Law id: 325AC0000000226 (地方税法)
  Revision: 325AC0000000226_20261101_508AC0000000002
  Raw snapshot: data/raw/325AC0000000226_20261101_508AC0000000002.law.json
  Article: 第74条の5
  Normative unit: af0337e57754… (LEGAL_EFFECT)

原文逐語 (whitespace-normalised):
  「たばこ税の税率は、千本につき千七十円とする。」

Computation derived verbatim:
  ratePerThousand = 1,070 円 / 千本
  tax(amount) = amount × 1,070, where amount counts 千本 units.

Domain: amount ∈ Nat (千本 units); result ∈ Nat (円). Floor arithmetic is exact
because both operands are Nat and the rate is an integer. Eligibility, 製造場
 classifications, 特定たばこ特例 and rounding for fractional 本 are NOT MODELLED.
This is not legal advice.
-/

namespace JapanTaxLaw.LocalTobaccoRate

/-- 千本につき千七十円。 -/
def ratePerThousand : Nat := 1_070

/-- 実装: 数量（千本）× 千七十円。 -/
def tobaccoTaxYen (thousandUnits : Nat) : Nat :=
  thousandUnits * ratePerThousand

end JapanTaxLaw.LocalTobaccoRate
