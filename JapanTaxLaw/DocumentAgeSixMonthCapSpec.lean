import JapanTaxLaw.DocumentAgeSixMonthCap

/-
# DocumentAgeSixMonthCapSpec — 国外送金等調書施行規則 4(4)(3)ハ の独立定式

Pinned: law 409M50000040096, revision 409M50000040096_20250401_507M60000040027,
Article 4 Paragraph 4 Item 3 Subitem ハ; needle is the full unique unit leaf.

Independent restatement: a document is fresh when its creation month is not
after the presentation month and the presentation month is at most six months
after creation. Definitions use their own numerals and no impl identifiers;
the agreement theorem is a separate bridge.
-/

namespace JapanTaxLaw.DocumentAgeSixMonthCap

/-- 独立定式: 六月 = 6。 -/
def specLookback : Nat := 6

/-- 独立定式: created <= presentation <= created + 6。 -/
def specFresh (c : Nat) (p : Nat) : Bool :=
  c <= p && p <= c + specLookback

theorem agreeLookback : lookbackMonths = specLookback := by
  unfold lookbackMonths specLookback
  rfl

theorem agreeFresh (c p : Nat) :
    freshDocs c p = specFresh c p := by
  unfold freshDocs specFresh
  rw [agreeLookback]

example : specFresh 0 6 = true := by decide
example : specFresh 0 7 = false := by decide
example : specFresh 11 10 = false := by decide

end JapanTaxLaw.DocumentAgeSixMonthCap
