import JapanTaxLaw.TaxFinance

/-
# LocalTax20_4_2TwoOrMoreInstallments — pinned clause 「地方税の確定金額を、二以上の納期限を定め、一定の金額に分割して納付し、又は納入することとされている場合において、その納期限ごとの分割金額に千円未満の端数があるとき、又はその分割金額の全額が千円未満であるときは、その端数金額又はその全額は、すべて最初の納期限に係る分割金額に合算するものとする。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 20_4_2, paragraph 6.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|a23558634f33c7f610d66701423cbfe86f23628a4586a04eeeeb03835a5606ef.
Source path: LawBody[2]/MainProvision/MainProvision[0]/Article:20_4_2/Article#20_4_2/Paragraph#6/ParagraphSentence/Sentence#1.
原文逐語: 「地方税の確定金額を、二以上の納期限を定め、一定の金額に分割して納付し、又は納入することとされている場合において、その納期限ごとの分割金額に千円未満の端数があるとき、又はその分割金額の全額が千円未満であるときは、その端数金額又はその全額は、すべて最初の納期限に係る分割金額に合算するものとする。」
Scope: ONLY the 地方税の確定金額を二以上の納期限を定め分割して納付し又は納入する場合 (deadlines >= 2) INCLUSIVE lower bound for the 端数金額の最初の納期限への合算. 千円未満の端数・分割金額の計算・納付若しくは納入の方法・他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax20_4_2TwoOrMoreInstallments

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (2), INCLUSIVE lower bound. -/
def threshold : Nat := 2

/-- 「地方税の確定金額を、二以上の納期限を定め、一定の金額に分割して納付し、又は納入することとされている場合において、その納期限ごとの分割金額に千円未満の端数があるとき、又はその分割金額の全額が千円未満であるときは、その端数金額又はその全額は、すべて最初の納期限に係る分割金額に合算するものとする。」. -/
def inScope (deadlines : Nat) : Prop := threshold ≤ deadlines

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (deadlines : Nat) : Bool := decide (2 ≤ deadlines)

end JapanTaxLaw.LocalTax20_4_2TwoOrMoreInstallments
