import JapanTaxLaw.TaxFinance

/-
# LocalTax72_48_2TwoPrefecturesCorrection — pinned clause 「（二以上の道府県において事務所又は事業所を設けて事業を行う法人の課税標準額の総額の更正、決定等）」

Pinned: law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002, article 72_48_2 (第七十二条の四十八の二).
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|4b25d5613cbef9134a7ddd58cf200bdb99e449890a682f2980fd2a916b139c43.
原文逐語: 「（二以上の道府県において事務所又は事業所を設けて事業を行う法人の課税標準額の総額の更正、決定等）」
Scope: ONLY the 以上 (inclusive floor) of this clause. Other amounts, classifications,
procedures and articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax72_48_2TwoPrefecturesCorrection

open JapanTaxLaw.TaxFinance

/-- Statutory threshold — （二以上の道府県において事務所又は事業所を設けて事業を行う法人の課税標準額の総額の更正、決定等） (以上, inclusive floor). -/
def threshold : Nat := 2

/-- Inclusive statutory floor — 以上. -/
def lower : Nat := threshold

/-- 「（二以上の道府県において事務所又は事業所を設けて事業を行う法人の課税標準額の総額の更正、決定等）」. -/
def inScope (amount : Nat) : Prop := amount ≥ lower

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (amount : Nat) : Bool := decide (2 ≤ amount)

end JapanTaxLaw.LocalTax72_48_2TwoPrefecturesCorrection
