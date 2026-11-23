/-\!
# TreatyJPUSShippingTransferPricing — 日米租税条約 第八条・第九条

L3 条約層（別層）：
- ８１：国際運輸の船舶・航空機運用利得は企業の居住国でのみ課税。
- ８２：賃貸利得も含む（裸用船は国際運輸付随の場合のみ）。国内運送も国際運輸の
  一部なら含む。８４：コンテナーは他方国内のみ使用の場合を除き居住国のみ課税。
- ９１：関連企業間の独立企業原則に反する条件により得られなかった利得は算入課税。
- ９２：対応調整（双方合意で利得が独立企業間条件なら相当の調整）。
- ９３：7年以内に調査開始がなければ更正不可（不正・帰責の場合は例外）。

具体的な利得・条件・法的効力は NOT MODELLED。legal_review PENDING（独立的軸）。
-/
namespace JapanTaxLaw.TreatyJPUSShippingTransferPricing

-- ８１：国際運輸利得は居住国のみ
def shippingProfitsSourceTax : Bool := false
theorem shipping_residence_only : shippingProfitsSourceTax = false := rfl

-- ８４：コンテナーが他方国内のみ使用なら居住国のみ課税でない
def containerSourceTax (usedOnlyInOther : Bool) : Bool := usedOnlyInOther
theorem container_other_only_use_source_tax : containerSourceTax true = true := by decide
theorem container_international_no_source_tax : containerSourceTax false = false := by decide

-- ９１：独立企業原則違反の条件がある場合に算入
def transferPricingAdjustment (relatedParties nonArmsLength : Bool) : Bool :=
  relatedParties && nonArmsLength
theorem tp_adjustment_applies : transferPricingAdjustment true true = true := by decide
theorem tp_no_relation_no_adjustment : transferPricingAdjustment false true = false := by decide

-- ９３：7年以内の調査開始（開始 → 更正可）
def adjustmentWithinSevenYears (yearsElapsed : Nat) : Bool := decide (yearsElapsed <= 7)
theorem seven_years_ok : adjustmentWithinSevenYears 7 = true := by decide
theorem eight_years_barred : adjustmentWithinSevenYears 8 = false := by decide

def shippingTransferPricingDeclared : Bool := true
theorem shipping_transfer_pricing_is_declaration : shippingTransferPricingDeclared = true := rfl

end JapanTaxLaw.TreatyJPUSShippingTransferPricing
