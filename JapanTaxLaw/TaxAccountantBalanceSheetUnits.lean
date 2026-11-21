import JapanTaxLaw.TaxFinance

/-!
# TaxAccountantBalanceSheetUnits — 税理士法施行規則 第二十二条の四(2)（貸借対照表の金額表示単位）

Pinned source:
  Law id: 326M50000040055
  Official title: 税理士法施行規則
  Law number: 昭和二十六年大蔵省令第五十五号
  Law type: MinisterialOrdinance (省令)
  Revision: 326M50000040055_20260901_506M60000040025
  Raw snapshot: data/raw/326M50000040055_20260901_506M60000040025.law.json
  sha256: 79731fc38da1bf120231f6ffd7053986c1f2f2fa0c7bf573e7f0bbde09121354
  Normative unit id: NORM|70d9948f3c285aa1bca4e2e5dc6a76fd82dede46f1b4739c742e85b5d838098c
  Source path: LawBody[3]/MainProvision/MainProvision[3]/Article:22_4/Article#22_4/
               Paragraph#2/ParagraphSentence/Sentence#1
  Article caption: （貸借対照表）
  The three permitted presentation units (一円単位, 千円単位, 百万円単位) are
  1 / 1_000 / 1_000_000, derived programmatically from the verbatim needle.

原文逐語（pinned, 一字一句改変なし）:
  「貸借対照表に係る事項の金額は、一円単位、千円単位又は百万円単位をもつて表示するものとする。」

Variable contract (yen per unit, domain Nat):
  oneYenUnit : Money := 1
  thousandYenUnit : Money := 1_000
  millionYenUnit : Money := 1_000_000
  isAllowedUnit u := u = oneYenUnit ∨ u = thousandYenUnit ∨ u = millionYenUnit
  「又は」 = alternatives.

Scope: only the three permitted presentation units are modeled. The balance-sheet
preparation rules, rounding, other paragraphs and other articles are NOT MODELLED.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.TaxAccountantBalanceSheetUnits

open JapanTaxLaw.TaxFinance

/-- 一円単位. -/
def oneYenUnit : Money := 1

/-- 千円単位. -/
def thousandYenUnit : Money := 1_000

/-- 百万円単位. -/
def millionYenUnit : Money := 1_000_000

/-- 貸借対照表の金額表示に許される単位. -/
def isAllowedUnit (u : Money) : Prop :=
  u = oneYenUnit ∨ u = thousandYenUnit ∨ u = millionYenUnit

end JapanTaxLaw.TaxAccountantBalanceSheetUnits
