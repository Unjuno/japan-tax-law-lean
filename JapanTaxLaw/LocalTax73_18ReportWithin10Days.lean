import JapanTaxLaw.TaxFinance

/-
# LocalTax73_18ReportWithin10Days — pinned clause 「市町村長は、前項の規定による申告書若しくは報告書を受け取つた場合又は自ら不動産の取得の事実を発見した場合には、その日から十日以内に当該申告書若しくは報告書を道府県知事に送付し、又は当該取得の事実を通知するものとする。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 73_18, paragraph 4.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|a5d108751080cdfbc7272fbe51649d4dfcd34f507362be364231da7ff95df3f9.
Source path: LawBody[2]/MainProvision/MainProvision[1]/Article:73_18/Article#73_18/Paragraph#4/ParagraphSentence/Sentence#1.
原文逐語: 「市町村長は、前項の規定による申告書若しくは報告書を受け取つた場合又は自ら不動産の取得の事実を発見した場合には、その日から十日以内に当該申告書若しくは報告書を道府県知事に送付し、又は当該取得の事実を通知するものとする。」
Scope: ONLY the その日から十日以内 (days ≤ 10) forwarding deadline. 申告書・報告書の受領自体, 不動産取得事実の発見の認定, 送付先・通知先の手続, 他の項, 他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax73_18ReportWithin10Days

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (10), INCLUSIVE ceiling. -/
def threshold : Nat := 10

/-- 「市町村長は、前項の規定による申告書若しくは報告書を受け取つた場合又は自ら不動産の取得の事実を発見した場合には、その日から十日以内に当該申告書若しくは報告書を道府県知事に送付し、又は当該取得の事実を通知するものとする。」. -/
def inScope (days : Nat) : Prop := days ≤ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (days : Nat) : Bool := decide (days ≤ 10)

end JapanTaxLaw.LocalTax73_18ReportWithin10Days
