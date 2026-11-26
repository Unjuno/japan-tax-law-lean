import JapanTaxLaw.TaxFinance

/-
# CabinetOrderMattersDelegation — DELEGATION (前二項の規定の適用に関し必要な事項は、政令で定める。)

Pinned source:
  Law id: 422AC1000000049
  Revision: 422AC1000000049_20101029_000000000000000
  Source: data/raw/422AC1000000049_20101029_000000000000000.law.json (6629 bytes)
  sha256: 16b8272006935c29d3aea9a0cdbc61d37416ec1b06934ab7ae1ea043fc9ce13a
  Article: 第二条 (e-Gov Num 2), scoped article 302 chars.

原文逐語（pinned, 一字一句改変なし）:
  「前二項の規定の適用に関し必要な事項は、政令で定める。」

Norm kind: pure DELEGATION. Matters necessary for applying the preceding two
paragraphs (前二項) are prescribed by cabinet order (政令で定める). The model
expresses only the delegating authority flag and the covered paragraph range.

CRITICAL — 前二項の「二」は構造的な条項参照 (structural cross-reference: WHICH
paragraphs are covered), NOT a substantive numerical threshold. `paragraphRef`
is 2 solely because the needle points at 前二項; it is never used as an amount,
rate, age, period, or any other substantive threshold. No statutory rate applies
(parse_statutory_rate is None for this clause).

Variable contract (meaning / domain / type):
  paragraph : Nat — 対象となる前の項の番号 (the number of the preceding paragraph).
  result    : Bool — 政令委任の適用範囲か (whether the delegation covers it),
              true when paragraph <= paragraphRef (inclusive: 0, 1, 2).

Out of scope: the actual cabinet-order content, and the preceding paragraphs'
substance. No legal correctness claim; no human interpretation is modelled.
Proofs use only kernel reductions: `rfl` / `by decide`. No escapes.
-/

namespace JapanTaxLaw.CabinetOrderMattersDelegation

/-- 前二項: the structural cross-reference to the preceding two paragraphs.
    This 2 is a paragraph index, NOT a substantive threshold. -/
def paragraphRef : Nat := 2

/-- 政令で定める: the necessary matters are delegated to Cabinet Order. -/
def delegatedToCabinetOrder : Bool := true

/-- Whether the delegation covers a given preceding paragraph (前二項, inclusive).
    The bound is a structural paragraph cross-reference, not a threshold. -/
def appliesToParagraph (paragraph : Nat) : Bool := decide (paragraph <= paragraphRef)

/-- 前二項: structural cross-reference value 2 (not a substantive threshold). -/
theorem paragraphRef_is_two : paragraphRef = 2 := rfl

/-- 政令で定める: the delegation flag is true. -/
theorem delegatedToCabinetOrder_is_true : delegatedToCabinetOrder = true := rfl

/-- 前二項 includes paragraph 0 (inclusive structural range). -/
theorem appliesToParagraph_zero : appliesToParagraph 0 = true := by decide

/-- 前二項 includes paragraph 1. -/
theorem appliesToParagraph_one : appliesToParagraph 1 = true := by decide

/-- 前二項 includes paragraph 2 (the structural cross-reference itself). -/
theorem appliesToParagraph_two : appliesToParagraph 2 = true := by decide

/-- Paragraph 3 is outside 前二項: 3 > 2. -/
theorem appliesToParagraph_three : appliesToParagraph 3 = false := by decide

end JapanTaxLaw.CabinetOrderMattersDelegation
