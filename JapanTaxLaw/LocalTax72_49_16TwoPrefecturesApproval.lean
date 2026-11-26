import JapanTaxLaw.TaxFinance

/-
# LocalTax72_49_16TwoPrefecturesApproval — pinned clause 「前項の場合においては、その区分計算の方法について、事務所又は事業所所在地の道府県知事（二以上の道府県において事務所又は事業所を設けて事業を行う個人にあつては、主たる事務所又は事業所所在地の道府県知事）の承認を受けなければならない。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002, article 72_49_16.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json. Normative unit: NORM|230b05de0666f0599f78f9210937785b2b403e45e187b400caafa10d79355197.
原文逐語: 「前項の場合においては、その区分計算の方法について、事務所又は事業所所在地の道府県知事（二以上の道府県において事務所又は事業所を設けて事業を行う個人にあつては、主たる事務所又は事業所所在地の道府県知事）の承認を受けなければならない。」
Scope: ONLY the inclusive 二以上 threshold of this clause. The notification,
approval, apportionment and all other procedures are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax72_49_16TwoPrefecturesApproval

open JapanTaxLaw.TaxFinance

/-- 二 — 以上（inclusive） threshold (個人の二以上の道府県区分計算の承認). -/
def threshold : Nat := 2

/-- Statutory trigger 「前項の場合においては、その区分計算の方法について、事務所又は事業所所在地の道府県知事（二以上の道府県において事務所又は事業所を設けて事業を行う個人にあつては、主たる事務所又は事業所所在地の道府県知事）の承認を受けなければならない。」. -/
def inScope (amount : Nat) : Prop := amount ≥ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (amount : Nat) : Bool := decide (amount ≥ 2)

end JapanTaxLaw.LocalTax72_49_16TwoPrefecturesApproval
