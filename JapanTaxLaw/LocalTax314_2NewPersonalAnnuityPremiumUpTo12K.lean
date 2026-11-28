import JapanTaxLaw.TaxFinance

/-
# LocalTax314_2NewPersonalAnnuityPremiumUpTo12K — pinned clause 「前年中に支払つた新個人年金保険料の金額の合計額（前年中において新個人年金保険契約等に基づく剰余金の分配若しくは割戻金の割戻しを受け、又は新個人年金保険契約等に基づき分配を受ける剰余金若しくは割戻しを受ける割戻金をもつて新個人年金保険料の払込みに充てた場合には、当該剰余金又は割戻金の額（新個人年金保険料に係る部分の金額として政令で定めるところにより計算した金額に限る。）を控除した残額。以下（１）及び（３）（ｉ）において同じ。）が一万二千円以下である場合」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 314_2, paragraph 1, item 5.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|28e14ff1ca024c3284b32a2332860430fafbd17264214190d7585dc6ea93bc53.
原文逐語: 「前年中に支払つた新個人年金保険料の金額の合計額（前年中において新個人年金保険契約等に基づく剰余金の分配若しくは割戻金の割戻しを受け、又は新個人年金保険契約等に基づき分配を受ける剰余金若しくは割戻しを受ける割戻金をもつて新個人年金保険料の払込みに充てた場合には、当該剰余金又は割戻金の額（新個人年金保険料に係る部分の金額として政令で定めるところにより計算した金額に限る。）を控除した残額。以下（１）及び（３）（ｉ）において同じ。）が一万二千円以下である場合」
Scope: ONLY the 新個人年金保険料の金額の合計額が一万二千円以下である場合の INCLUSIVE 上限（premium <= 12000）. 剰余金・割戻金の控除計算・（１）及び（３）（ｉ）の区分・他項他条項は NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax314_2NewPersonalAnnuityPremiumUpTo12K

open JapanTaxLaw.TaxFinance

/-- Statutory threshold literal (12000) with the inclusive boundary fixed by the clause. -/
def inScope (premium : Nat) : Prop := premium <= 12000

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (premium : Nat) : Bool := decide (premium <= 12000)

end JapanTaxLaw.LocalTax314_2NewPersonalAnnuityPremiumUpTo12K
