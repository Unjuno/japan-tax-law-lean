import JapanTaxLaw.TaxFinance

/-!
# CustomsBondedFacilityLicenseFeeItem3 — 税関関係手数料令 第二条(1)第三号（保税蔵置場又は保税展示場の許可手数料）

Pinned source:
  Law id: 329CO0000000164
  Official title: 税関関係手数料令
  Law number: 昭和二十九年政令第百六十四号
  Law type: CabinetOrder (政令)
  Revision: 329CO0000000164_20250401_507CO0000000141
  Raw snapshot: data/raw/329CO0000000164_20250401_507CO0000000141.law.json
  sha256: 9ded2444572b362dfbadac27e0b9167f771fd6de961817bb0ced10f9110f83e8
  Normative unit id: NORM|2b2b4b2f039318d1fabf1c656b5ba6ccba76ede0d7ef62de11a59a2a6a66c0ef
  Source path: LawBody[2]/MainProvision/MainProvision[1]/Article:2/Article#2/
               Paragraph#1/Item#3/ItemSentence/Column#2/Sentence#1
  Statutory article: 第二条(1)第三号 — caption （保税蔵置場又は保税展示場の許可手数料）.
    Monthly license fee by floor-area bracket; this bracket's two amounts are
    16_400 yen (general) and 16_200 yen (指定者である場合,
    historical kana あつて). Both derived programmatically from the verbatim needle.

原文逐語（pinned, 一字一句改変なし）:
  「一万六千四百円（当該許可を受ける者が指定者である場合にあつては、一万六千二百円）」

Variable contract (円/month, domain Nat):
  generalFeeYen : Money := 16_400
  designatedFeeYen : Money := 16_200 (指定者 reduced fee)
  The two amounts are alternatives by applicant status (指定者 or not), not cumulative.

Scope: only the two fee amounts for this floor-area bracket are modeled. The floor-area
bracket boundaries, license period/daily proration, other 号, other paragraphs and
other articles are NOT MODELLED.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.CustomsBondedFacilityLicenseFeeItem3

open JapanTaxLaw.TaxFinance

/-- General monthly license fee (円). Derived from verbatim source. -/
def generalFeeYen : Money := 16_400

/-- Reduced monthly fee for a 指定者 (円). Derived from verbatim source. -/
def designatedFeeYen : Money := 16_200

/-- The designated-person fee is strictly lower than the general fee. -/
theorem designated_lt_general : designatedFeeYen < generalFeeYen := by
  unfold designatedFeeYen generalFeeYen
  decide

end JapanTaxLaw.CustomsBondedFacilityLicenseFeeItem3
