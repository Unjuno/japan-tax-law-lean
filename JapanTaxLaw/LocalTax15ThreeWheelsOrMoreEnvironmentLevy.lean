import JapanTaxLaw.TaxFinance

/-
# LocalTax15ThreeWheelsOrMoreEnvironmentLevy — pinned clause 「新法の規定中軽自動車税の環境性能割に関する部分は、施行日以後に取得された三輪以上の軽自動車に対して課すべき軽自動車税の環境性能割について適用し、施行日前に取得された三輪以上の軽自動車に対して課する軽自動車税の環境性能割については、なお従前の例による。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 15, paragraph 1.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|c5c0f2e55d3881a2c321f662cbdf3bdd5cd31739cf3bc87467299df86af5c5cc.
Source path: LawBody[898]/SupplProvision/SupplProvision[15]/Article:15/Article#15/Paragraph#1/ParagraphSentence/Sentence#1.
原文逐語: 「新法の規定中軽自動車税の環境性能割に関する部分は、施行日以後に取得された三輪以上の軽自動車に対して課すべき軽自動車税の環境性能割について適用し、施行日前に取得された三輪以上の軽自動車に対して課する軽自動車税の環境性能割については、なお従前の例による。」
Scope: ONLY 施行日以後に取得された三輪以上の軽自動車に対する軽自動車税の環境性能割の適用. The 施行日前の取得に対する従前の例, the 第十七条 parallel occurrence of the same clause, the 環境性能割の税率計算 and all other articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax15ThreeWheelsOrMoreEnvironmentLevy

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (3), INCLUSIVE. -/
def threshold : Nat := 3

/-- 「施行日以後に取得された三輪以上の軽自動車に対する軽自動車税の環境性能割の適用」. -/
def inScope (wheels : Nat) : Prop := threshold ≤ wheels

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (wheels : Nat) : Bool := decide (3 ≤ wheels)

end JapanTaxLaw.LocalTax15ThreeWheelsOrMoreEnvironmentLevy
