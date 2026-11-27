import JapanTaxLaw.TaxFinance

/-
# LocalTax17_4TwoOrMoreInstallmentsDeeming — pinned clause 「二以上の納期又は二回以上の分割納付若しくは分割納入に係る地方団体の徴収金につき過誤納を生じた場合には、その過誤納金については、その過誤納金の額に相当する地方団体の徴収金に達するまで、納付又は納入の日の順序に従い最後に納付又は納入された金額から順次遡つて求めた金額からなるものとみなして、第一項の規定を適用する。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 17_4, paragraph 3.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|e34e5660b79b7f285b0aff66f4d8de64588182d5cf7f637826c689ab47f2399d.
Source path: LawBody[2]/MainProvision/MainProvision[0]/Article:17_4/Article#17_4/Paragraph#3/ParagraphSentence/Sentence#1.
原文逐語: 「二以上の納期又は二回以上の分割納付若しくは分割納入に係る地方団体の徴収金につき過誤納を生じた場合には、その過誤納金については、その過誤納金の額に相当する地方団体の徴収金に達するまで、納付又は納入の日の順序に従い最後に納付又は納入された金額から順次遡つて求めた金額からなるものとみなして、第一項の規定を適用する。」
Scope: ONLY the 二以上の納期／二回以上の分割納付・分割納入 (installments ≥ 2) lower bound. 過誤納金の額の算定方法・充当順序, 第一項の規定の適用自体, 他の項, 他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax17_4TwoOrMoreInstallmentsDeeming

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (2), INCLUSIVE lower bound. -/
def threshold : Nat := 2

/-- 「二以上の納期又は二回以上の分割納付若しくは分割納入に係る地方団体の徴収金につき過誤納を生じた場合には、その過誤納金については、その過誤納金の額に相当する地方団体の徴収金に達するまで、納付又は納入の日の順序に従い最後に納付又は納入された金額から順次遡つて求めた金額からなるものとみなして、第一項の規定を適用する。」. -/
def inScope (installments : Nat) : Prop := threshold ≤ installments

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (installments : Nat) : Bool := decide (2 ≤ installments)

end JapanTaxLaw.LocalTax17_4TwoOrMoreInstallmentsDeeming
