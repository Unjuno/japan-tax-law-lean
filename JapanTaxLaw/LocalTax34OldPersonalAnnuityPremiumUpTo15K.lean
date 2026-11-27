import JapanTaxLaw.TaxFinance

/-
# LocalTax34OldPersonalAnnuityPremiumUpTo15K — pinned clause 「前年中に支払つた旧個人年金保険料の金額の合計額（前年中において旧個人年金保険契約等に基づく剰余金の分配若しくは割戻金の割戻しを受け、又は旧個人年金保険契約等に基づき分配を受ける剰余金若しくは割戻しを受ける割戻金をもつて旧個人年金保険料の払込みに充てた場合には、当該剰余金又は割戻金の額（旧個人年金保険料に係る部分の金額に限る。）を控除した残額。以下（２）及び（３）（ｉｉ）において同じ。）が一万五千円以下である場合」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 34, paragraph 1.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|d6e5b28be3c23145ec6c6ea52f5d657e6566716fb1ee451f759d2b6a2d7dd1b5.
原文逐語: 「前年中に支払つた旧個人年金保険料の金額の合計額（前年中において旧個人年金保険契約等に基づく剰余金の分配若しくは割戻金の割戻しを受け、又は旧個人年金保険契約等に基づき分配を受ける剰余金若しくは割戻しを受ける割戻金をもつて旧個人年金保険料の払込みに充てた場合には、当該剰余金又は割戻金の額（旧個人年金保険料に係る部分の金額に限る。）を控除した残額。以下（２）及び（３）（ｉｉ）において同じ。）が一万五千円以下である場合」
Scope: ONLY the 旧個人年金保険料の金額の合計額が一万五千円以下 (premium <= 15000) INCLUSIVE ceiling. 剰余金・割戻金の控除計算・（２）及び（３）（ｉｉ）の区分・他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax34OldPersonalAnnuityPremiumUpTo15K

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (15000), INCLUSIVE upper bound. -/
def threshold : Nat := 15000

/-- 「前年中に支払つた旧個人年金保険料の金額の合計額（前年中において旧個人年金保険契約等に基づく剰余金の分配若しくは割戻金の割戻しを受け、又は旧個人年金保険契約等に基づき分配を受ける剰余金若しくは割戻しを受ける割戻金をもつて旧個人年金保険料の払込みに充てた場合には、当該剰余金又は割戻金の額（旧個人年金保険料に係る部分の金額に限る。）を控除した残額。以下（２）及び（３）（ｉｉ）において同じ。）が一万五千円以下である場合」. -/
def inScope (premium : Nat) : Prop := premium <= threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (premium : Nat) : Bool := decide (premium <= 15000)

end JapanTaxLaw.LocalTax34OldPersonalAnnuityPremiumUpTo15K
