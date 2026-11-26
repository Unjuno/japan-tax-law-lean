import JapanTaxLaw.TaxFinance

/-!
# GiftTaxTenYearResidenceLookback — 相続税法 art.1の4（贈与前十年以内の住所）bounded L4 モデル

Sources (pinned):
  Law id: 325AC0000000073
  Revision: 325AC0000000073_20260401_506AC0000000008
  Raw snapshot: data/raw/325AC0000000073_20260401_506AC0000000008.law.json
  SHA-256: c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7
  Norm unit NORM|cdae4cae1db7c796981608a16c56c32d0a9bd39094c9231343423ac719345ccd
  Source path: LawBody[3]/MainProvision/MainProvision[0]/Article:1_4/Article#1_4/Paragraph#1/Item#2/Subitem1#1/Subitem2#1/Subitem2Sentence/Sentence#1

原文逐語:
  「当該贈与前十年以内のいずれかの時においてこの法律の施行地に住所を有していたことがあるもの」

Computation（原文逐語から導出、期間スライスのみ、単位: 年）:
  yearsBeforeGift : Nat — 贈与時から遡った年数（caller-established）
  lookbackYears := 10（十年以内）
  withinLookback yearsBeforeGift := yearsBeforeGift <= 10

Scope / NOT MODELLED:
  - 住所の有無そのもの、贈与財産の評価・税率・申告は NOT MODELLED。
  - 第1号ロ(2)イの他の選択肢・準用規定は NOT MODELLED。
  - 本モデルは computable slice のみ。条文全体の意味検証を主張しない。
  - 人間による法的レビューは未了（LEGAL_REVIEW_PENDING）。

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.GiftTaxTenYearResidenceLookback

/-- 贈与前の遡及期間（十年）。 -/
def lookbackYears : Nat := 10

/-- 贈与前 N 年が十年以内か（上限を含む）。 -/
def withinLookback (yearsBeforeGift : Nat) : Bool :=
  yearsBeforeGift <= lookbackYears

example : lookbackYears = 10 := by decide
example : withinLookback 0 = true := by decide
example : withinLookback 9 = true := by decide
example : withinLookback 10 = true := by decide
example : withinLookback 11 = false := by decide
example : withinLookback 20 = false := by decide

end JapanTaxLaw.GiftTaxTenYearResidenceLookback
