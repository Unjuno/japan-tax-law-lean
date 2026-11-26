import JapanTaxLaw.TaxFinance

/-!
# ShipRegistrationRateReduction4PerMille — 登録免許税法 art.17(2) 船舶仮登記後の本登記 千分の四控除 bounded L4 モデル

Sources (pinned):
  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Raw snapshot: data/raw/342AC0000000035_20261101_508AC0000000021.law.json
  SHA-256: 95240c3d9b384e58834cb30a3bee32470be86d7295d9544fe141f327f8adfa15
  Norm unit NORM|cf07e881f1d8ecf70bbd51dfc969fb103cd1a635b1ff4d9f69a8edbee11b47e8
  Source path: LawBody[3]/MainProvision/MainProvision[1]/Article:17/Article#17/Paragraph#2/ParagraphSentence/Sentence#1

原文逐語:
  「当該登記に係る登録免許税の税率は、同号（二）の税率欄に掲げる割合から千分の四を控除した割合とする。」

Computation（原文逐語から導出、税率差引スライスのみ、単位: 千分率）:
  basePerMille : Nat — 別表第一第二号(二)の税率欄の割合（caller-established）
  reductionPerMille := 4（千分の四）
  reducedRatePerMille base := base - 4（Nat 飽和、下限 0）

Scope / NOT MODELLED:
  - 別表の税率そのもの、仮登記の事実認定、課税価格・税額計算は NOT MODELLED。
  - 本モデルは当該号の税率差引のみ。条文全体の意味検証を主張しない。
  - 人間による法的レビューは未了（LEGAL_REVIEW_PENDING）。

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.ShipRegistrationRateReduction4PerMille

/-- 控除する千分率（千分の四）。 -/
def reductionPerMille : Nat := 4

/-- 別表の割合から千分の四を控除した税率（Nat 飽和で下限 0）。 -/
def reducedRatePerMille (basePerMille : Nat) : Nat :=
  basePerMille - reductionPerMille

example : reductionPerMille = 4 := by decide
example : reducedRatePerMille 0 = 0 := by decide
example : reducedRatePerMille 3 = 0 := by decide
example : reducedRatePerMille 4 = 0 := by decide
example : reducedRatePerMille 5 = 1 := by decide
example : reducedRatePerMille 20 = 16 := by decide

end JapanTaxLaw.ShipRegistrationRateReduction4PerMille
