import JapanTaxLaw.TaxFinance

/-!
# ExcessFinanceGrant75Cap — 特別法人事業譲与税法 art. 31(5)(4)  november grant 75% with cap

Sources (pinned):
  Law id: 431AC0000000004
  Revision: 431AC0000000004_20260401_508AC0000000002
  Raw snapshot: data/raw/431AC0000000004_20260401_508AC0000000002.law.json
  Normative id: NORM|329dfc7dbb7c019197e3e433ac1da86b5e41b6ce06202825fa1a54e2bd838e0a
  Article Num 31, paragraph 5, item 4.

原文逐語（pinned clause, extracted from the raw snapshot）:
  「財源超過団体における十一月の譲与時期に係る基準各譲与時期特別法人事業譲与税額の百分の七十五に相当する額（当該額に当該財源超過団体に係る五月分財源超過団体譲与制限額及び八月分財源超過団体譲与制限額の合算額を加えた額が財源超過額を超える場合には、当該財源超過額から当該合算額を控除した額とする。）をいう。」

Computation（単位: 円）:
  raw   = baseGrant * 75 / 100
  cap   = excess - min priorLimits excess      (saturating)
  grant = if raw + priorLimits > excess then cap else raw

Scope / NOT MODELLED:
  - 基準各譲与時期特別法人事業譲与税額・財源超過額・五月/八月制限額の
    算定、団体の認定、端的な月次処理は NOT MODELLED。
  - 本モデルは百分の七十五と上限の計算スライスのみを扱い、
    法的レビューを提供しない。
-/

namespace JapanTaxLaw.ExcessFinanceGrant75Cap

/-- 十一月分の基準譲与額の百分の七十五（財源超過額による上限付き）。 -/
def cappedGrant (baseGrant : Nat) (priorLimits : Nat) (excess : Nat) : Nat :=
  let raw := baseGrant * 75 / 100
  let remaining := if priorLimits < excess then excess - priorLimits else 0
  if excess < raw + priorLimits then remaining else raw

example : cappedGrant 100 0 1000 = 75 := by decide
example : cappedGrant 100 40 100 = 60 := by decide
example : cappedGrant 100 40 200 = 75 := by decide

end JapanTaxLaw.ExcessFinanceGrant75Cap
