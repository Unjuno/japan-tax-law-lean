import JapanTaxLaw.TransitionalHeadingsAndRefs
import JapanTaxLaw.TransitionalHeadingsAndRefsSpec

/-!
# TransitionalHeadingsAndRefsTests — 見出し・かな範囲・参照
-/
namespace JapanTaxLaw.TransitionalHeadingsAndRefsTests

open JapanTaxLaw.TransitionalHeadingsAndRefs

theorem range_spec (lo hi x : Nat) :
    inKanaRange lo hi x = true ↔ JapanTaxLaw.TransitionalHeadingsAndRefsSpec.rangeSpec lo hi x := by
  simp [inKanaRange, JapanTaxLaw.TransitionalHeadingsAndRefsSpec.rangeSpec]

theorem paragraph_spec (t : Nat) :
    paragraphRef t = JapanTaxLaw.TransitionalHeadingsAndRefsSpec.paragraphSpec t := by rfl

theorem connector_spec (x : Nat) :
    replacementConnector x = JapanTaxLaw.TransitionalHeadingsAndRefsSpec.connectorSpec x := by rfl

example : headingDeclared = true := rfl
example : parseKanaRange "イからニまで" = some (1, 4) := parse_range_i_ni
example : parseKanaRange "イ及びロ" = some (1, 2) := parse_range_i_ro
example (lo hi : Nat) (h : lo <= hi) : inKanaRange lo hi lo = true := kana_range_lower lo hi h
example (lo hi : Nat) (h : lo <= hi) : inKanaRange lo hi hi = true := kana_range_upper lo hi h
example (t : Nat) : paragraphRef t = t := paragraph_ref_identity t
example (x : Nat) : replacementConnector x = x := replacement_is_identity x

end JapanTaxLaw.TransitionalHeadingsAndRefsTests
