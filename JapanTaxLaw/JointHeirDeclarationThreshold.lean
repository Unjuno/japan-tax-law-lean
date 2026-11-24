import JapanTaxLaw.TaxFinance

/-
# JointHeirDeclarationThreshold — 石油石炭税法施行令 第十三条第三項（相続人が二人以上）

Pinned source:
  Law id: 353CO0000000132
  Official title: 石油石炭税法施行令 (Petroleum and Coal Tax Act Enforcement Order)
  Law type: CabinetOrder (政令)
  Revision: 353CO0000000132_20250401_507CO0000000006
  Raw snapshot: data/raw/353CO0000000132_20250401_507CO0000000006.law.json
  sha256: a11df5044e3b0e7bbd81d87d328d08467def928a3fec7031b1c8a5b60a76499d
  Statutory article: 第十三条 (art. 13), 第三項 (3)
  Source path: LawBody[2]/MainProvision/MainProvision[9]/Article:13/Article#13/
               Paragraph#3/ParagraphSentence/Sentence#1
  Normative unit id: NORM|27ba36ac793253dc18c7e0d51b413a5554ceb6c5287167eb62ade42a81a59f3a

原文逐語（pinned, 一字一句改変なし, CONDITION, verbatim-unique in whole law）:
  「相続人が二人以上ある場合には、前項の申告書は、各相続人が連署して提出するものとする。」

Variable contract:
  `heirFloor : Nat := 2` = 二人 (inclusive lower bound: 以上).
  `needsJointDeclaration (heirs : Nat) : Bool := decide (heirFloor <= heirs)`.
  Unit 人 (persons); domain Nat. 「以上」 = inclusive `>=`.

Scope: ONLY the explicit numeric heir-count condition is modelled — the
threshold at which the 連署 requirement is triggered. Paragraph 3 also contains
a proviso (各相続人が各別に提出することを妨げない) permitting separate
submission; that proviso is NOT MODELLED, so the predicate name
`needsJointDeclaration` describes the modelled threshold only, not an
unconditional duty. The declaration content, the 連署 procedure, the
preceding-paragraph requirements, other paragraphs and enforcement rules are
NOT MODELLED (caller-established).

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.JointHeirDeclarationThreshold

/-- 二人 — inclusive lower bound (以上). Unit 人; domain Nat. -/
def heirFloor : Nat := 2

/-- 「相続人が二人以上」: number of heirs >= 2. -/
def needsJointDeclaration (heirs : Nat) : Bool :=
  decide (heirFloor <= heirs)

/-- 以上 is inclusive: exactly two heirs qualifies. -/
theorem floor_inclusive : needsJointDeclaration 2 = true := by
  unfold needsJointDeclaration heirFloor
  decide

/-- One heir does not satisfy the condition. -/
theorem one_false : needsJointDeclaration 1 = false := by
  unfold needsJointDeclaration heirFloor
  decide

/-- Three heirs qualifies. -/
theorem three_true : needsJointDeclaration 3 = true := by
  unfold needsJointDeclaration heirFloor
  decide

end JapanTaxLaw.JointHeirDeclarationThreshold
