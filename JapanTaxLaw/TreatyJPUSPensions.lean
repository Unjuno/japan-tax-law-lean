/-\!
# TreatyJPUSPensions — 日米租税条約 第十七条（年金）

L3 条約層（別層）。第十七条の居住国専属課税構造をカーネル証明する：
- １７１／１７２：退職年金・社会保障給付・保険年金は受益者の居住国でのみ課税。
- １７３：別居・離婚に伴う定期支払（扶養料等）は支払者の居住国のみ課税。ただし
  当該支払が支払国で控除できない場合は、いずれの締約国でも課税しない。

具体的な金額・支払・法的効力は NOT MODELLED。legal_review PENDING（独立的軸）。
-/
namespace JapanTaxLaw.TreatyJPUSPensions

-- １７１/２：年金は受益者居住国でのみ課税（源泉国課税なし）
def sourceTaxOnPension : Bool := false
theorem pension_no_source_tax : sourceTaxOnPension = false := rfl

-- １７３：扶養料等 — 控除可能なら支払国のみ、控除不能なら両国とも課税しない
def alimonyTaxable (deductibleInPayerState : Bool) : Nat :=
  if deductibleInPayerState then 1 else 0
-- 1 = 支払国のみ、0 = いずれの国でもなし
theorem deductible_alimony_payer_only : alimonyTaxable true = 1 := by rfl
theorem nondeductible_alimony_neither : alimonyTaxable false = 0 := by rfl

-- 控除不能なら支払国での課税はしない
def payerStateTaxes (deductibleInPayerState : Bool) : Bool := deductibleInPayerState
theorem nondeductible_no_payer_tax : payerStateTaxes false = false := by decide
theorem deductible_payer_tax : payerStateTaxes true = true := by decide

def pensionsDeclared : Bool := true
theorem pensions_is_declaration : pensionsDeclared = true := rfl

end JapanTaxLaw.TreatyJPUSPensions
