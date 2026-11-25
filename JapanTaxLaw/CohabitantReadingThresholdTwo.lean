import JapanTaxLaw.TaxFinance

/-
# CohabitantReadingThresholdTwo — 令和六年能登半島地震災害臨時特例法等施行令 第二条第二項（二人以上）

Pinned source:
  Law id: 506CO0000000033
  Official title: 令和六年能登半島地震災害の被災者に係る所得税法及び災害被害者に対する租税の減免、徴収猶予等に関する法律の臨時特例に関する法律施行令
  Law type: CabinetOrder (政令)
  Revision: 506CO0000000033_20240221_000000000000000
  Raw snapshot: data/raw/506CO0000000033_20240221_000000000000000.law.json
  sha256: f3a109796defc2d4af7372e2b174c464ee905eee92a73bc0df84a92e70a1df53
  Statutory article: 第二条 (art. 2), 第二項 (2)
  Source path: LawBody[3]/MainProvision/MainProvision[1]/Article:2/Article#2/
               Paragraph#2/ParagraphSentence/Sentence#1
  Normative unit id: NORM|e713fefceeb078384dd5e386ecdeab7c8fa82cb5b85adb34fb8e9028deb1bdbe

原文逐語（pinned, 一字一句改変なし, READING, verbatim-unique in whole law）:
  「所得税法施行令第二百五条第二項の規定は、前項に規定する親族と生計を一にする居住者が二人以上ある場合について準用する。」

Variable contract:
  `cohabitantFloor : Nat := 2` = 二人 (inclusive lower bound: 以上).
  `appliesReading (residents : Nat) : Bool := decide (cohabitantFloor <= residents)`.
  Unit 人 (居住者 living with the relative specified in the preceding paragraph); domain Nat.

Scope: ONLY the explicit numeric count that triggers the 準用 (reading-in) of
所得税法施行令第二百五条第二項 is modelled. The content of that cross-law
provision, the definition of 生計を一にする居住者, other paragraphs and
enforcement rules are NOT MODELLED (caller-established).

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.CohabitantReadingThresholdTwo

/-- 二人 — inclusive lower bound (以上). Unit 人; domain Nat. -/
def cohabitantFloor : Nat := 2

/-- 「二人以上ある場合」: at least two such 居住者. -/
def appliesReading (residents : Nat) : Bool :=
  decide (cohabitantFloor <= residents)

/-- 以上 is inclusive: exactly two qualifies. -/
theorem two_inclusive : appliesReading 2 = true := by
  unfold appliesReading cohabitantFloor
  decide

/-- One resident does not satisfy the count. -/
theorem one_false : appliesReading 1 = false := by
  unfold appliesReading cohabitantFloor
  decide

/-- Three residents qualifies. -/
theorem three_true : appliesReading 3 = true := by
  unfold appliesReading cohabitantFloor
  decide

end JapanTaxLaw.CohabitantReadingThresholdTwo
