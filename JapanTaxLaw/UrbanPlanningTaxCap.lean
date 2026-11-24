import JapanTaxLaw.TaxFinance

/-!
# UrbanPlanningTaxCap — 地方税法 第702条の4（都市計画税の税率上限）L4 モデル

Sources (pinned):
  Law id: 325AC0000000226 (地方税法)
  Revision: 325AC0000000226_20261101_508AC0000000002
  Raw snapshot: data/raw/325AC0000000226_20261101_508AC0000000002.law.json
  Article: 第702条の4
  Normative unit: 180090fa279a… (LEGAL_EFFECT, 上限)

原文逐語:
  「都市計画税の税率は、百分の〇・三を超えることができない。」

Representation: the rate is encoded as a non-negative integer in per-mille
(千分率) units. 0.3% = 3 per-mille. Domain: p ∈ Nat (per-mille), the result is
a Bool decision. The statute states a CEILING, not a prescribed rate. Whether a
rate is actually adopted and the 標準税率 are caller-established and NOT MODELLED.
This is not legal advice.
-/

namespace JapanTaxLaw.UrbanPlanningTaxCap

/-- 税率上限: 百分の〇・三 = 千分の三。 -/
def maxPerMille : Nat := 3

/-- 実装: 税率（千分率）が上限内か。 -/
def withinCap (perMille : Nat) : Bool :=
  perMille ≤ maxPerMille

end JapanTaxLaw.UrbanPlanningTaxCap
