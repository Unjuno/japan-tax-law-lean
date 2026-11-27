import JapanTaxLaw.TaxFinance

/-
# LocalTax15_8CancellationWithin3Years — pinned clause 「地方団体の長は、前条第一項各号の規定により滞納処分の執行を停止した後三年以内に、その停止に係る滞納者につき同項各号に該当する事実がないと認めるときは、その執行の停止を取り消さなければならない。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 15_8, paragraph 1.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|e0a09b22e994141abdfedb2964daf7d414f0eff908d3d313666f7e56459665cd.
Source path: LawBody[2]/MainProvision/MainProvision[0]/Article:15_8/Article#15_8/Paragraph#1/ParagraphSentence/Sentence#1.
原文逐語: 「地方団体の長は、前条第一項各号の規定により滞納処分の執行を停止した後三年以内に、その停止に係る滞納者につき同項各号に該当する事実がないと認めるときは、その執行の停止を取り消さなければならない。」
Scope: ONLY the 停止後三年以内 (years ≤ 3) period. 滞納処分の執行停止自体, 前条第一項各号に該当する事実がないことの認定, 取消しの実体的要件, 他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax15_8CancellationWithin3Years

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (3), INCLUSIVE ceiling. -/
def threshold : Nat := 3

/-- 「地方団体の長は、前条第一項各号の規定により滞納処分の執行を停止した後三年以内に、その停止に係る滞納者につき同項各号に該当する事実がないと認めるときは、その執行の停止を取り消さなければならない。」. -/
def inScope (years : Nat) : Prop := years ≤ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (years : Nat) : Bool := decide (years ≤ 3)

end JapanTaxLaw.LocalTax15_8CancellationWithin3Years
