import JapanTaxLaw.TaxFinance

/-
# LocalTax72_54TwoPrefectures — pinned clause 「二以上の道府県において事務所又は事業所を設けて事業を行う個人に課する事業税の課税標準とすべき所得の総額は、主たる事務所又は事業所所在地の道府県知事が決定しなければならない。」

Pinned: law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002, article 72_54.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json. Normative unit: NORM|b5de580fc177ceb8c11693a4e8679737d943677370327dbfa752c7daae51ab94.
原文逐語: 「二以上の道府県において事務所又は事業所を設けて事業を行う個人に課する事業税の課税標準とすべき所得の総額は、主たる事務所又は事業所所在地の道府県知事が決定しなければならない。」
Scope: ONLY the threshold/tier interval of this clause. The determination
procedure, rates and other articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax72_54TwoPrefectures

open JapanTaxLaw.TaxFinance

/-- 二 — 以上（inclusive） threshold (two or more prefectures). -/
def threshold : Nat := 2

/-- 「二以上の道府県において事務所又は事業所を設けて事業を行う個人」. -/
def inScope (amount : Nat) : Prop := amount ≥ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (amount : Nat) : Bool := decide (amount ≥ 2)

end JapanTaxLaw.LocalTax72_54TwoPrefectures
