import JapanTaxLaw.CabinetOrderMattersDelegation

/-
# CabinetOrderMattersDelegationSpec — independent spec

Law id: 422AC1000000049, revision 422AC1000000049_20101029_000000000000000.
Article: 第二条 (e-Gov Num 2), pure DELEGATION, needle verbatim in scoped
Article 2 (302 chars): 「前二項の規定の適用に関し必要な事項は、政令で定める。」

This spec restates the delegation with its OWN `spec*` definitions, using no
implementation identifiers inside those definitions. The three agreement
bridges are the only place implementation names appear, and they use only
`unfold ... ; rfl`.

CRITICAL — the literal 2 here is the kanji 二 in 前二項, a STRUCTURAL paragraph
cross-reference (which paragraphs are covered), NOT a substantive threshold.
spec_literals = {2}; source_literals_verified({2}, scoped) True (二 in 前二項);
parse_statutory_rate is None (no 百分の rate in the clause).

Not modelled: cabinet-order content, the preceding paragraphs' substance.
-/

namespace JapanTaxLaw.CabinetOrderMattersDelegation

/-- Independent structural cross-reference: 前二項 (not a threshold). -/
def specParagraphRef : Nat := 2

/-- Independent delegation flag: 政令で定める. -/
def specDelegated : Bool := true

/-- Independent coverage predicate over preceding paragraph numbers (inclusive).
    The bound 2 is a structural cross-reference, never a substantive threshold. -/
def specApplies (p : Nat) : Bool := decide (p <= specParagraphRef)

/-- Bridge: the two structural cross-references agree (both are 前二項 = 二). -/
theorem agreeParagraphRef : paragraphRef = specParagraphRef := by
  unfold paragraphRef specParagraphRef
  rfl

/-- Bridge: both flags record 政令で定める. -/
theorem agreeDelegated : delegatedToCabinetOrder = specDelegated := by
  unfold delegatedToCabinetOrder specDelegated
  rfl

/-- Bridge: both coverage predicates enumerate 前二項 inclusively. -/
theorem agreeApplies (p : Nat) : appliesToParagraph p = specApplies p := by
  unfold appliesToParagraph specApplies paragraphRef specParagraphRef
  rfl

end JapanTaxLaw.CabinetOrderMattersDelegation
