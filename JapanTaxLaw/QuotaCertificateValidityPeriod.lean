import JapanTaxLaw.TaxFinance

/-
# QuotaCertificateValidityPeriod — 経済連携協定に基づく関税割当制度に関する政令 第二条第八項（有効期間）

Pinned source:
  Law id: 417CO0000000035
  Official title: 経済連携協定に基づく関税割当制度に関する政令
  Law type: CabinetOrder (政令)
  Revision: 417CO0000000035_20220401_504CO0000000135
  Raw snapshot: data/raw/417CO0000000035_20220401_504CO0000000135.law.json
  sha256: 76ee2e11aa8228af4e9245d60ab76236e5a7aaf3949d9b3c720402db64bb5f3a
  Statutory article: 第二条 (art. 2), 第八項 (8)
  Source path: LawBody[2]/MainProvision/MainProvision[1]/Article:2/Article#2/
               Paragraph#8/ParagraphSentence/Sentence#1
  Normative unit id: NORM|36a080d669275921c8cb3c9b8a5d85a2c8f97b10481942b0fdb7c70cc8f32e9d

原文逐語（pinned, 一字一句改変なし, EFFECT, verbatim-unique in whole law）:
  「関税割当証明書の有効期間は、その交付の日からその日の属する年度の末日までとする。」

Variable contract:
  `day : Nat` and `fiscalYearEnd : Nat` are ordinal day indices from the
  certificate's issuance date, both in the same ordered day domain.
  `withinValidity (day fiscalYearEnd : Nat) : Bool := decide (day <= fiscalYearEnd)`.
  The statutory period runs from issuance through the end of the fiscal year
  containing the issuance day; 「まで」 is inclusive of the end day.

Scope: ONLY the end-of-fiscal-year cutoff relation is modelled. How the fiscal
year is determined, calendar conversions, renewal, and other paragraphs are
NOT MODELLED (caller-established). The source contains no numeral, so there is
no statutory numeric literal to audit.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.QuotaCertificateValidityPeriod

/-- 「交付の日からその日の属する年度の末日まで」: day is at or before the end. -/
def withinValidity (day fiscalYearEnd : Nat) : Bool :=
  decide (day <= fiscalYearEnd)

-- まで is inclusive: the end day itself qualifies.
example : withinValidity 3 3 = true := by decide

-- The day after the end is outside.
example : withinValidity 4 3 = false := by decide

-- The issuance day qualifies when the end is not before it.
example : withinValidity 0 3 = true := by decide

end JapanTaxLaw.QuotaCertificateValidityPeriod
