import JapanTaxLaw.TaxFinance

/-!
# OrganizationChangeNetAssets — 組織変更会社の純資産額（下限付き差額）bounded slice

Sources (pinned):
  Law id: 342M50000040037
  Revision: 342M50000040037_20260401_508M60000040008
  Raw snapshot: data/raw/342M50000040037_20260401_508M60000040008.law.json
  Normative id: NORM|4be496509f8d5142008b02da6f331d4460799214070cf2cde97be1a7707d0711
  Article Num 12, paragraph 1.

原文逐語（pinned clause, extracted from the raw snapshot）:
  「組織変更をする会社の当該組織変更の直前における資産の額から負債の額を控除した額（当該控除した額がイに掲げる額以下である場合にあつては、イに掲げる額）」

Computation（入力: 資産額・負債額・イに掲げる額。単位: 円）:
  diff     = if liabilities < assets then assets - liabilities else 0
  netAsset = if diff <= floor then floor else diff

Scope / NOT MODELLED:
  - イに掲げる額の算定、資産・負債の評価、組織変更の認定・手続は
    NOT MODELLED。
  - 本モデルは下限付き差額の計算スライスのみを扱い、法的レビューを提供しない。
-/

namespace JapanTaxLaw.OrganizationChangeNetAssets

/-- 組織変更直前の資産から負債を控除した額（イの額を下限とする）。 -/
def netAssets (assets : Nat) (liabilities : Nat) (floorAmount : Nat) : Nat :=
  let diff := if liabilities < assets then assets - liabilities else 0
  if diff <= floorAmount then floorAmount else diff

example : netAssets 0 0 0 = 0 := by decide
example : netAssets 100 40 10 = 60 := by decide
example : netAssets 100 40 80 = 80 := by decide
example : netAssets 50 100 10 = 10 := by decide

end JapanTaxLaw.OrganizationChangeNetAssets
