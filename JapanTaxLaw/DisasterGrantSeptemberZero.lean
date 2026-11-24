import JapanTaxLaw.TaxFinance

/-
# DisasterGrantSeptemberZero — 震災復興特別交付税額算定等省令 第三条第三項（九月交付税額は零）

Pinned source:
  Law id: 507M60000008043
  Official title: 地方団体に対して交付すべき令和七年度分の震災復興特別交付税の額の算定方法、決定時期及び決定額並びに交付時期及び交付額等の特例に関する省令
  Law type: MinisterialOrdinance (省令)
  Revision: 507M60000008043_20250425_000000000000000
  Raw snapshot: data/raw/507M60000008043_20250425_000000000000000.law.json
  sha256: 02d256b8f5b48afc01a886eebb88ed78eec7d84d4726a543088115ba8f32f60e
  Statutory article: 第三条 (art. 3), 第三項 (3), second sentence
  Source path: LawBody[2]/MainProvision/MainProvision[2]/Article:3/Article#3/
               Paragraph#3/ParagraphSentence/Sentence#2
  Normative unit id: NORM|d749035b746df1b6685fb1a4af5c00df8468570b5fca56b2197055ec3e77861f

原文逐語（pinned, 一字一句改変なし, CONDITION, verbatim-unique in whole law）:
  「この場合において、令和七年度九月震災復興特別交付税額は零とする。」

Variable contract:
  `septemberGrantYen : Nat := 0` = 零 (the September special grant amount).
  `isZeroSeptemberGrant (yen : Nat) : Bool := decide (yen == septemberGrantYen)`.
  Unit 円 (yen); domain Nat.

Scope: ONLY the zeroing effect stated in this sentence is modelled. The
"この場合" antecedent conditions, the calculation method, other months and
articles are NOT MODELLED (caller-established).

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.DisasterGrantSeptemberZero

/-- 零 — the September special grant amount is zero. Unit 円; domain Nat. -/
def septemberGrantYen : Nat := 0

/-- 「額は零」: the amount equals zero. -/
def isZeroSeptemberGrant (yen : Nat) : Bool :=
  decide (yen == septemberGrantYen)

/-- The prescribed amount is zero. -/
theorem zero_true : isZeroSeptemberGrant 0 = true := by
  unfold isZeroSeptemberGrant septemberGrantYen
  decide

/-- One yen is not zero. -/
theorem one_false : isZeroSeptemberGrant 1 = false := by
  unfold isZeroSeptemberGrant septemberGrantYen
  decide

/-- Two yen is not zero. -/
theorem two_false : isZeroSeptemberGrant 2 = false := by
  unfold isZeroSeptemberGrant septemberGrantYen
  decide

end JapanTaxLaw.DisasterGrantSeptemberZero
