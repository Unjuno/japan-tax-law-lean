import JapanTaxLaw.TaxFinance

/-!
# DamageRatioTenthInheritGift — 昭和二十二年政令第二百六十八号（災害被害者に対する租税の減免、徴収猶予等に関する法律の施行に関する政令） art. 11（相続税・贈与税 被害部分の価額の割合 十分の一以上）

Sources (pinned):

  Law id: 322CO0000000268
  Revision: 322CO0000000268_20251201_507CO0000000120
  Raw snapshot: data/raw/322CO0000000268_20251201_507CO0000000120.law.json

Pinned 原文: 「相続税又は贈与税の課税価格の計算の基礎となつた財産の価額のうちに被害を受けた部分の価額の占める割合が十分の一以上であること。」

Scoped claim: only the 相続税・贈与税 被害部分の価額の割合 十分の一以上 ratio condition, expressed without division.
`total : Nat` is the taxable base value (> 0); `damaged : Nat` is the damaged portion.
-/

namespace JapanTaxLaw.DamageRatioTenthInheritGift

def oneTenth : Nat := 10

def hasTenthOrMore (total damaged : Nat) : Bool :=
  decide (total > 0 ∧ total <= oneTenth * damaged)

theorem divisor_value : oneTenth = 10 := rfl

end JapanTaxLaw.DamageRatioTenthInheritGift
