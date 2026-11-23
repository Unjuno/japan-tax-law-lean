import JapanTaxLaw.TaxFinance

/-
# GrayscaleGradationFloor — 国税関係法令に係る情報通信技術を活用した行政の推進等に関する省令 第五条(2)(2)
（白色から黒色までの階調が二百五十六階調以上であること）

Pinned source:
  Law id: 415M60000040071
  Official title: 国税関係法令に係る情報通信技術を活用した行政の推進等に関する省令
  Law type: MinisterialOrdinance (省令)
  Revision: 415M60000040071_20260924_506M60000040031
  Raw snapshot: data/raw/415M60000040071_20260924_506M60000040031.law.json
  sha256: ee7ca0224460193ba599803eb2267eabf81eb00a30f36d5905cbb4cd355f9975
  Statutory article: 第五条 (art. 5), 第二項 (2), 第二号 (2)
  Source path: LawBody[3]/MainProvision/MainProvision[1]/Article:5/Article#5/
               Paragraph#2/Item#2/ItemSentence/Sentence#1
  Normative unit id: NORM|d74340473e54a94163ee5d61d028c0fa4379a44d178ca21a314441520806eaf6

原文逐語（pinned, 一字一句改変なし, CONDITION, verbatim-unique in whole law）:
  「白色から黒色までの階調が二百五十六階調以上であること。」

Variable contract:
  `gradationFloor : Nat := 256` = 二百五十六階調 (inclusive lower bound: 以上).
  `meetsGrayscaleFloor (levels : Nat) : Bool := decide (gradationFloor <= levels)`.
  Unit 階調 (gradation levels); domain Nat. 「以上」 = inclusive `>=`.

Scope: ONLY this explicit numeric grayscale-gradation condition is modelled.
The imaging/record-keeping requirements this condition gates, the definition of
白色/黒色, other items/paragraphs and all enforcement rules are NOT MODELLED
(caller-established).

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.GrayscaleGradationFloor

/-- 二百五十六階調 — inclusive lower bound (以上). Unit 階調; domain Nat. -/
def gradationFloor : Nat := 256

/-- 「階調が二百五十六階調以上」: levels >= 256. -/
def meetsGrayscaleFloor (levels : Nat) : Bool :=
  decide (gradationFloor <= levels)

/-- 以上 is inclusive: exactly 256 qualifies. -/
theorem floor_inclusive : meetsGrayscaleFloor 256 = true := by
  unfold meetsGrayscaleFloor gradationFloor
  decide

/-- One below the floor fails. -/
theorem just_below : meetsGrayscaleFloor 255 = false := by
  unfold meetsGrayscaleFloor gradationFloor
  decide

/-- Zero gradation levels do not satisfy the condition. -/
theorem zero_false : meetsGrayscaleFloor 0 = false := by
  unfold meetsGrayscaleFloor gradationFloor
  decide

end JapanTaxLaw.GrayscaleGradationFloor
