import JapanTaxLaw.TaxFinance

/-!
# CustomsAdditionalDutyCeiling — 関税定率法 art. 9(1)(1) 差額関税の上限（bounded computational slice）

Sources (pinned):
  Law id: 143AC0000000054
  Revision: 143AC0000000054_20260601_508AC0000000005
  Raw snapshot: data/raw/143AC0000000054_20260601_508AC0000000005.law.json
  Normative id: NORM|6f539e8731e012eed30b16cceef593768d521afcc1dbef314ac47b5b7929dbb3
  Article Num 9, paragraph 1, item 1, sentence 1.

原文逐語（pinned clause, extracted from the raw snapshot）:
  「指定された期間内に輸入される指定された貨物の全部につき、又は当該貨物のうち一定の数量若しくは額を超えるものにつき、別表の税率による関税のほか、当該貨物の課税価格とこれと同種又は類似の貨物の本邦における適正と認められる卸売価格（類似の貨物にあつては、当該貨物の性質及び取引方法の差異による価格の相違を勘案して合理的に必要と認められる調整を加えた価格）との差額から別表の税率による関税の額を控除した額以下の関税を課すること。」

Computation（単位: 円。上限 = (課税価格 - 適正卸売価格) - 別表税率による関税額、
いずれも Nat 飽和で下限 0）:
  gap     = taxableValue - fairWholesale   (saturating)
  ceiling = gap - tariff                   (saturating)
  within  = additional <= ceiling

Scope / NOT MODELLED:
  - 指定期間・指定貨物の認定、同種/類似貨物の判定と価格調整、適正卸売価格の
    認定、別表税率の検索、一定の数量若しくは額の算定は NOT MODELLED。
  - 本モデルは上限比較の計算スライスのみを扱い、法的レビューを提供しない。
-/

namespace JapanTaxLaw.CustomsAdditionalDutyCeiling

/-- 課税価格と適正卸売価格の差額（下限 0）。 -/
def priceGap (taxableValue : Nat) (fairWholesale : Nat) : Nat :=
  if fairWholesale < taxableValue then taxableValue - fairWholesale else 0

/-- 差額から別表関税額を控除した課関税の上限（下限 0）。 -/
def ceiling (taxableValue : Nat) (fairWholesale : Nat) (tariff : Nat) : Nat :=
  let gap := priceGap taxableValue fairWholesale
  if tariff < gap then gap - tariff else 0

/-- 課する関税が上限以下であるか。 -/
def withinCeiling (additional : Nat) (taxableValue : Nat) (fairWholesale : Nat)
    (tariff : Nat) : Bool :=
  additional <= ceiling taxableValue fairWholesale tariff

example : priceGap 50 100 = 0 := by decide
example : priceGap 100 50 = 50 := by decide
example : ceiling 100 50 10 = 40 := by decide
example : ceiling 50 100 0 = 0 := by decide
example : withinCeiling 40 100 50 10 = true := by decide
example : withinCeiling 41 100 50 10 = false := by decide

end JapanTaxLaw.CustomsAdditionalDutyCeiling
