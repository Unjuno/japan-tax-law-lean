import JapanTaxLaw.TaxFinance

/-!
# RegistrationCommercialTax — 登録免許税法 別表第一（二）第二十四号（一）イ L4 スライス

Source (pinned):
  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
  Raw snapshot sha256: 95240C3D9B384E58834CB30A3BEE32470BE86D7295D9544FE141F327F8ADFA15
  (data/raw/342AC0000000035_20261101_508AC0000000021.law.json,
   revision CurrentEnforced per data/INVENTORY.json;
   same pin as the 不動産登記 slice `RegistrationTax.lean`)

別表第一（二）第二十四号（一）イ の text (verbatim excerpt from pinned revision):

  イ　株式会社の設立の登記（ホ及びトに掲げる登記を除く。）
      資本金の額千分の七
      （これによつて計算した税額が十五万円に満たないときは、
       申請件数一件につき十五万円）

Models 株式会社の設立の登記の登録免許税:

  tax = capital × 7/1000 = floor(capital × 7 / 1000)
  per-application cap = ¥150,000（これによつて計算した税額が十五万円に満たないときは、
  申請件数一件につき十五万円）
  effectiveTax = max(computedTax, 150_000)

Scope limits (not modelled):

* ホ（新設合併・組織変更・種類の変更による設立）・ト（新設分割による設立）に該当する
  登記は対象外（them requires per art. 社債等の区分認定 is caller-supplied or
  externally established）— this module computes (イ) only.
* 別表第一（二）第二十四号（一）のロ（合名会社・合資会社の設立）、ハ（合同会社の設立）、
  ニ（資本金増加）、ヘ（吸収合併による増加）、ホ（新設合併）、ト、チ、リ〜ナの他の登記種別
  は本スライスの射程外。
* art. 19（定率課税の場合の最低税額 = 千円）との関係は、この別表第一の最低欄が
  優先適用される（これによつて計算した税額の下限 ¥150,000 が、art. 19 の
  ¥1,000 より厳しい）。この項目は登録免許税法に明示される最小欄であり別途モデル
  化しない。
* 税率の読替え: 資本金の額でなく増加した資本金の額を課税標準とする（二）〜（三）の他項目
  とは異なる対象項目である。
* 商業登記の申請書式（法務局専用書式）や登記手続の要件はモデル化しない。

Pinned evidence in doc-comments only; all theorems here only claim properties of the
model, never of the real legal semantics（誠実性の原則 — Pin ↔ 原文一致 is the trust
boundary; interpretation is not guaranteed)。
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- 別表第一（二）第二十四号（一）イ — 株式会社の設立の登記。固定欄の taxGeeral に
    ついては呼出元に前提を委ねる:
    `isStockCompanyFormation` が true かつ `isNotNewMergerSubdivision` が true
    であること（caller-supplied, externally established）。 -/
structure CommercialFormationFacts where
  /-- 登録事項が株式会社の設立の登記（別表第一（二）第二十四号（一）イ）であるか。 -/
  isStockCompanyFormation : Bool
  /-- 同イ の除外書式（ホ及びトに掲げる新設合併・組織変更・種類の変更・新設分割による設立）
      に該当しないか。 -/
  isNotNewMergerSubdivision : Bool
  /-- 資本金の額 (円). -/
  capital : Money
  deriving DecidableEq, Repr

/-- 株式会社の設立の登記の登録免許税の税率: 千分の七 (0.7%). -/
def stockFormationRate : TaxRate := ⟨7, 1000, by decide⟩

/-- 株式会社の設立の登記の税額（art. 19 による最低税額 ¥1,000 は別表第一の欄が
    stricter floor を上書きするため、本モデルでは適用しない）。
    ¥150,000 に満たない場合は一件につき ¥150,000. -/
def stockFormationTax (f : CommercialFormationFacts) : Money :=
  if f.isStockCompanyFormation && f.isNotNewMergerSubdivision then
    let computed := stockFormationRate.applyFloor f.capital
    if computed < 150_000 then 150_000 else computed
  else 0

-- ==== verified facts about the model (no performance of the law, only model consistency) ====

/-- 税額は常に ¥150,000 以上（別表第一の欄の最低欄）か、0（非設立の登記）。 -/
theorem stockFormationTax_ge_min (f : CommercialFormationFacts)
    (h : f.isStockCompanyFormation = true ∧ f.isNotNewMergerSubdivision = true) :
    150_000 ≤ stockFormationTax f := by
  unfold stockFormationTax
  rw [h.1, h.2]
  simp only [Bool.and_self, ite_true]
  by_cases hc : (stockFormationRate.applyFloor f.capital) < 150_000
  · rw [ite_eq_left hc]
    exact Nat.le_refl 150_000
  · rw [ite_eq_right hc]
    exact Nat.le_of_not_lt hc

/-- 資本金が ¥0 でも ¥150,000 が適用される（設立の登記）。 -/
theorem stockFormationTax_zero_capital :
    stockFormationTax ⟨true, true, 0⟩ = 150_000 := by decide

/-- 税率算出結果が ¥150,000 未満であれば ¥150,000 を適用。 -/
example : stockFormationTax ⟨true, true, 21_428_571⟩ = 150_000 := by decide
example : stockFormationTax ⟨true, true, 21_428_575⟩ = 150_000 := by decide
example : stockFormationTax ⟨true, true, 25_000_000⟩ = 175_000 := by decide

/-- 除外規定に該当する場合は課税されない (caller is honest). -/
example : stockFormationTax ⟨true, false, 100_000_000⟩ = 0 := by decide
example : stockFormationTax ⟨false, true, 100_000_000⟩ = 0 := by decide

/-- 資本金 ¥200,000,000 のとき税額は ¥1,400,000. -/
example : stockFormationTax ⟨true, true, 200_000_000⟩ = 1_400_000 := by decide

end JapanTaxLaw
