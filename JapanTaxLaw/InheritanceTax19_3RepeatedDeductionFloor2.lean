import JapanTaxLaw.TaxFinance

/-
# InheritanceTax19_3RepeatedDeductionFloor2 — pinned clause 「第一項の規定に該当する者がその者又はその扶養義務者について既に前二項の規定による控除を受けたことがある者である場合においては、その者又はその扶養義務者がこれらの規定による控除を受けることができる金額は、既に控除を受けた金額の合計額が第一項の規定による控除を受けることができる金額（二回以上これらの規定による控除を受けた場合には、最初に相続又は遺贈により財産を取得した際に同項の規定による控除を受けることができる金額）に満たなかつた場合におけるその満たなかつた部分の金額の範囲内に限」

Pinned: law 325AC0000000073 (相続税法), revision 325AC0000000073_20260401_506AC0000000008,
article Num 19_3, paragraph 3.
Raw: data/raw/325AC0000000073_20260401_506AC0000000008.law.json (SHA-256 c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7). Normative unit: NORM|320f450b10e687679587d2814c86fc8fab87de00105a01d21d33a00174a3d41b.
Source path: LawBody[3]/MainProvision/MainProvision[1]/Article:19_3/Article#19_3/Paragraph#3/ParagraphSentence/Sentence#1.
原文逐語: 「第一項の規定に該当する者がその者又はその扶養義務者について既に前二項の規定による控除を受けたことがある者である場合においては、その者又はその扶養義務者がこれらの規定による控除を受けることができる金額は、既に控除を受けた金額の合計額が第一項の規定による控除を受けることができる金額（二回以上これらの規定による控除を受けた場合には、最初に相続又は遺贈により財産を取得した際に同項の規定による控除を受けることができる金額）に満たなかつた場合におけるその満たなかつた部分の金額の範囲内に限」
Scope: ONLY the 二回以上 (deductions ≥ 2) INCLUSIVE lower bound for the 第十九条(1) 控除額の制限. 既に控除を受けた金額の合計額との比較・満たなかつた部分の金額の範囲・第一項の控除額の算定・他項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.InheritanceTax19_3RepeatedDeductionFloor2

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (2), INCLUSIVE lower bound. -/
def threshold : Nat := 2

/-- 「第一項の規定に該当する者がその者又はその扶養義務者について既に前二項の規定による控除を受けたことがある者である場合においては、その者又はその扶養義務者がこれらの規定による控除を受けることができる金額は、既に控除を受けた金額の合計額が第一項の規定による控除を受けることができる金額（二回以上これらの規定による控除を受けた場合には、最初に相続又は遺贈により財産を取得した際に同項の規定による控除を受けることができる金額）に満たなかつた場合におけるその満たなかつた部分の金額の範囲内に限」. -/
def inScope (times : Nat) : Prop := threshold ≤ times

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (times : Nat) : Bool := decide (2 ≤ times)

end JapanTaxLaw.InheritanceTax19_3RepeatedDeductionFloor2
