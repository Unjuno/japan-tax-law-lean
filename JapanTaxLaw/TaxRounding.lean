import JapanTaxLaw.TaxFinance

/-!
# TaxRounding — 国税通則法 art. 118/119 端数切り捨て (L3 / L4)

Source (pinned):
  Law id: 337AC0000000066
  Revision: 337AC0000000066_20261101_507AC0000000013
  Amendment enforcement date: 2026-11-01
  Raw snapshot sha256: 6F8B43E168652D228066CDA3389A3BF6823900A9268E6BF97297CB6B25189DEE
  (data/raw/337AC0000000066_20261101_507AC0000000013.law.json,
   revision CurrentEnforced per data/INVENTORY.json)

Scope: the two general truncation rules used throughout Japanese national
tax computations.

* 国税通則法第118条第1項 — 課税標準の端数計算等:
  「国税（印紙税及び附帯税を除く。以下この条において同じ。）の課税標準
  （その税率の適用上課税標準から控除する金額があるときは、これを控除した
  金額。以下この条において同じ。）を計算する場合において、その額に千円
  未満の端数があるとき、又はその全額が千円未満であるときは、その端数金額
  又はその全額を切り捨てる。」
  Art. 118(1): taxable basis — if the amount has a fractional part below
  1,000 yen, the fraction is discarded (rounded down to the nearest 1,000).
  Note: art. 118 excludes 印紙税 and 附帯税 (confirmed verbatim in the pin).

* 国税通則法第119条第1項 — 国税の確定金額の端数計算等:
  「国税（自動車重量税、印紙税及び附帯税を除く。以下この条において
  同じ。）の確定金額に百円未満の端数があるとき、又はその全額が百円未満
  であるときは、その端数金額又はその全額を切り捨てる。」
  Art. 119(1): final settled amount — if the amount has a fraction of
  100 yen or less, the fraction is discarded (rounded down to the nearest
  100). Note: art. 119 excludes 自動車重量税, 印紙税, 附帯税 (confirmed
  verbatim in the pin).

Role: shared primitives used by per-tax models (art. 118 is the
input-side truncation of 課税標準; art. 119 is the output-side truncation
of the 確定金額). Both functions are independent of any tax-specific
computation and are reused by the art. 89/29/30 chapters of 所得税法 etc.

Scope notes / honest limits:

* Art. 118(2)/(3) and art. 119(2)-(4) (political-order floor for certain
  taxes; 附帯税千円未満/五千円未満; 分割納付; 還付金 art. 120) are not
  modeled here.
* This module does not compute any tax amount — it only provides the two
  truncation primitives.
* No statutory provision decides the intra-sum rounding inside
  per-product multiplications such as the 所得税法 art. 89 table; such
  modeling choices are made explicitly at the per-tax layer and are not
  part of this module.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- 国税通則法 art. 118(1): 千円未満の端数を切り捨てる truncation mode
    (課税標準の端数). -/
def thousandYenFloor (x : Money) : Money := x / 1000 * 1000

/-- 国税通則法 art. 119(1): 百円未満の端数を切り捨てる truncation mode
    (確定金額の端数). -/
def hundredYenFloor (x : Money) : Money := x / 100 * 100

theorem thousandYenFloor_id (x : Money) (h : x % 1000 = 0) :
    thousandYenFloor x = x := by
  unfold thousandYenFloor
  exact Nat.div_mul_cancel (Nat.dvd_of_mod_eq_zero h)

theorem hundredYenFloor_id (x : Money) (h : x % 100 = 0) :
    hundredYenFloor x = x := by
  unfold hundredYenFloor
  exact Nat.div_mul_cancel (Nat.dvd_of_mod_eq_zero h)

theorem thousandYenFloor_le (x : Money) : thousandYenFloor x ≤ x := by
  unfold thousandYenFloor
  exact Nat.div_mul_le_self x 1000

theorem hundredYenFloor_le (x : Money) : hundredYenFloor x ≤ x := by
  unfold hundredYenFloor
  exact Nat.div_mul_le_self x 100

/-- The thousand-yen floor is a fixed point on thousand-yen multiples:
    repeated application is idempotent. -/
theorem thousandYenFloor_idempotent (x : Money) :
    thousandYenFloor (thousandYenFloor x) = thousandYenFloor x := by
  have hd : 1000 ∣ x / 1000 * 1000 := ⟨x / 1000, Nat.mul_comm ..⟩
  unfold thousandYenFloor
  exact Nat.div_mul_cancel hd

/-- Same for the hundred-yen floor. -/
theorem hundredYenFloor_idempotent (x : Money) :
    hundredYenFloor (hundredYenFloor x) = hundredYenFloor x := by
  have hd : 100 ∣ x / 100 * 100 := ⟨x / 100, Nat.mul_comm ..⟩
  unfold hundredYenFloor
  exact Nat.div_mul_cancel hd

/-- The hundred-yen floor of a thousand-yen floor is at most the thousand-yen
    floor itself, and at most `x`; chained monotonicity of the two floors. -/
theorem thousandYenFloor_sub_hundredYenFloor (x : Money) :
    (hundredYenFloor x) / 1000 * 1000 ≤ x :=
  Nat.le_trans (Nat.div_mul_le_self _ 1000) (hundredYenFloor_le x)

/-- Art. 119 floor is coarser than art. 118 floor applied consecutively, and
    applying it again never rises above the art. 118 result. -/
theorem hundredYenFloor_of_thousandYenFloor_le (x : Money) :
    hundredYenFloor (thousandYenFloor x) ≤ thousandYenFloor x :=
  hundredYenFloor_le (thousandYenFloor x)

end JapanTaxLaw
