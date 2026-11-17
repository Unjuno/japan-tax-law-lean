import JapanTaxLaw.TaxFinance

/-!
# CustomsSmallConsignment — 関税定率法 art. 3の3（少額輸入貨物に対する簡易税率）L4 モデル

Source (pinned):

  Law id: 143AC0000000054
  Revision: 143AC0000000054_20260601_508AC0000000005
  Amendment enforcement date: 2026-06-01
  Raw snapshot: data/raw/143AC0000000054_20260601_508AC0000000005.law.json

Models the applicability gate of art. 3の3 — pinned bytes 逐語:

  「第三条（課税標準及び税率）の場合において、次条から第四条の九までの規定により算出される
    輸入貨物の課税標準となる価格…の合計額が二十万円以下の輸入貨物（本邦に入国する者がその
    入国の際に携帯して輸入し、又は前条第一項の政令で定めるところにより別送して輸入する
    貨物を除く。）に対する関税の率は、関税に関する他の法律の規定にかかわらず、
    別表の付表第二による。ただし、当該輸入貨物を輸入しようとする者…が当該輸入貨物の
    全部について同表によることを希望しない旨を税関に申し出たときは、この限りでない。
    ２前項の規定は、前条第二項第一号及び第二号に掲げる貨物並びに本邦の産業に対する影響等を
    考慮して別表の付表第二の税率を適用することを適当としない貨物として政令で定める貨物に
    は適用しない。」

Computation (Bool gate, Money = Nat):

  smallConsignmentApplies totalPrice excluded optedOut =
    totalPrice ≤ 200_000 && !excluded && !optedOut

Scope & honest boundaries:

* `totalPrice` は art. 4〜4の9 で算出される課税標準となる価格の合計額 — caller-established Money。
* `excluded` は第2項の除外（入国者携帯貨物・別送貨物／無税・免除貨物／犯罪貨物／政令で
  定める貨物）をまとめた caller-established Bool。個別の法的判断は本モジュール外。
* `optedOut` は第1項ただし書の「同表によることを希望しない旨の申出」— caller-established Bool。
* **税率そのもの（別表の付表第二）は本モジュールの射程外**。本関数は適用可否のみを判定し、
  税率表の適用は別スライス（付表第二は別表データとして管理されている）。
* 閾値「二十万円」は原文逐語の定数。端数・Equals 境界は ≤ で表現（「以下」）。
* 転記監査は fidelity-only であり法的正しさを保証しない。

Pinned evidence in doc-comments only; all theorems claim model properties only.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- art. 3の3(1) — 少額輸入貨物の簡易税率の適用閾値（二十万円以下）。 -/
def smallConsignmentThreshold : Money := 200_000

/-- art. 3の3 — 簡易税率の適用可否。除外貨物・申出済みでなければ閾値以下で適用。 -/
def smallConsignmentApplies (totalPrice : Money) (excluded optedOut : Bool) : Bool :=
  decide (totalPrice ≤ smallConsignmentThreshold) && !excluded && !optedOut

-- ==== verified facts ====

theorem smallConsignmentThreshold_eq : smallConsignmentThreshold = 200_000 := rfl

/-- 閾値以下・除外なし・申出なしなら適用。 -/
theorem smallConsignment_applies_under_threshold (price : Money) (h : price ≤ 200_000) :
    smallConsignmentApplies price false false = true := by
  unfold smallConsignmentApplies smallConsignmentThreshold
  simp [h]

/-- 閾値超過なら適用しない（境界 200,001 は超過）。 -/
theorem smallConsignment_not_applies_over_threshold (price : Money) (h : price > 200_000) :
    smallConsignmentApplies price false false = false := by
  unfold smallConsignmentApplies smallConsignmentThreshold
  simp [h]

/-- 除外貨物なら適用しない。 -/
theorem smallConsignment_not_applies_if_excluded (price : Money) :
    smallConsignmentApplies price true false = false := by
  simp [smallConsignmentApplies]

/-- 申出があれば適用しない。 -/
theorem smallConsignment_not_applies_if_opted_out (price : Money) :
    smallConsignmentApplies price false true = false := by
  simp [smallConsignmentApplies]

-- ==== kernel-decided smoke checks ====

example : smallConsignmentApplies 200_000 false false = true := by decide
example : smallConsignmentApplies 200_001 false false = false := by decide
example : smallConsignmentApplies 199_999 false false = true := by decide
example : smallConsignmentApplies 0 false false = true := by decide
example : smallConsignmentApplies 100_000 true false = false := by decide
example : smallConsignmentApplies 100_000 false true = false := by decide

end JapanTaxLaw
