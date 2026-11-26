import JapanTaxLaw.TaxFinance

/-
# LocalTax53TwoPrefecturesNotice — pinned clause 「二以上の道府県において事務所又は事業所を有する法人の主たる事務所又は事業所所在地の道府県知事は、当該法人から前項の規定による届出があつた場合には、その旨を関係道府県知事に通知しなければならない。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002, article 53.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json. Normative unit: NORM|be1a7221c6240de4540ea4692c0da43665924fca795d171d0e1240eb0ece0543.
原文逐語: 「二以上の道府県において事務所又は事業所を有する法人の主たる事務所又は事業所所在地の道府県知事は、当該法人から前項の規定による届出があつた場合には、その旨を関係道府県知事に通知しなければならない。」
Scope: ONLY the inclusive 二以上 threshold of this clause. The notification,
approval, apportionment and all other procedures are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax53TwoPrefecturesNotice

open JapanTaxLaw.TaxFinance

/-- 二 — 以上（inclusive） threshold (法人の二以上の道府県届出通知). -/
def threshold : Nat := 2

/-- Statutory trigger 「二以上の道府県において事務所又は事業所を有する法人の主たる事務所又は事業所所在地の道府県知事は、当該法人から前項の規定による届出があつた場合には、その旨を関係道府県知事に通知しなければならない。」. -/
def inScope (amount : Nat) : Prop := amount ≥ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (amount : Nat) : Bool := decide (amount ≥ 2)

end JapanTaxLaw.LocalTax53TwoPrefecturesNotice
