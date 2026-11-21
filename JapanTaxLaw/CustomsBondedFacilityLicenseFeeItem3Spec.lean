import JapanTaxLaw.CustomsBondedFacilityLicenseFeeItem3

/-!
# CustomsBondedFacilityLicenseFeeItem3Spec — independent spec for 税関関係手数料令 第二条(1)第三号

Law id: 329CO0000000164 (税関関係手数料令, CabinetOrder)
Revision: 329CO0000000164_20250401_507CO0000000141
Article: 第二条(1)第三号 — 保税蔵置場又は保税展示場の許可手数料, ¥16,400 / ¥16,200 (指定者)
Normative unit: NORM|2b2b4b2f039318d1fabf1c656b5ba6ccba76ede0d7ef62de11a59a2a6a66c0ef

The implementation stores the two amounts as Nat constants and proves the
designated fee is strictly less than the general fee with `by decide`. The
independent spec reformulates the relationship via the difference: it asserts
`generalFeeYen = designatedFeeYen + 200` (a decomposition claim, distinct from
an inequality). The kernel checks it axiom-free. Both constants were derived
programmatically from the verbatim needle.

Not modelled: floor-area bracket boundaries, license period/daily proration,
other 号, other paragraphs and other articles.
-/

namespace JapanTaxLaw.CustomsBondedFacilityLicenseFeeItem3

open JapanTaxLaw.TaxFinance

/-- Independent spec: the general fee exceeds the designated fee by exactly ¥200. -/
def specDifferenceYen : Money := 200

/-- Decomposition: general = designated + difference. Axiom-free. -/
theorem agree_fee_difference :
    generalFeeYen = designatedFeeYen + specDifferenceYen := by
  unfold generalFeeYen designatedFeeYen specDifferenceYen
  decide

end JapanTaxLaw.CustomsBondedFacilityLicenseFeeItem3
