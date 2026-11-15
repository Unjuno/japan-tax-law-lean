import JapanTaxLaw.TaxFinance

/-!
# DeemedCapitalGainsCost — 租税特別措置法 art. 31の4（長期譲渡所得の概算取得費控除） L4 スライス

Source (pinned):
  Law id: 332AC0000000026
  Revision: 332AC0000000026_20261101_507AC0000000013
  Amendment enforcement date: 2026-11-01
  Raw snapshot sha256: E6E6013BBC0608C6B48DEA01D50AC847C3E5D094F0420223171FFE1B5CF8D5EE
  (data/raw/332AC0000000026_20261101_507AC0000000013.law.json,
   revision CurrentEnforced per data/INVENTORY.json)

Models 租税特別措置法 art. 31の4 — the deemed acquisition-cost deduction
for long-term capital gains on land / buildings acquired on or before
昭和二十七年十二月三十一日:

  個人が昭和二十七年十二月三十一日以前から引き続き所有していた土地等又は建物等を
  譲渡した場合における長期譲渡所得の金額の計算上収入金額から控除する取得費は、
  所得税法第三十八条及び第六十一条の規定にかかわらず、当該収入金額の百分の五に
  相当する金額とする。ただし、当該金額がそれぞれ次の各号に掲げる金額に満たないことが
  証明された場合には、当該各号に掲げる金額とする。
  一 その土地等の取得に要した金額と改良費の額との合計額
  二 その建物等の取得に要した金額と設備費及び改良費の額との合計額につき所得税法
     第三十八条第二項の規定を適用した場合に同項の規定により取得費とされる金額

Scope of this L4 model: the *formula* of art. 31の4(1) — the max of the
5% deemed cost and (when proven) the documented cost. The statutory
applicability gates (個人が， 昭和二十七年十二月三十一日以前から引き続き所有，
譲渡） are modeled as externally-established booleans supplied by the caller.

**スコープ外**:
* art. 31の4(2) による第三十条の読替え（山林 → 土地建物等）と art. 30(2) の
  適用調整はモデル化しない。
* 譲渡所得の計算（収入金額の算定・費用・控除・分離課税の税率・art. 33 の
  長期譲渡所得金額核）は本モジュールの射程外。
* art. 31の4 の「証明された場合」の手続（証明文書・税務調査）はモデル化しない。
* `heldSince1952OrEarlier`・`isIndividual` は externally established booleans。
* 他の法令との参照（所得税法第三十八条・第六十一条）の内容解釈は射程外。

Pinned evidence in doc-comments only; all theorems here only claim properties of the
model, never of the real legal semantics（誠実性の原則 — Pin ↔ 原文一致 is the trust
boundary; interpretation is not guaranteed)。
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- art. 31の4 の計算に必要な事実一式。各フィールドは呼出元が供給する。 -/
structure DeemedCapitalGainsFacts where
  /-- 個人か（art. 31の4 柱書）。 -/
  isIndividual : Bool
  /-- 昭和二十七年十二月三十一日以前から引き続き所有していたか
      （art. 31の4 柱書）。 -/
  heldSince1952OrEarlier : Bool
  /-- 譲渡の収入金額。 -/
  transferPrice : Money
  /-- 証明された、土地等の取得に要した金額と改良費の額との合計額
      （建物等にあっては、所得税法第三十八条第二項の規定により取得費とされる金額）。 -/
  provenDocumentedCost : Money
  /-- 上記の金額を証明できるか（art. 31の4 但書）。 -/
  canProveDocumentedCost : Bool
  deriving DecidableEq, Repr

/-- art. 31の4(1): 長期譲渡所得の金額の計算上控除する取得費（概算額）。
    適格（個人が昭和二十七年十二月三十一日以前から引き続き所有）でなければ 0。
    百分の五の金額と、証明された金額のいずれか多い方を採用。
    証明できない場合は百分の五の金額のみ。 -/
def deemedCost (f : DeemedCapitalGainsFacts) : Money :=
  if f.isIndividual then
    if f.heldSince1952OrEarlier then
      let pct5 := f.transferPrice * 5 / 100
      if f.canProveDocumentedCost then
        if pct5 ≥ f.provenDocumentedCost then pct5 else f.provenDocumentedCost
      else pct5
    else 0
  else 0

/-- §31の4(1) 柱書の適用可否（externally established な二要件の合取）。 -/
def deemedCostQualifies (f : DeemedCapitalGainsFacts) : Bool :=
  f.isIndividual && f.heldSince1952OrEarlier

-- ==== verified facts about the model (no performance of the law, only model consistency) ====

/-- 証明された金額が百分の五の金額を超える場合は、証明された金額を採用。 -/
theorem deemedCost_eq_proven (f : DeemedCapitalGainsFacts)
    (h1 : f.isIndividual = true) (h2 : f.heldSince1952OrEarlier = true)
    (h : f.canProveDocumentedCost = true)
    (hpc5 : f.transferPrice * 5 / 100 ≤ f.provenDocumentedCost) :
    deemedCost f = f.provenDocumentedCost := by
  unfold deemedCost
  simp only [h1, h2, h, ite_true]
  by_cases hc : f.transferPrice * 5 / 100 ≥ f.provenDocumentedCost
  · rw [ite_eq_left hc]
    exact Nat.le_antisymm hpc5 hc
  · rw [ite_eq_right hc]

/-- 証明された金額が百分の五の金額以下の場合は、百分の五の金額を採用。 -/
theorem deemedCost_eq_pct5 (f : DeemedCapitalGainsFacts)
    (h1 : f.isIndividual = true) (h2 : f.heldSince1952OrEarlier = true)
    (h : f.canProveDocumentedCost = true)
    (hpc5 : f.provenDocumentedCost ≤ f.transferPrice * 5 / 100) :
    deemedCost f = f.transferPrice * 5 / 100 := by
  unfold deemedCost
  simp [h1, h2, h, hpc5]

/-- 証明できない場合は百分の五の金額を採用。 -/
theorem deemedCost_eq_pct5_of_no_proof (f : DeemedCapitalGainsFacts)
    (h1 : f.isIndividual = true) (h2 : f.heldSince1952OrEarlier = true)
    (h : f.canProveDocumentedCost = false) :
    deemedCost f = f.transferPrice * 5 / 100 := by
  unfold deemedCost
  simp [h1, h2, h]

/-- 個人ではないか昭和二十七年十二月三十一日以前から引き続き所有していなければ、適用されない。 -/
theorem deemedCost_eq_zero_of_not_qualifying (f : DeemedCapitalGainsFacts)
    (h : f.isIndividual = false ∨ f.heldSince1952OrEarlier = false) :
    deemedCost f = 0 := by
  unfold deemedCost
  cases h with
  | inl hi => cases f.heldSince1952OrEarlier <;> cases f.canProveDocumentedCost <;> simp [hi]
  | inr he => cases f.isIndividual <;> cases f.canProveDocumentedCost <;> simp [he]

/-- 合計収入が百分の五の金額より証明済み金額が大きいとき、証明済み金額を採用。 -/
example : deemedCost ⟨true, true, 100_000_000, 20_000_000, true⟩ = 20_000_000 := by decide
-- 百分の五の金額が証明済み金額より大きいとき、百分の五の金額を採用。
example : deemedCost ⟨true, true, 100_000_000, 1_000_000, true⟩ = 5_000_000 := by decide
-- 証明がなくても、百分の五の金額を採用。
example : deemedCost ⟨true, true, 100_000_000, 50_000_000, false⟩ = 5_000_000 := by decide
-- 適用要件を満たさない。
example : deemedCost ⟨false, true, 100_000_000, 20_000_000, true⟩ = 0 := by decide
example : deemedCost ⟨true, false, 100_000_000, 20_000_000, true⟩ = 0 := by decide
-- 収入金額が 0 。
example : deemedCost ⟨true, true, 0, 0, false⟩ = 0 := by decide

end JapanTaxLaw
