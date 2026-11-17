import JapanTaxLaw.TaxFinance

/-!
# CustomsSimilarGoods — 関税定率法 art. 4の2（同種又は類似の貨物に係る取引価格による課税価格の決定）L4 モデル

Source (pinned):

  Law id: 143AC0000000054
  Revision: 143AC0000000054_20260601_508AC0000000005
  Amendment enforcement date: 2026-06-01
  Raw snapshot: data/raw/143AC0000000054_20260601_508AC0000000005.law.json

Models the deterministic selection rule of art. 4の2 — pinned bytes 逐語:

  「前条第一項の規定により輸入貨物の課税価格を計算することができない場合又は同条第二項本文の
    規定の適用がある場合において、当該輸入貨物と同種又は類似の貨物…に係る取引価格があるときは、
    当該輸入貨物の課税価格は、当該同種又は類似の貨物に係る取引価格
    （これらの取引価格の双方があるときは、同種の貨物に係る取引価格）とする。」

Selection (total function on Option Money):

  selectedSimilarGoodsPrice samePrice similarPrice :=
    match samePrice with
    | some v => some v     -- 双方あるときは同種を優先
    | none   => similarPrice  -- 同種がなければ類似、双方なければ none（→ art. 4の3 へ）

Scope & honest boundaries:

* 同種・類似の貨物の取引価格は caller-established Money。「輸入港までの運賃等の差異に
  よる価格差につき政令で定めるところにより必要な調整を行つた後」の値を渡す（第1項後段・
  第2項の調整は本モジュール外）。
* 第1項の適用前提（前条1項で計算できない／前条2項本文の適用がある）は caller-established。
* 双方の取引価格がない場合、本関数は `none` を返す。次の art. 4の3（国内販売価格・
  製造原価）の適用は別スライス。
* 転記監査は fidelity-only であり法的正しさを保証しない。

Pinned evidence in doc-comments only; all theorems claim model properties only.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- art. 4の2 — 同種・類似の取引価格から課税価格を選択（同種を優先）。 -/
def selectedSimilarGoodsPrice (samePrice similarPrice : Option Money) : Option Money :=
  match samePrice with
  | some v => some v
  | none   => similarPrice

-- ==== verified facts ====

/-- 同種価格があれば、類似の有無にかかわらず同種が選ばれる。 -/
theorem selected_prefers_same (same : Money) (similar : Option Money) :
    selectedSimilarGoodsPrice (some same) similar = some same := rfl

/-- 同種がなければ類似が選ばれる。 -/
theorem selected_falls_back_to_similar (similar : Money) :
    selectedSimilarGoodsPrice none (some similar) = some similar := rfl

/-- 双方なければ none（次の算定手段へ委ねる）。 -/
theorem selected_none_when_both_absent :
    selectedSimilarGoodsPrice none none = none := rfl

/-- 選択結果があるなら、それは同種または類似のいずれかの入力に由来する。 -/
theorem selected_is_same_or_similar (same similar : Option Money) :
    (∃ v, same = some v ∧ selectedSimilarGoodsPrice same similar = some v)
    ∨ (∃ v, similar = some v ∧ selectedSimilarGoodsPrice same similar = some v)
    ∨ selectedSimilarGoodsPrice same similar = none := by
  cases same with
  | some v => exact Or.inl ⟨v, rfl, rfl⟩
  | none =>
    cases similar with
    | some v => exact Or.inr (Or.inl ⟨v, rfl, rfl⟩)
    | none => exact Or.inr (Or.inr rfl)

-- ==== kernel-decided smoke checks ====

example : selectedSimilarGoodsPrice (some 1_000_000) (some 900_000) = some 1_000_000 := by decide
example : selectedSimilarGoodsPrice (some 1_000_000) none = some 1_000_000 := by decide
example : selectedSimilarGoodsPrice none (some 900_000) = some 900_000 := by decide
example : selectedSimilarGoodsPrice none none = none := by decide

end JapanTaxLaw
